---
type: Note
description: 2026-07 볼트 진단(허브 부재·고아 노트·type 오염 원인)과 이어진 구조 개편(폴더 단순화, type 통일) 결정 이력
tags:
  - Zettelkasten
  - Vault_Guide
sources:
  - "[[HOME]]"
  - "CLAUDE.md"
  - "[[MOC_Music_Technology]]"
updated: 2026-07-18
---

## 정리

에이전트와의 대화 세션(2026-07-17)에서 볼트 전체를 감사하고 구조를 개편한 기록. 세션이 끝나면 사라지는 분석 결과 중 재사용 가치가 있는 결론만 남긴다.

### 진단 (감사 시점 기준)

- 볼트는 "프로젝트 리서치 아카이브(Music_Technology 등) + 소규모 사고 코어(임시·문헌·영구메모)"가 섞인 이층 구조였다.
- 149개 노트 중 백링크 최대 3, 고아 노트 107개 — 노트 간 연결이 거의 없었다. 태그 검색이 사실상 유일한 탐색 경로였고 MOC(3개)는 얇은 진입점 역할만 했다.
- `type` 값 쉼표 오염(44건)은 2026-06 Music_Technology 클리핑 배치 중 metadata-menu의 `fileClassAlias: "type"` 설정이 fileClass를 append하면서 생긴 일회성 사고로 확인됨 — 이후 재발 없음.
- 영구메모 폴더는 비어 있었고(0건), 장문 임시메모 3건은 사실 AI 딥리서치 산출물이 임시메모함에 잘못 놓인 것이었다.

### 결정 — 구조 개편 (2026-07-17 실행)

1. **폴더 단순화**: `1.임시메모/2.문헌메모/3.영구메모` 3분할을 폐지하고 `노트/` 하나로 통합. 노트 성숙도·작성 주체는 폴더가 아니라 frontmatter `type` 키(FleetingNote/LiteratureNote/PermanentNote/SynthesisNote)로만 구분 — 세 폴더가 관리 방식·템플릿 면에서 실질적 차이가 없었기 때문(중복 인코딩 제거). `Reference/`는 불변 원자료라는 실질적 차이가 있어 유지.
2. **SynthesisNote 유형 도입 후 폐기** (Karpathy LLM Wiki의 선택적 도입 → 2026-07-18 재단순화): 처음엔 에이전트가 `Reference/` 원자료를 합성하는 노트에 한해 `type: SynthesisNote`로 전권 편집을 허용하고 나머지(임시/문헌/영구)는 사람 소유로 남겼으나, 실제로는 모든 `노트/` 콘텐츠를 에이전트가 생성부터 점검까지 일관되게 관리하고 있어 소유권 구분 자체가 무의미하다고 판단 — `type` 값을 `Note` 하나로 통일하고 성숙도(임시/문헌/영구/합성) 구분을 완전히 제거했다. 주제당 1노트 원칙은 전체 노트로 일반화해 유지.
3. **탐색 색인**: 새 색인 인프라(index.md, log.md 등) 신설을 기각하고, 기존 4겹(frontmatter `type`/`tags`/`description`/헤딩)의 grep 규격만 통일 — `type` 단일값, `description`에 한영 키워드 병기.
4. **MOC 뷰 전환** (2026-07-18): MOC의 노트 목록(Base 블록)을 하위·공출현 태그 집계(Dataview 블록)로 교체하고 HOME의 "관련 태그" 열을 삭제 — 실측 비교에서 태그 층위 경유가 넓은 주제 탐색을 2.2~6.7배 절감했고, 수동 관련 태그 열은 공출현 집계로 완전 파생 가능함이 확인됨. 부수 발견: CLI `tag name=`은 nested 자식 미포함(exact), Base `hasTag()`는 포함 — 도구 간 의미 불일치를 지침에 명기. Bases는 태그 집계 불가(출력이 파일 행 단위). MOC `aliases`는 태그 복제를 폐지하고 번역·유의어만 남김.
5. **위생 정리**: type 쉼표 오염 44건 정상화, `MOC_Java.md`/`MOC_Prompt_Engineering.md`의 깨진 canvas 링크·중복 코드펜스 수정, `JAVA_temp.canvas`의 이동된 파일 경로 갱신. `type` 없던 노트 3건에 `type: Note` 보강.
6. **보류 항목 정리** (2026-07-18): 리프킨 관련 노트 2건은 내용 확인 결과 동일 주제(한계비용 제로 사회)를 다룬 AI 딥리서치 산출물 중복이었고 tags/description도 비어 있어 삭제. `.smart-env`(108MB)는 smart-connections 플러그인의 재생성 가능한 임베딩 캐시로 확인(`.mcp.json`에 MCP 서버 없음, 의존 없음) — 삭제.

### 보류 중 (사용자 확인 필요, 미실행)

- `PeopleNote` fileClass/템플릿 — 사용 노트 0건, 삭제 여부 미결정.

## 열린 질문

- 월 1회 린트를 사람이 트리거할 것인가, 일정 기반으로 자동화할 것인가?
