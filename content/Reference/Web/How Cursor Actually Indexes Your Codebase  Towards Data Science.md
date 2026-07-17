---

title: How Cursor Actually Indexes Your Codebase
source: https://towardsdatascience.com/how-cursor-actually-indexes-your-codebase/
author:
  - "[[Kenneth Leung]]"
published: 2026-01-27
created: 2026-03-10
description: Exploring the RAG pipeline in Cursor that powers code indexing and retrieval for coding agents
tags:
  - Cursor
  - Codebase_Indexing
  - AI/RAG/Semantic_Search
  - Merkle_Tree
  - AST_Chunking
  - Data_Privacy
cover: https://towardsdatascience.com/wp-content/uploads/2026/01/yancy-min-842ofHC6MaI-unsplash-2.jpg
---
We value your privacy

Powered by

[Skip to content](https://towardsdatascience.com/how-cursor-actually-indexes-your-codebase/#wp--skip-link--target)

Exploring the RAG pipeline in Cursor that powers code indexing and retrieval for coding agents

10 min read

![](https://towardsdatascience.com/wp-content/uploads/2026/01/yancy-min-842ofHC6MaI-unsplash-2.jpg)

Photo by Yancy Min on Unsplash

If you have used modern integrated development environments (IDEs) paired with coding agents, you have likely seen code suggestions and edits that are surprisingly accurate and relevant.

This level of quality and precision comes from the agents being grounded in a deep understanding of your codebase.

Take Cursor as an example. In the **Index & Docs** tab, you can see a section showing that Cursor has already “ingested” and indexed your project’s codebase:

![](https://contributor.insightmediagroup.io/wp-content/uploads/2026/01/1ptgxOi6-rGsj3LXSGplpsQ.png)

Indexing & Docs section in the Cursor Settings tab | Image by author

So how do we build a comprehensive understanding of a codebase in the first place?

At its core, the answer is **retrieval-augmented generation (RAG)**, a concept many readers may already be familiar with. Like most RAG-based systems, these tools rely on **semantic search** as a key capability.

Rather than organizing knowledge purely by raw text, the codebase is indexed and retrieved based on meaning.

This allows natural-language queries to fetch the most relevant codes, which coding agents can then use to reason, modify, and generate responses more effectively.

In this article, we explore the **RAG pipeline** in Cursor that enables coding agents to do its work using contextual awareness of the codebase.

### Contents

> ***(1)** [Exploring the Codebase RAG Pipeline](https://towardsdatascience.com/how-cursor-actually-indexes-your-codebase/#section-one)  
> **(2)** [Keeping Codebase Index Up to Date](https://towardsdatascience.com/how-cursor-actually-indexes-your-codebase/#section-two)  
> **(3)** [Wrapping It Up](https://towardsdatascience.com/how-cursor-actually-indexes-your-codebase/#section-three)*

---

## (1) Exploring the Codebase RAG Pipeline

Let’s explore the steps in Cursor’s RAG pipeline for indexing and contextualizing codebases:

### Step 1 — Chunking

In most RAG pipelines, we first have to manage data loading, text preprocessing, and document parsing from multiple sources.

However, when working with a codebase, much of this effort can be avoided. Source code is already well structured and cleanly organized within a project repo, allowing us to skip the customary document parsing and move straight into chunking.

In this context, the goal of chunking is to break code into **meaningful, semantically coherent units** (e.g., functions, classes, and logical code blocks) rather than splitting code text arbitrarily.

Semantic code chunking ensures that each chunk captures the essence of a particular code section, leading to more accurate retrieval and useful generation downstream.

To make this more concrete, let’s look at how code chunking works. Consider the following example Python script (don’t worry about what the code does; the focus here is on its structure):

After applying code chunking, the script is cleanly divided into four structurally meaningful and coherent chunks:

As you can see, the chunks are meaningful and contextually relevant because they respect code semantics. In other words, chunking avoids splitting code in the middle of a logical block unless required by size constraints.

In practice, it means chunk splits tend to be created between functions rather than inside them, and between statements rather than mid-line.

> For the example above, I used [**Chonkie**](https://docs.chonkie.ai/oss/chunkers/code-chunker), a lightweight open-source framework designed specifically for code chunking. It provides a simple and practical way to implement code chunking, amongst many other chunking techniques available.

---

#### \[Optional Reading\] Under the Hood of Code Chunking

The code chunking above is not accidental, nor is it achieved by naively splitting code using character counts or regular expressions.

It begins with an understanding of the code’s syntax. The process typically starts by using a source code parser (such as **tree-sitter**) to convert the raw code into an [**abstract syntax tree**](https://en.wikipedia.org/wiki/Abstract_syntax_tree) **(AST)**.

An abstract syntax tree is essentially a tree-shaped representation of code that captures its structure, and not the actual text. Instead of seeing code as a string, the system now sees it as logical units of code like functions, classes, methods, and blocks.

Consider the following line of Python code:

```python
x = a + b
```

Rather than being treated as plain text, the code is converted into a conceptual structure like this:

```python
Assignment
├── Variable(x)
└── BinaryExpression(+)
├── Variable(a)
└── Variable(b)
```

This structural understanding is what enables effective code chunking.

Each meaningful code construct, such as a function, block, or statement, is represented as **a node in the syntax tree**.

![](https://contributor.insightmediagroup.io/wp-content/uploads/2026/01/17ymFGgaXNJT9n2gJwa26jg.png)

Sample illustration of a simple abstract syntax tree | Image by author

**Instead of operating on raw text, the chunking works directly on the syntax tree.**

The chunker will traverse these nodes and groups adjacent ones together until a token limit is reached, producing chunks that are semantically coherent and size-bounded.

Here is an example of a slightly more complicated code and the corresponding abstract syntax tree:

```python
while b != 0:
    if a > b:
        a := a - b
    else:
        b := b - a
return
```
![](https://contributor.insightmediagroup.io/wp-content/uploads/2026/01/image-169-908x1024.png)

Example of abstract syntax free | Image used under Creative Commons

---

### Step 2 — Generating Embeddings and Metadata

Once the chunks are prepared, a [custom embedding model](https://cursor.com/blog/semsearch#:~:text=To%20support%20semantic%20search%2C%20we%E2%80%99ve%20trained%20our%20own%20embedding%20model) is applied to generate a vector representation (aka embeddings) for each code chunk.

These embeddings capture the semantic meaning of the code, enabling retrieval for user queries and generation prompts to be matched with semantically related code, even when exact keywords do not overlap.

This significantly improves retrieval quality for tasks such as code understanding, refactoring, and debugging.

Beyond generating embeddings, another critical step is **enriching each chunk with relevant metadata.**

For example, metadata such as the **file path and the corresponding code line range** for each chunk is stored alongside its embedding vector.

This metadata not only provides important context about where a chunk comes from, but also enables metadata-based keyword filtering during retrieval.

---

### Step 3 — Enhancing Data Privacy

As with any RAG-based system, data privacy is a primary concern. This naturally raises the question of **whether file paths themselves may contain sensitive information.**

In practice, file and directory names often reveal more than expected, such as internal project structures, product codenames, client identifiers, or ownership boundaries within a codebase.

**As a result, file paths are treated as sensitive metadata and require careful handling.**

To address this, Cursor applies **file path obfuscation** (aka path masking) on the client side before any data is transmitted. Each component of the path, split by `/` and `.`, is masked using a secret key and a small fixed nonce.

This approach hides the actual file and folder names while preserving enough directory structure to support effective retrieval and filtering.

For example, `src/payments/invoice_processor.py` may be transformed into `a9f3/x72k/qp1m8d.f4`.

> Note: Users can control which parts of their codebase are shared with Cursor by utilizing a `.cursorignore` file. Cursor makes a best effort to prevent the listed content from being transmitted or referenced in LLM requests.

---

### Step 4— Storing Embeddings

Once generated, the chunk embeddings (with the corresponding metadata) are stored in a vector database using [**Turbopuffer**](https://www.google.com/search?q=Turbopuffer&rlz=1C1GCMM_enSG1156__1156&oq=what+is+turbopuffer&gs_lcrp=EgZjaHJvbWUyCQgAEEUYORiABDIICAEQABgWGB4yDQgCEAAYhgMYgAQYigUyDQgDEAAYhgMYgAQYigUyBwgEEAAY7wUyCggFEAAYgAQYogQyCggGEAAYgAQYogTSAQg0MzIyajBqNKgCALACAQ&sourceid=chrome&ie=UTF-8&mstk=AUtExfCSHqndAaYNZwW-0RTtJQJ_eckVd2YaPn4c0T80onRlEEhjQ7Wm9PumRBwlOJeVqnJo7e8G4ww4kSCwCLZKgkYu2GrL01PES94Xarks6AZd2DBLC3s6PqBWaOp9Ctl52xQIjp5djhwirdIjbs4mZMhR5okr0CtZiRpI3pyaRdadedEowRfIyaIkGGhfrD2ziV-SacrAQ0tFL49kOojDdvyrxqidxAdPsryqtUl97Vhdkg85dpOsdCHVD28EgWx2lEnFSHrcLX-sz0ehQRa_insLIduWGLG9xnOn3OiR5rUtrEtQi1wYSQ7ToNpK8h_2PzYecCmYMmUZnEQX1-gOrf0cV7d1ZqykYjTArpRLV1ry4ZjRq65SK8k06V_XWVcGOJY10uDRwaWhr5i0W6t2KQ&csui=3&ved=2ahUKEwj6gcLGzJySAxUFTGwGHTSCGWIQgK4QegQIARAB), which is optimized for fast semantic search across millions of code chunks.

**Turbopuffer** is a serverless, high-performance search engine that combines vector and full-text search and is backed by low-cost object storage.

To speed up re-indexing, embeddings are also cached in AWS and keyed by the hash of each chunk, allowing unchanged code to be reused across subsequent indexing execution.

From a data privacy perspective, it is important to note that **only embeddings and metadata are stored in the cloud.** It means that our original source code remains on our local machine and is **never stored** on Cursor servers or in Turbopuffer.

---

### Step 5 — Running Semantic Search

When we submit a query in Cursor, it is first converted into a vector using the same embedding model for the chunk embeddings generation. It ensures that both queries and code chunks live in the same semantic space.

From the perspective of semantic search, the process unfolds as follows:

1. Cursor compares the query embedding against code embeddings in the vector database to identify the most semantically similar code chunks.
2. These candidate chunks are returned by Turbopuffer in ranked order based on their similarity scores.
3. Since raw source code is never stored in the cloud or the vector database, the search results consist only of **metadata, specifically the masked file paths and corresponding code line ranges.**
4. By resolving the metadata of decrypted file paths and line ranges, the local client is then able to retrieve the actual code chunks from the local codebase.
5. The retrieved code chunks, in its original text form, are then provided as context alongside the query to the LLM to generate a context-aware response.

As part of a hybrid approach (semantic + regex pattern) strategy, the coding agent can also use tools such as `grep` and `ripgrep` to locate code snippets based on exact string matches.

> [**OpenCode**](https://opencode.ai/) is a popular open-source coding agent framework available in the terminal, IDEs, and desktop environments.  
>   
> Unlike Cursor, it works directly on the codebase using text search, file matching, and LSP-based navigation rather than embedding-based semantic search.  
>   
> As a result, OpenCode provides strong structural awareness but lacks the deeper semantic retrieval capabilities found in Cursor.

As a reminder, our original source code is **not** stored on Cursor servers or in Turbopuffer.

However, when answering a query, Cursor still needs to temporarily pass the relevant original code chunks to the coding agent so it can produce an accurate response.

This is because the chunk embeddings cannot be used to directly reconstruct the original code.

Plain text code is retrieved only at inference time and only for the specific files and lines needed. **Outside of this short-lived inference runtime, the codebase is not stored or persisted remotely.**

---

## (2) Keeping Codebase Index Up to Date

### Overview

Our codebase evolves quickly as we either accept the agent-generated edits or as we make manual code changes.

To keep semantic retrieval accurate, Cursor automatically synchronizes the code index through periodic checks, typically every five minutes.

During each sync, the system securely detects changes and refreshes only the affected files by removing outdated embeddings and generating new ones.

In addition, files are processed in batches to optimize performance and minimize disruption to our development workflow.

### Using Merkle Trees

So how does Cursor make this work so seamlessly? It scans the opened folder and computes **a Merkle tree of file hashes**, which allows the system to efficiently detect and track changes across the codebase.

Alright, so what is a Merkle tree?

It is a data structure that works like a system of digital cryptographic fingerprints, allowing changes across a large set of files to be tracked efficiently.

Each code file is converted into a short fingerprint, and these fingerprints are combined hierarchically into a single top-level fingerprint that represents the entire folder.

**When a file changes, only its fingerprint and a small number of related fingerprints need to be updated.**

![](https://contributor.insightmediagroup.io/wp-content/uploads/2026/01/15zzKu_CwbE5nN9MVobc5TQ.png)

Illustration of a Merkle tree | Image used under Creative Commons

The Merkle tree of the codebase is synced to the Cursor server, which periodically checks for fingerprint mismatches to identify what has changed.

As a result, it can pinpoint which files were modified and update only those files during index synchronization, keeping the process fast and efficient.

### Handling Different File Types

Here is how Cursor efficiently handles different file types as part of the indexing process:

- **New files:** Automatically added to index
- **Modified files:** Old embeddings removed, fresh ones created
- **Deleted files:** Promptly removed from index
- **Large/complex files:** May be skipped for performance

> Note: Cursor’s codebase indexing begins automatically whenever you open a workspace.

---

## (3) Wrapping It Up

In this article, we looked beyond LLM generation to explore the pipeline behind tools like Cursor that builds the right context through RAG.

By chunking code along meaningful boundaries, indexing it efficiently, and continuously refreshing that context as the codebase evolves, coding agents are able to deliver far more relevant and reliable suggestions.

---

Written By

Kenneth Leung

Towards Data Science is a community publication. Submit your insights to reach our global audience and earn through the TDS Author Payment Program.

[Write for TDS](https://towardsdatascience.com/questions-96667b06af5/)

## Related Articles

- ![](https://towardsdatascience.com/wp-content/uploads/2023/11/17MonaLlO4zTNeFQT0ATKbw.png)
	## Using LLMs to evaluate LLMs
	You can ask ChatGPT to act in a million different ways: as your nutritionist, language…
	8 min read
- ![](https://towardsdatascience.com/wp-content/uploads/2023/11/1R-fWNo-SVYYmm_tepIoVuw.jpeg)
	## A beginner’s guide to building a Retrieval Augmented Generation (RAG) application from scratch
	\# Retrieval Augmented Generation, or RAG, is all the rage these days because it introduces…
	12 min read
- ## Take a Look Under the hood
	Using Monosemanticity to understand the concepts a Large Language Model learned
	13 min read
- ## Interacting with large language models
	Enriching prompts to steer the model – explained for non-experts
	12 min read
- ## 5 Ways Generative AI Changes How Companies Approach Data (And How It Doesn’t)
	Experts from venture capital, Snowflake, and more discuss how generative AI will benefit data teams…
	13 min read
- ## Different ways of training LLMs
	And why prompting is none of them
	13 min read
- ![](https://towardsdatascience.com/wp-content/uploads/2023/09/1J16KiNF4M_XxPkALZFUJHw-scaled.jpeg)
	## 10 Ways to Improve the Performance of Retrieval Augmented Generation Systems
	Tools to go from prototype to production
	11 min read

Some areas of this page may shift around if you resize the browser window. Be sure to check heading and document order.
