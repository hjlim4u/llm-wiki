---

title: "Text chunking strategies"
source: "https://anthropic.skilljar.com/claude-with-the-anthropic-api/287776"
author:
  - "[[Anthropic Courses]]"
published:
created: 2026-03-24
description: "Text chunking is one of the most critical steps in building a RAG (Retrieval Augmented Generation) pipeline. How you break up your documents directly impacts the quality of your entire system. A poor chunking strategy can lead to irrelevant context being inserted into your prompts, causing your AI to give completely wrong answers."
tags:
  - AI/RAG/Chunking
  - Pre_Processing
cover: "https://cdn.sanity.io/images/4zrzovbb/website/c4bd33e7c8e809a2f9a9a5896ee13961e2a738ec-2400x1260.png"
---
![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542228%2F07_-_002_-_Text_Chunking_Strategies_01.1748542228739.jpg)

Consider this example: you have a document with sections on medical research and software engineering. If you chunk poorly, a user asking "How many bugs did engineers fix this year?" might get information about medical research instead of software engineering, simply because the medical section happened to contain the word "bug" in a different context.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542229%2F07_-_002_-_Text_Chunking_Strategies_04.1748542229353.jpg)

This is why choosing the right chunking strategy matters so much. Let's explore three main approaches.

## Size-Based Chunking

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542230%2F07_-_002_-_Text_Chunking_Strategies_05.1748542229862.jpg)

Size-based chunking is the simplest approach - you divide your text into strings of equal length. If you have a 325-character document, you might split it into three chunks of roughly 108 characters each.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542230%2F07_-_002_-_Text_Chunking_Strategies_06.1748542230454.jpg)

This method is easy to implement and works with any type of document, but it has clear downsides:

- Words get cut off mid-sentence
- Chunks lose important context from surrounding text
- Section headers might be separated from their content
![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542231%2F07_-_002_-_Text_Chunking_Strategies_07.1748542230923.jpg)

To address these issues, you can add overlap between chunks. This means each chunk includes some characters from the neighboring chunks, providing better context and ensuring complete words and sentences.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542231%2F07_-_002_-_Text_Chunking_Strategies_08.1748542231502.jpg)

Here's a basic implementation:

```js
def chunk_by_char(text, chunk_size=150, chunk_overlap=20):
    chunks = []
    start_idx = 0
    
    while start_idx < len(text):
        end_idx = min(start_idx + chunk_size, len(text))
        chunk_text = text[start_idx:end_idx]
        chunks.append(chunk_text)
        
        start_idx = (
            end_idx - chunk_overlap if end_idx < len(text) else len(text)
        )
    
    return chunks
```

## Structure-Based Chunking

Structure-based chunking divides text based on the document's natural structure - headers, paragraphs, and sections. This works great when you have well-formatted documents like Markdown files.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748542232%2F07_-_002_-_Text_Chunking_Strategies_09.1748542232356.jpg)

For a Markdown document, you can split on header markers:

```js
def chunk_by_section(document_text):
    pattern = r"\n## "
    return re.split(pattern, document_text)
```

This approach gives you the cleanest, most meaningful chunks because each one represents a complete section. However, it only works when you have guarantees about your document structure. Many real-world documents are plain text or PDFs without clear structural markers.

## Semantic-Based Chunking

Semantic-based chunking is the most sophisticated approach. You divide text into sentences, then use natural language processing to determine how related consecutive sentences are. You build chunks from groups of related sentences.

This method is computationally expensive but produces the most relevant chunks. It requires understanding the meaning of individual sentences and is more complex to implement than the other strategies.

## Sentence-Based Chunking

A practical middle ground is chunking by sentences. You split the text into individual sentences using regular expressions, then group them into chunks with optional overlap:

```js
def chunk_by_sentence(text, max_sentences_per_chunk=5, overlap_sentences=1):
    sentences = re.split(r"(?<=[.!?])\s+", text)
    
    chunks = []
    start_idx = 0
    
    while start_idx < len(sentences):
        end_idx = min(start_idx + max_sentences_per_chunk, len(sentences))
        current_chunk = sentences[start_idx:end_idx]
        chunks.append(" ".join(current_chunk))
        
        start_idx += max_sentences_per_chunk - overlap_sentences
        
        if start_idx < 0:
            start_idx = 0
    
    return chunks
```

## Choosing Your Strategy

Your choice depends entirely on your use case and document guarantees:

- **Structure-based**: Best results when you control document formatting (like internal company reports)
- **Sentence-based**: Good middle ground for most text documents
- **Size-based**: Most reliable fallback that works with any content type, including code

Size-based chunking with overlap is often the go-to choice in production because it's simple, reliable, and works with any document type. While it may not give perfect results, it consistently produces reasonable chunks that won't break your pipeline.

Remember: there's no single "best" chunking strategy. The right approach depends on your specific documents, use cases, and the trade-offs you're willing to make between implementation complexity and chunk quality.

#### Downloads

- [001\_chunking.ipynb](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic-poc/assets/1748558508/001_chunking.ipynb?response-content-disposition=attachment&Expires=1774329399&Signature=oSTv5L61pwr3xk-iDsjC35w9b~n0hoNi87LBwVpoDiUERQXs1erL6twlRH6cNxi~YXzb6MM9Poxw3guOktNXNBEwSrx38q5OS95Y8TgnehvIq-d0KVv8R3-R9aR1g82-vlwhI0bjyH14aZr8eQPXMz~ecj-rpC9OHZ9ADgXWb9gs1p2gv7RKLC7A4qQGGAVIqEOcHK2Zu7qpSrzhbcX56QLcjZ9BJMSUswIFaQ~P91TJn1PzXJb5uWV3rb2H3jEP11-ubI9ywwmyRPkj6xTGLQ46rW0kDR9A7IDMmrUHYVsBIPnnoSaxeH8poUaz7bo7g~Rq8Zhg9Lab49rXWlM8ag__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
- [report.md](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic-poc/assets/1748558508/report.md?response-content-disposition=attachment&Expires=1774329399&Signature=FsClAxT~KBX4ZcSPeHegXzpP~Ozb7KfeSEigCaYpGJkwTPUvOMELWesKbM9dkTqJsDOTfxbiblJ0~Mdoi6vuJbThqBfhvaPUPEIpK~oJtSlAZIYVoN78exQy30JaZjOTz6babGaJV3hQN93UL8tD1KO8Ku39bFdBOdAN6qntH7G~DJ8-CRhVF9PwhswqFE8vSKdL~kgAPNubbKtJgN-cQIYOi0xv2-rI0B4SlJ~rhcMB0yGsObmMK9Vhfqci6AGg-Jg9gbI28PL-F7AqcdF-nREsXMxqTjvatk3xDi8dCMStn4XmEu0BBA4tAIM-lOfnXZewPUCKLq0BlCuI0S0SXw__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)[Previous - Introducing Retrieval Augmented Generation](https://anthropic.skilljar.com/claude-with-the-anthropic-api/287763 "Introducing Retrieval Augmented Generation")Text chunking strategies

Text embeddings Next

[Complete](https://anthropic.skilljar.com/claude-with-the-anthropic-api/287776#)
