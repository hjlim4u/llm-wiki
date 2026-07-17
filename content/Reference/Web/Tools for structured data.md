---
title: "Tools for structured data"
source: https://anthropic.skilljar.com/claude-with-the-anthropic-api/287754
author:
  - "Anthropic Courses"
published:
created: 2025-10-29
description: "When you need structured data from Claude, you have two main approaches: prompt-based techniques using message prefills and stop sequences, or a more robust method using tools. While the prompt-based approach is simpler to set up, tools provide more reliable output at the cost of additional complexity."
tags: [AI/Tool_Use, Structured_Data]
cover: https://cdn.sanity.io/images/4zrzovbb/website/c4bd33e7c8e809a2f9a9a5896ee13961e2a738ec-2400x1260.png
---

## Tools for Structured Data

The tool-based approach works by creating a JSON schema that defines the exact structure of data you want to extract. Instead of hoping Claude formats its response correctly, you're essentially giving Claude a function to call with specific parameters that match your desired output structure.

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748623754%2F06_-_011_-_Tools_for_Structured_Data_03.1748623754770.png)

Here's how the process works:

- Write a schema that describes the structure of data you're looking for
- Force Claude to use a tool with the `tool_choice` parameter
- Extract the structured data from the tool use response
- No need to provide a follow-up response - you're done once you get the data

For example, if you want to extract a financial balance and key insights from a statement, your schema would define those as an integer and array of strings respectively.

## Controlling Tool Use

A critical part of this technique is ensuring Claude actually calls your tool. You can control this behavior using the `tool_choice` parameter:

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748623755%2F06_-_011_-_Tools_for_Structured_Data_09.1748623755582.png)
- `{"type": "auto"}` - Model decides if it needs to use a tool (default)
- `{"type": "any"}` - Model must use a tool, but can choose which one
- `{"type": "tool", "name": "TOOL_NAME"}` - Model must use the specified tool

For structured data extraction, you'll typically want the third option to guarantee Claude calls your specific schema tool.

## Implementation Example

Let's say you want to extract a title, author, and key insights from an article. First, you'd create a tool schema:

```
article_summary_schema = {
    "name": "article_summary",
    "description": "Extracts structured data from articles",
    "input_schema": {
        "type": "object",
        "properties": {
            "title": {"type": "string"},
            "author": {"type": "string"}, 
            "key_insights": {
                "type": "array",
                "items": {"type": "string"}
            }
        }
    }
}
```

Then you'd call Claude with the tool and force its use:

```
response = chat(
    messages,
    tools=[article_summary_schema],
    tool_choice={"type": "tool", "name": "article_summary"}
)
```

The response will contain a tool use block with your structured data in the `input` field. You can access it directly:

```
structured_data = response.content[0].input
```

## When to Use Each Approach

Choose prompt-based structured output when you need something quick and simple. Use tools when you need guaranteed reliability and can handle the extra setup complexity. Both techniques are valuable depending on your specific use case and requirements.

#### Downloads

- [002\_structured\_data.ipynb](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic-poc/assets/1748558407/002_structured_data.ipynb?response-content-disposition=attachment&Expires=1761725484&Signature=T9ssCtZfWijMSTnCuU7XOCdsCD-~aJeEks~b5msl6w0ND71mK4xnpOlVo4LG72cqgvcOELCGbxCwcWtw8l48k8islfS8NW62sgXTbHY1gxXigLA4UjKjVHGMzfNWzqJ-zIY3ICLM02mI4k7kxsEsjoOKVO0MOs9iGnslrDSFUNLz0RHZeFNSmNcmglGpU4kgkWOiTBQx3eKT~Y-iy0bgvnowG-r-nuuvlt89s7JarcDmoBOlpL6jmW~c9JVYk2jGTTXDrg~nGhfyE24D8uPVnDV-FOpUWLwfcfJY2P-KqC9~37f~2MAXvNYFZ-4yxwVhZIw3cPCjHLX~9A6lhikJIA__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
- [002\_structured\_data\_completed.ipynb](https://cc.sj-cdn.net/instructor/4hdejjwplbrm-anthropic-poc/assets/1748558407/002_structured_data_completed.ipynb?response-content-disposition=attachment&Expires=1761725484&Signature=r7AartgPjdP7i4ox-LR26idiXDcHewRR14llsxypD2bGFXUVXMXs4ExXAMgZtVuQv8RBX1EODVE4-SqLR9iqzMIbOA33Y8v5KQJeBz~JTFA8O2iym3GW4N3VxbIsoXzSIKefmxLzoXSpgtO64sUCEMJ-bpR-SjZsWdnwoxSwZ1qgU7pk~xkMTt3BrJ4gzs3U-paWMAOXRzWP9ZkqNx~4dVx~N9OvHJU3ysA0kOjbtKr1NZMTobw7Ba9BIRelLzmH248U7HuPVdCqUEC5yvPUrCWLy2Z8~uvXd-ehamTNhfWuFDO~fw8K~6DWixmampN7CwoMVjnTHnEe4uC0-kPaGw__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ)
