---
type: home
description: 제텔카스텐 볼트의 최상위 진입점. 주제별 MOC와 태그 체계를 안내한다.
updated: 2026-08-09
tags:
  - MOC
  - Zettelkasten
  - Vault_Guide
  - Tag_Taxonomy
---

볼트의 최상위 진입점이다. 각 주제의 노트는 태그로 검색하고, 노트 간 관계는 Canvas에서 확인한다.

## 주제 MOC

> 체계화할 수 있을 만큼 구조와 관계가 충분한 태그만 MOC로 승격한다.

| 주제 | MOC |
| --- | --- |
| Prompt Engineering | [[MOC_Prompt_Engineering]] |
| Java | [[MOC_Java]] |
| Music Technology | [[MOC_Music_Technology]] |
| Software Engineering | [[MOC_Software_Engineering]] |

## 태그 지형

볼트 전체의 최상위 태그를 노트 수 기준으로 집계한다(2건 이상). 시작 태그를 모를 때 여기서 고른다. 각 MOC의 하위·관련 태그는 해당 MOC에서 본다.

```dataview
TABLE length(rows) AS 노트수 FLATTEN file.tags AS t FLATTEN split(t, "/")[0] AS 태그 GROUP BY 태그 WHERE length(rows) >= 2 SORT length(rows) DESC
```


## 노트 유형

노트는 성숙도나 작성 주체로 구분하지 않는다. `노트/`의 모든 노트는 생성부터 점검까지 Agent가 일관된 방식으로 관리하며, `type: Note` 하나로 통일한다.

| 유형 (`type`) | 위치 | 설명 |
|------|------|------|
| Note | `노트/` | Agent가 생성·점검을 관리하는 노트 (아이디어, 문헌 정리, 합성 등 내용 성격은 태그·description으로 구분) |
| 참고자료 | `Reference/` | 외부 불변 원자료 (Book, Paper, Video, Web) |
