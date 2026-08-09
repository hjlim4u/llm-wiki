---
type: MOC
description: 프롬프트 설계 원칙과 기법, 예시 전략을 연결해 LLM 상호작용 품질을 높이는 주제를 정리하는 MOC.
parent: "[[HOME]]"
updated: 2026-07-18
aliases:
  - 프롬프트 엔지니어링
tags:
  - MOC
  - Prompt_Engineering
---

프롬프트 엔지니어링은 모델에게 무엇을, 어떤 맥락과 형식으로 전달해야 원하는 결과를 안정적으로 얻을 수 있는지 다루는 주제다. 이 MOC는 명확성, 구체성, 예시 제공, 추론 유도 같은 핵심 전략을 하나의 진입점으로 묶고, 관련 노트와 관계 지도를 통해 세부 기법을 탐색할 수 있도록 구성한다.

## 관계 지도

- [[Prompt_Engineering.canvas]]
- [[Prompt Engineering for AI Guide.canvas]]

## 하위·관련 태그

```dataview
TABLE length(rows) AS 노트수 FROM #Prompt_Engineering FLATTEN file.tags AS t WHERE t != "#Prompt_Engineering" AND t != "#MOC" GROUP BY t SORT length(rows) DESC
```
