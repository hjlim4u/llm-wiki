---

title: "How GitHub Copilot Knows Your Code: Inside Its Indexing Magic"
source: "https://yasithrashan.medium.com/how-github-copilot-knows-your-code-inside-its-indexing-magic-aba59a0ce0e8"
author:
  - "[[Yasith Rashan]]"
published: 2025-10-22
created: 2026-03-10
description: Explores the multi-layered search strategies of GitHub Copilot Chat. Covers optimization methods based on project scale and state, ranging from full search for small workspaces to hybrid search combining remote indices with local diffs, as well as local embeddings and TF-IDF search.
tags:
  - GitHub_Copilot
  - AI/RAG
  - Jaccard_Similarity
  - Context_Retrieval
cover: "https://miro.medium.com/v2/resize:fit:1200/1*UuDOmwGtDAxWGL1DP5nwzg.png"
---
[Sitemap](https://yasithrashan.medium.com/sitemap/sitemap.xml)

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*UuDOmwGtDAxWGL1DP5nwzg.png)

***Image Credit:*** *GitHub Copilot Resources —* [*https://resources.github.com/copilot/*](https://resources.github.com/copilot/)

GitHub Copilot Chat isn’t just another AI assistant — it’s aware of your entire project. When you ask questions like *“Where is this function used?”* or *“How does authentication work in this app?”*, Copilot Chat seems to magically know the answer. But behind that magic lies a powerful process called **codebase indexing**.

In this article, we’ll explore how GitHub Copilot Chat for VS Code indexes your codebase, builds semantic understanding, and uses that context to generate accurate, project-aware responses. You’ll get a look under the hood of how Copilot transforms raw source files into an intelligent coding companion.

## How Copilot Chat Handles Your Query

When you send a message in VS Code Copilot Chat, the system instantly analyzes your input and context (editor, terminal, or workspace). It determines your **intent** by checking for commands like `/edit` or `/explain ` by inferring your goal.

For workspace queries, your message is processed by **GPT-4o-mini**, a fast model optimized for classification. It simultaneously rephrases your question and extracts keywords for searching. This process is kept highly efficient by a 20-token limit and a `;` stop token, ensuring you get accurate, context-aware answers without slowing down your workflow.

## The Code Search Strategy: A Multi-Tiered Approach

The system uses multiple search strategies, trying the fastest/best option first and falling back to alternatives if needed.

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*yiOlsZMCSggFpmc9X3LA4g.png)

### 1\. Full Workspace Search

The first and simplest method Copilot attempts is the “Full Workspace Search.” The core concept is straightforward: if your workspace is tiny enough, skip all complex searching and just include *every single file* in to the prompt.

This strategy completely ignores the user’s query and performs no relevance ranking. Its eligibility is determined by two rigid gates: first, it instantly fails if the file count exceeds a hard limit (e.g., 100 files) to avoid I/O on large repos. Second, if the file count passes, it reads all files in parallel, summing their token counts until either the entire workspace is processed or the cumulative total exceeds the token budget (e.g., 32,000 tokens), at which point it immediately cancels and fails.

### 2\. Code Search (Remote Index with Local Diff)

The second method Copilot attempts is “Code Search,” a hybrid strategy that leverages GitHub’s remote semantic search infrastructure while maintaining accuracy for local changes. Instead of scanning your entire workspace, Copilot queries GitHub’s pre-indexed repository and supplements it with a targeted search of locally modified files.

**Eligibility Gates:** This strategy has several rigid prerequisites. First, it instantly fails if the workspace has no GitHub remote or if the repository isn’t indexed on GitHub’s servers. Second, it calculates the local diff and immediately bails if more than 2,000 files have changed or if the diff exceeds 70% of the total workspace. Third, it requires valid GitHub authentication tokens to access the embeddings API.

**The Search Process:** When eligible, Copilot executes two searches in parallel. The remote search hits GitHub’s `/embeddings/code_search` API, receiving semantically ranked chunks from the indexed commit. Simultaneously, the local diff search begins with a 15-second timeout. For diffs under 300 files, it attempts embeddings search with an 8-second timeout, falling back to TF-IDF if exceeded. For diffs between 301-2,000 files, it skips embeddings entirely and uses only TF-IDF.

**Result Merging:** The merging logic prevents duplicates by filtering remote chunks to exclude files in the local diff, while local chunks include only diff files. This ensures unchanged files use GitHub’s fast indexed results, and modified files use current code state. If local search times out, the system proceeds with only remote results and displays a warning: *“Still updating workspace index. Response may be less accurate.”*

**Instant Indexing:** For “NotYetIndexed” repositories, Copilot attempts instant indexing by triggering GitHub’s index build and polling every second for up to 8 seconds. Small repositories can complete within this window, instantly upgrading search quality.

This strategy achieves sub-second search times for multi-million-line codebases while maintaining accuracy for actively edited files, making it the preferred method when GitHub’s infrastructure is available and the local diff remains manageable.

### 3\. Embeddings Search (Local Semantic)

The third method is “Embeddings Search,” a local semantic strategy that converts code chunks into high-dimensional vectors to enable similarity search based on conceptual meaning rather than keywords. Unlike Code Search’s remote infrastructure, this builds a local SQLite-backed embedding index.

**Eligibility Gates:** This strategy has strict workspace size limits by authentication tier. It instantly fails if the workspace exceeds 750 files by default, or 50,000 files with an upgraded Copilot token (after prompting the user once). It requires a valid Copilot token to access the `/embeddings/chunks` API.

**The Indexing Process:** The system checks SQLite cache for existing embeddings keyed by URI and content version. For cache misses, it sends file contents to the chunking endpoint which returns semantic chunks (100–250 tokens each) with 512-dimensional embedding vectors, then stores them in SQLite with aggressive performance pragmas. A 750-file workspace typically indexes in 30–60 seconds.

**Search Execution:** At search time, the query is converted to an embedding vector. The system performs a linear scan computing dot product similarity between the query and each chunk embedding, ranking by similarity descending. Search completes in 500–2000ms for indexed workspaces.

**Incremental Updates:** File system listeners trigger re-indexing of only changed files using a debounced `Delayer`, invalidating cache entries and fetching new embeddings. Deletions are handled via `CASCADE` foreign key constraints.

This strategy achieves high-quality semantic search for small-to-medium workspaces but is limited by API latency and size constraints.

### Chunking: Converting Files Into Searchable Pieces

Before any search strategy executes, files are broken into smaller “chunks” that fit within token limits. The system uses two distinct chunking approaches depending on the strategy.

**Server-Side Chunking (GitHub API):** Used for embeddings and code search, this sends entire files to GitHub’s `/embeddings/chunks` endpoint which performs AST-aware parsing. The API returns chunks of 100-250 tokens (10-30 lines) with byte offsets, line ranges, and optional 512-dimensional embeddings. Chunks are cached by hash in SQLite; unchanged files return only `{ hash: "abc123" }` without recomputing. Rate limiting is adaptive: 8 concurrent requests at 40/second baseline, throttling when quota exceeds 80%, with automatic retry for 429/403/408 errors.

**Client-Side Chunking (NaiveChunker):** Used for TF-IDF search, this performs token-based line chunking locally with zero API calls. It accumulates lines into a buffer until the next line would exceed 250 tokens, then emits the chunk. It removes common leading whitespace (“dedenting”) to normalize indentation and filters empty lines and chunks with fewer than 2 word characters. This completes in 10–50ms per file, ideal for TF-IDF’s 25,000-file workload.

**Token Budget Rationale:** The 250-token limit balances context (large enough for complete logical units like functions or methods) against precision (small enough to avoid diluting relevance). This typically captures one cohesive code block while remaining granular for accurate search results.

The chunking system trades quality for speed: server-side chunking produces semantically superior chunks via AST parsing but incurs 100–300ms network latency per file, while client-side chunking sacrifices semantic awareness for 10–50ms local compute.

### 4\. TF-IDF Search (Keyword Matching)

The fourth method is “TF-IDF Search,” a simple keyword-matching approach that runs entirely on your computer in a background thread with SQLite storage, avoiding API dependencies but sacrificing semantic understanding for speed. Think of it like a smart word counter: it finds chunks containing your search terms and ranks them by how rare and frequent those words are.

**Eligibility Gates:** This strategy only fails if your workspace has more than 25,000 files. It needs no authentication and works completely offline.

**The Indexing Process:** The system sends file paths to a background worker, which checks if each file needs updating. For new or changed files, it reads the content, splits it into words (tokens), breaks it into chunks, and counts how often each word appears. A typical workspace with 25,000 files indexes in 2–5 seconds.

**Scoring Algorithm:** When you search, it finds all chunks containing any of your search words. For each chunk, it calculates a score: common words (like “function”) score lower, while rare words (like “authenticate”) score higher. Results within 75% of the top score are kept and sorted. Search finishes in 100–500ms.

**Hybrid Enhancement:** When searching locally changed files in Code Search (300–2,000 files), the system first uses TF-IDF to quickly narrow down to ~128 candidate chunks, then optionally upgrades them with semantic embeddings for better ranking. This gives you TF-IDF’s speed with embeddings’ accuracy.

This strategy is the ultimate safety net — it always works, even when you’re offline or other methods fail.

Ultimately, GitHub Copilot’s indexing magic isn’t a single trick, but a masterclass in pragmatic engineering. By layering four distinct search strategies — each with its own trade-offs between semantic understanding, speed, and offline capability — it delivers a remarkably resilient and context-aware experience. This intelligent, cascading approach ensures that no matter the size of your project or the state of your connection, Copilot always has a way to help, pointing toward a future where our tools don’t just understand commands, but the very context of our work.

*Note: This analysis is based on the architecture and logic found within the VS Code Copilot Chat GitHub repository. You can explore the repository here:* [*https://github.com/microsoft/vscode-copilot-chat*](https://github.com/microsoft/vscode-copilot-chat)

## More from Yasith Rashan

## Recommended from Medium

[

See more recommendations

](https://medium.com/?source=post_page---read_next_recirc--aba59a0ce0e8---------------------------------------)
