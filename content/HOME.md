---
type: home
description: 제텔카스텐 볼트의 최상위 진입점. 주제별 MOC와 태그 체계를 안내한다.
updated: 2026-06-03
tags:
  - MOC
  - Zettelkasten
  - Vault_Guide
  - Tag_Taxonomy
---

볼트의 최상위 진입점이다. 각 주제의 노트는 태그로 검색하고, 노트 간 관계는 Canvas에서 확인한다.

## 주제 MOC

> 체계화할 수 있을 만큼 구조와 관계가 충분한 태그만 MOC로 승격한다.

| 주제 | MOC | 관련 태그 |
| --- | --- | --- |
| Prompt Engineering | [[MOC_Prompt_Engineering]] | `Prompt_Engineering`, `Prompt_Engineering/Few_Shot`, `Prompt_Engineering/Zero_Shot`, `Prompt_Engineering/Chain_Of_Thought` |
| Java | [[MOC_Java]] | `Java`, `Collection_Framework`, `Coding_Test`, `Syntax` |
| Music Technology | [[MOC_Music_Technology]] | `Music_Technology`, `MusicXML`, `MIDI`, `MEI`, `Optical_Music_Recognition`, `Music_Information_Retrieval`, `Score_Following`, `Music_Performance_Assessment` |


## 노트 유형

노트 성숙도는 폴더가 아니라 frontmatter `type` 키로 구분한다. 사람이 쓰는 노트는 모두 `노트/`에 함께 있다.

| 유형 (`type`) | 위치 | 설명 |
|------|------|------|
| FleetingNote | `노트/` | 일시적 아이디어, 초기 생각 |
| LiteratureNote | `노트/` | 독서·학습 중 작성한 문헌 기반 메모 |
| PermanentNote | `노트/` | 정제된 자기 생각, 제텔카스텐 핵심 노트 |
| SynthesisNote | `노트/` | 에이전트가 Reference 원자료를 합성한 노트 (에이전트 전권 편집) |
| 참고자료 | `Reference/` | 외부 불변 원자료 (Book, Paper, Video, Web) |
