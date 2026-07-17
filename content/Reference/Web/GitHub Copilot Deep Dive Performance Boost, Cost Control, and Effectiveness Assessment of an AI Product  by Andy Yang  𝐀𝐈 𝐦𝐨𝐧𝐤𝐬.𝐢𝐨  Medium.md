---

title: "GitHub Copilot Deep Dive: Performance Boost, Cost Control, and Effectiveness Assessment of an AI…"
source: "https://medium.com/aimonks/github-copilot-deep-dive-performance-boost-cost-control-and-effectiveness-assessment-of-an-ai-866fcb1f79c0"
author:
  - "[[Andy Yang]]"
published: 2023-08-09
created: 2026-03-10
description: Analyzes the internal workings of GitHub Copilot. Explains client-side prompt engineering (prefix/suffix construction, similar code snippet extraction), interception strategies for model call cost control, and the process of performance evaluation and data flywheel construction through telemetry.
tags:
  - AI_Tool/GitHub_Copilot
  - AI/RAG/Code_Search
  - Productivity
cover: "https://miro.medium.com/v2/resize:fit:1200/1*YBxK689d-tprbEnhkPuhdQ.png"
---
[Sitemap](https://medium.com/sitemap/sitemap.xml)## [𝐀𝐈 𝐦𝐨𝐧𝐤𝐬.𝐢𝐨](https://medium.com/aimonks?source=post_page---publication_nav-63e328c0fcb7-866fcb1f79c0---------------------------------------)

[![𝐀𝐈 𝐦𝐨𝐧𝐤𝐬.𝐢𝐨](https://miro.medium.com/v2/resize:fill:48:48/1*KtRC6dGKwc4Le3eU_6yymw.jpeg)](https://medium.com/aimonks?source=post_page---post_publication_sidebar-63e328c0fcb7-866fcb1f79c0---------------------------------------)

AImonks ([https://medium.com/aimonks](https://medium.com/aimonks)) is an AI-Educational Publication.

![](https://miro.medium.com/v2/resize:fit:640/format:webp/0*-9MICNd4dAjUSH6U)

Recently, I have used coding assistants like GitHub Copilot in actual projects. This field is still developing rapidly, with many followers including but not limited to:

- Cursor — The AI-first Code Editor
- AI assistant for software developers | Tabnine
- AI code generator — Amazon CodeWhisperer — AWS
- Ghostwriter — Code faster with AI — Replit
- StarCoder: A State-of-the-Art LLM for Code

To build a good coding copilot, the backend code generation model (e.g. Codex used by GitHub Copilot) is crucial. Meanwhile, the client side engineering, such as the VSCode plugin, is also important. Influenced by Copilot website examples, you may think like me that we just need to send our coding needs as comments or function definitions directly to the Codex model, and it will generate the code we want. This simplified prompt is also used by many projects (such as StarCoder, Tabnine, etc.). However, programmers know that the context of a program is definitely not just the function definition and comments before the cursor in the current file. It also includes parts after the cursor, referenced files, related files (such as other files in the same Python module, header files in C language), and so on. How to better utilize these contexts and provide the model with more abundant information input within the limited prompt length are important issues that coding copilots need to pay special attention to during engineering.

As the industry leader, GitHub Copilot is a commercial product without open source, so we cannot see how it works. However, there are always curious, smart, and sharing minds who want to figure out the internal mechanisms of new things, and then share them with the public. Fortunately, on GitHub Copilot, I met online Thakkarparth007. He was very curious about how GitHub Copilot works, and he has very strong hacking skills. By reverse engineering GitHub Copilot’s VSCode plugin, he cracked the secrets of GitHub Copilot client. He generously shared by writing a specific article and developing a related code visualization repository:

> Article: copilot-explorer
> 
> [https://thakkarparth007.github.io/copilot-explorer/posts/copilot-internals](https://thakkarparth007.github.io/copilot-explorer/posts/copilot-internals)
> 
> Code: Copilot-Explorer
> 
> [https://thakkarparth007.github.io/copilot-explorer/](https://thakkarparth007.github.io/copilot-explorer/)
> 
> Later I found out Chinese engineers did similar work:
> 
> It took me half a month to reverse engineer Github Copilot
> 
> [https://zhuanlan.zhihu.com/p/639993637](https://zhuanlan.zhihu.com/p/639993637)

It describes the reverse engineering process and the details of prompt generation in more detail.

Based on the two articles above, let’s summarize how GitHub Copilot works on the client side.

## Scenario

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*YBxK689d-tprbEnhkPuhdQ.png)

Coding Copilot Architecture

To help everyone better understand how GitHub Copilot works, let me briefly introduce its working scenario. Programmers usually write code in an IDE (integrated development environment). As shown in the figure above, programmer A is writing a Python program to parse daily income and expenditure records. So he opened a file called parse\_expenses.py and prepared to implement a function called parse\_expenses. This function contains:

- Function signature: The def parse\_expenses(expenses\_string) part, used to identify a module with certain functionality.
- Comments: The part included in “””, used to explain what this function does and how it works, with examples.
- Function body: The part marked with a green rectangle, which is the specific implementation of the function.

Without Copilot, A would have to type all the above content one letter at a time, commonly known as “programming”. With the help of Copilot, magical things start to happen after A types the second “””: the function body is automatically generated, first appearing in gray font; A checks the AI-generated code, and if there are no problems (with high probability), he only needs to press the Tab key, and this code segment is accepted and becomes part of the code base in beautiful color, this is “AI-assisted programming”.

Next, let’s elaborate on the specific working principles, including:

- Prompt Engineering
- Model Invocation
- Telemetry

## Performance Boost — Prompt Engineering

## Composition of Prompt

The final prompt sent to the Codex model is as follows:

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*ldhAmMj7WnIcsoFIQsdc5Q.png)

It includes:

- isFimEnable: Whether it is Fill-in-middle mode. If the suffix part is not empty, it is Fill-in-middle mode, namely “Inserting code” in the OpenAI official documentation: [https://platform.openai.com/docs/guides/code/inserting-code](https://platform.openai.com/docs/guides/code/inserting-code).
- suffix: The suffix part of the prompt, which refers to the part after the current cursor position in the insert code scenario. Since the prompt length is limited, the length of the suffix is also limited by the system parameter suffixPercent, which is set to 15% by default. That is, the suffix part cannot exceed 15% of the maximum number of input tokens for the prompt.
- prefix: The prefix part. This prefix includes not only the part before the current cursor in the current file, but also similar code snippets from other related files. The prefix calculates the most important context for the current coding position for the AI. The prefix takes up 85% of the total prompt length by default. See [https://thakkarparth007.github.io/copilot-explorer/posts/prompt-full](https://thakkarparth007.github.io/copilot-explorer/posts/prompt-full) for details of the expanded prefix in the screenshot above.
- promptElementRanges: The range of various elements in the prompt. It explains the composition of the prefix:
- (1) PathMarker: The path of the current document, the prefix string index 0~23 part. That is: # Path: codeviz\\app.py.
- (2) SimilarFile: Code snippets from similar files, the prefix string index 23~2219 string part, the part that starts with the comment `#Compare this snippet from`.
- (3) BeforeCursor: As the name suggests, the part before the cursor in this file, the prefix string index 2219~3142 part, the remaining part without comments.

In summary:

![](https://miro.medium.com/v2/resize:fit:640/format:webp/0*RdOk0PPaow6Xqp9o)

## Generation of prefix

The main content is the calculation of the prefix part of the prompt. It includes:

- BeforeCursor, the content before the cursor, is the most intuitive context
- SimilarFile, content with high similarity to the current file
- ImportedFile, imported dependent files (now only implemented for TypeScript)
- LanguageMarker, language markers, identifying programming languages used, such as Python, PHP, Java, etc.
- PathMarker, path information of files

Among them, the SimilarFile part, which obtains code snippets with high similarity to the current file, is the most important supplement to BeforeCursor and is important contextual information. The calculation method is as follows:

- Query the last accessed (up to) 20 files with the same language as the current one, referred to as candidate files, for extracting similar code snippets.
- The logic for extracting similar code snippets is:
- (1) Tokenize the current file, and filter out common keywords in programming (such as if, for, etc.) to obtain the current file token set A
- (2) Traverse the candidate files with a sliding window (size 60 lines, slide one line at a time), tokenize and filter on the sliding window to obtain token set B
- (3) Calculate the Jaccard similarity between set A and set B: J(A, B) = Number of tokens in the intersection of AB / Number of tokens in the union of AB, which is to calculate the overlap between the two sets
- (4) Take the code snippets corresponding to the top N sliding windows with the highest similarity as similar code snippets

Then, text processing is performed according to the following priority (high to low), and then combined and spliced into the prefix prefix part:

- beforeCursor
- importedFile
- Snippet
- pathMarker
- languageMarker

Then assemble into the complete prompt sent to the backend big model for code generation as shown above.

In summary, the above is the entire prompt generation process of Copilot. As understood in [Hardcore Prompt Appreciation: How “Engineering” Can Prompts Be](https://www.jiqizhixin.com/articles/2022-08-03-6), this is a dynamic process: each keystroke requires recalculating the corresponding prompt; how to calculate reflects the team’s understanding of the user’s use of the product scene; specifically for programming Copilot, it corresponds to the product’s understanding of programmers writing code.

The context corresponding to the current prompt is still limited to the current file and recently opened files. As research and development deepens, its search scope will gradually expand to the current codebase, other related codebases, and even enterprise knowledge bases. ==The method of calculating code similarity will also gradually expand from text-based similarity calculation to semantic-based similarity calculation. Such extensions of the search space and similarity calculation will bring richer and more accurate contextual information, which is worth looking forward to.==

## Cost Control — Model Invocation

Each invocation of the large model is a time-consuming and laborious process compared to traditional API applications. Therefore, the system should minimize triggering of the large model while meeting functional implementation. So what has GitHub Copilot done in this regard?

## UI Interception

First, at the UI front end:

- When the user enters in the middle of a line of code (there are other characters after the cursor), requests will only be sent when the character to the right of the cursor is a space, parenthesis, etc. specific characters.
- When the user types very fast, there will be debounce processing, allowing only one request to be sent within a certain time period (default 75ms).

## Prompt Interception

Next, after generating the prompt:

- No request is sent if copilotNotAvailable is set in.copilotignore
- No request is sent if the prompt is too short
- No request is sent if the user actively cancels the request
- If the prompt cache hits, take the cache result directly without sending the request. There are two layers here: first, check if the prefix and suffix of this request are the same as the last one, if so, directly return the result of the last request; if not, check a system maintained LRU cache of size 100 to see if there is a hit.
- If the prompt cache misses, a machine learning model will be used to further determine the quality of the prompt through linear regression. The factors considered by this model include whether the previous suggestion was adopted, the time interval between the last adoption, the length of the last line of the prompt, the letter before the cursor, and so on. Only when the score evaluated by this model exceeds a certain threshold will the prompt be actually sent to the model.

## Effectiveness Assessment — Remote Monitoring: Telemetry

D **ata Flywheel**

How to continuously improve the model by collecting user behaviors is the basis for continuous iteration of AI products. MidJourney makes users choose 1 out of 4; ChatGPT thumbs up or down for answers; GitHub Copilot is by users accepting or rejecting the generated code. These products have achieved the long-sought-after user data flywheel through their respective different user interactions.

M **etric Calculation**

So how does GitHub evaluate the user’s acceptance of its code? GitHub mentioned in its June 2022 blog that 40% of the code was written by Copilot. How did they arrive at this 40%? This involves another Copilot module: remote detection or telemetry, which means collecting remote data for system performance monitoring. Here it refers to collecting the subsequent behaviors of users in vscode, neovim and other code editors on the code generated by Copilot, so as to determine the degree of acceptance.

How to determine if a suggested code was accepted? It is not as simple as calculating the percentage of users who press Tab to indicate acceptance, because even if accepted, subsequent modifications are still possible. Therefore, in order to accurately calculate the acceptance rate, GitHub’s approach is to detect whether the suggested code is still retained in the code base at certain points in time (15s, 30s, 2min, 5min and 10min) after it is generated. The specific algorithm is to calculate the edit distance between the original suggested code and the code in a certain window range after the insertion point in the code base. If this edit distance is less than 50% of the length of the suggested code, the code is considered accepted and retained in the code base. This calculation process is a bit like calculating a user’s retention rate, with retention rates like day 1, day 2, day 3, day 7, day 15, day 30, etc.

Such calculations of acceptance rates and other metrics are often not performed on the client side, because calculating metrics must be based on large-scale user data to be effective. Therefore, the client is only responsible for collecting data and aggregating it to the backend for offline metric calculation. The client data collection here may collect code snippets from users, which may involve privacy, security and intellectual property. Therefore, GitHub provides an opt-out option in the user agreement, and will only send back code snippets with permission.

A **/B Testing**

The Copilot Internals article also mentions pulling AB testing platform code from Microsoft multiple times. Factors such as suffix ratio and Jaccard calculation are involved in AB testing. AB testing runs different versions of the product on different users to compare which parameter settings are more reasonable and which features need improvement. This is also an important part of product data-driven operation.

In summary, the remote monitoring described above is the basis for a typical data closed loop process: collecting data, calculating metrics, and using AB testing to evaluate product effectiveness, providing decision basis for the next iteration. This process is also called data-driven operation, the core of which is to design reasonable core metrics to test and improve product effectiveness. Copilot comes with a natural data collection mechanism that can establish data closed loops very well by having users accept or reject the generated code.

## Summary

In addition to the backend large model training and deployment, by understanding GitHub Copilot’s client side Prompt Engineering, Model Invocation, and Telemetry, we can catch a glimpse of the outline of AI product R&D:

- Prompts that are close to business scenarios are key to improving product performance.
- Reducing model triggering can effectively reduce costs.
- Relying on remote monitoring to collect user behavior data, evaluate product effectiveness, and then improve models and systems to form a data flywheel that can build competitive barriers.

In addition, compared to ChatGPT and GitHub Copilot, we can see two different paths for large model applications:

- One is a versatile personal assistant. ChatGPT helps users quickly access knowledge, research plans, write copy, learn new things, etc. through chat. It is an all-round personal assistant. This is the track of top players like OpenAI.
- One is a professional domain Copilot. GitHub Copilot focuses on providing programming assistance to programmers. In this professional field, it uses a slightly weaker Codex model (a branch of GPT-3) than GPT-3.5, embedded in professional tools like VSCode, greatly improving programmer efficiency. This is an opportunity for many players who are deeply cultivating professional fields.

[![𝐀𝐈 𝐦𝐨𝐧𝐤𝐬.𝐢𝐨](https://miro.medium.com/v2/resize:fill:60:60/1*KtRC6dGKwc4Le3eU_6yymw.jpeg)](https://medium.com/aimonks?source=post_page---post_publication_info--866fcb1f79c0---------------------------------------)

[![𝐀𝐈 𝐦𝐨𝐧𝐤𝐬.𝐢𝐨](https://miro.medium.com/v2/resize:fill:80:80/1*KtRC6dGKwc4Le3eU_6yymw.jpeg)](https://medium.com/aimonks?source=post_page---post_publication_info--866fcb1f79c0---------------------------------------)

[Last published 5 days ago](https://medium.com/aimonks/ai-in-warfare-2026-how-ai-killed-khamenei-captured-maduro-7d246c355f4b?source=post_page---post_publication_info--866fcb1f79c0---------------------------------------)

AImonks ([https://medium.com/aimonks](https://medium.com/aimonks)) is an AI-Educational Publication.

AI & Data & Drive

## More from Andy Yang and 𝐀𝐈 𝐦𝐨𝐧𝐤𝐬.𝐢𝐨

## Recommended from Medium

[

See more recommendations

](https://medium.com/?source=post_page---read_next_recirc--866fcb1f79c0---------------------------------------)
