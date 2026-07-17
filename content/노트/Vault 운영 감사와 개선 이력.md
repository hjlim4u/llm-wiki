---
type: SynthesisNote
description: 2026-07 볼트 진단(허브 부재·고아 노트·type 오염 원인)과 이어진 구조 개편(폴더 단순화, SynthesisNote 도입) 결정 이력
tags:
  - Zettelkasten
  - Vault_Guide
sources:
  - "[[HOME]]"
  - "CLAUDE.md"
  - "[[MOC_Music_Technology]]"
updated: 2026-07-17
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
2. **SynthesisNote 유형 도입** (Karpathy LLM Wiki의 선택적 도입): 에이전트가 `Reference/` 원자료를 합성하는 노트에 한해 에이전트 전권 편집을 허용. 사람이 쓰는 노트(임시/문헌/영구)에는 여전히 제안·사무만 — 사고 코어의 경계는 유지. 주제당 1노트 원칙으로 중복 방지(폴더나 로그 파일 같은 별도 장치 없이 규칙 3줄로 축소).
3. **탐색 색인**: 새 색인 인프라(index.md, log.md 등) 신설을 기각하고, 기존 4겹(frontmatter `type`/`tags`/`description`/헤딩)의 grep 규격만 통일 — `type` 단일값, `description`에 한영 키워드 병기.
4. **위생 정리**: type 쉼표 오염 44건 정상화, `MOC_Java.md`/`MOC_Prompt_Engineering.md`의 깨진 canvas 링크·중복 코드펜스 수정, `JAVA_temp.canvas`의 이동된 파일 경로 갱신.

### 보류 중 (사용자 확인 필요, 미실행)

- 리프킨 관련 임시메모 2건의 작성 주체 확인 후 이관 여부 결정.
- `.smart-env`(108MB) 삭제 여부 — semantic-vault-mcp 의존 확인 필요.
- 영구메모 첫 파일럿(`다시 읽어보는 객체지향의 사실과 오해` 기반) — 아직 미착수.

## 열린 질문

- 격주 정제 세션(문헌메모 → 영구메모 승격 프로토콜)을 언제 처음 시행할 것인가?
- 월 1회 린트를 사람이 트리거할 것인가, 일정 기반으로 자동화할 것인가?
