---
tags:
  - System/Instruction
  - System/Guide
---
# 인코딩 및 출력

- 한국어 파일이나 노트는 UTF-8 기준으로 읽고 출력한다.
- 필요하면 `[Console]::OutputEncoding = [System.Text.Encoding]::UTF8`와 `Get-Content -Encoding UTF8`를 사용한다.

# 제텔카스텐 볼트 작업 가이드

이 볼트는 Obsidian 기반의 제텔카스텐 메모 시스템이다.

## 볼트 구조

```text
제텔카스텐/
├── HOME.md              ← 최상위 MOC (진입점)
├── MOC_*.md             ← 주제별 MOC
├── 노트/                 ← 모든 노트, Agent가 생성부터 점검까지 관리 (type: Note로 통일)
├── Reference/
│   ├── Book/            ← 도서 메타정보
│   ├── Paper/           ← 논문
│   ├── Video/           ← 영상 (주로 YouTube)
│   └── Web/             ← 웹 자료
├── 일간노트/             ← Daily notes
└── Template/             ← 노트 템플릿
```

노트의 성숙도(임시/문헌/영구)나 작성 주체는 더 이상 구분하지 않는다. `노트/`의 모든 노트는 `type: Note`로 통일하고, 내용 성격은 태그와 description으로만 구분한다. 폴더는 관리 방식이 실제로 다른 두 영역(Agent가 만들고 계속 고치는 `노트/`, 불변 원자료인 `Reference/`)에 한해서만 나눈다.

## 노트 관리 원칙

`노트/`의 모든 노트는 생성부터 점검까지 Agent가 일관된 방식으로 관리한다. 노트 성숙도나 작성 주체별로 소유권을 나누지 않는다.

- **단일 노트 원칙**: 같은 주제(질문)를 다루는 노트는 1개만 둔다. 새로 만들기 전에 같은 주제의 기존 노트가 있는지 먼저 찾고, 있으면 그 노트를 갱신한다(새 노트를 만들지 않는다). 갱신할 때는 frontmatter의 `sources`(있는 경우)와 `updated`도 함께 갱신한다.
- **정기 점검**: 월 1회 정도 볼트 전체를 점검해 깨진 링크, `type` 값 오염(쉼표로 여러 값이 들어간 경우 등), 통제 어휘 밖의 신규 태그, 오래 갱신되지 않은 노트를 찾아 정리한다.

## 노트 탐색 방법

탐색은 항상 태그 검색에서 출발하는 단일 절차를 따른다. MOC는 별도의 진입 경로가 아니라, 검색된 태그를 구조화해 주는 레이어로만 참조한다. 후보를 좁힌 뒤에는 frontmatter 메타정보를 먼저 검토한다.

### 1. 태그 검색 → MOC 사다리

Obsidian CLI는 공식 CLI 실행 파일을 직접 호출한다. bare `obsidian` 명령이 GUI 앱으로 연결되는 환경(예: Windows에서 Git Bash로 `obsidian`을 치면 GUI 앱이 실행됨)에서는 CLI 전용 실행 파일(Windows: `Obsidian.com`)의 전체 경로로 직접 호출한다. Obsidian 데스크톱이 실행 중이어야 한다(IPC).

1. `obsidian tag name="<태그>"`로 후보를 조회한다. 정확 일치만 매칭되며 **부모 태그 조회에 nested 자식은 포함되지 않는다** — 자식 포함 집합이 필요하면 dataview `FROM #태그`(eval)를 쓴다. 태그명은 정확한 철자만 매칭되므로 "태그 체계" 절의 명명 규칙(Word_Snake_Case, 통제 어휘)에 맞게 구성된 정확한 태그명을 쓴다.
2. 정확한 태그명을 모르면 `obsidian search query="<키워드>"`로 본문을 먼저 검색해 실제 사용 중인 태그를 확인한 뒤(태그 피벗) 1번으로 돌아간다.
3. 후보 중 해당 태그의 MOC가 있으면(`type: MOC`) 그 MOC를 진입점으로 삼는다.
4. 없으면 부모 태그로 한 단계씩 올라가며 가장 가까운 MOC를 진입점으로 쓴다. 루트까지 없으면 1번의 후보 목록을 그대로 훑는다.

`HOME.md`는 MOC들의 인덱스일 뿐 별도 진입 경로가 아니다. 시작할 태그 자체를 모를 때만 HOME에서 기존 MOC/태그 체계를 훑어 시작 태그를 정한다.

특정 노트의 존재와 이름을 이미 알면 태그 탐색 없이 파일명으로 바로 연다.

### 2. Frontmatter 기반 탐색

- 본문 전체를 읽기 전에 반드시 `---` frontmatter를 먼저 읽는다.
- `description`, `summary`, `title`, `tags`를 기준으로 관련성을 먼저 판단한다.
- 탐색 순서는 `후보 노트 찾기 → frontmatter 검토 → 관련성 판단 → 필요 시 본문 읽기`를 따른다.

### 3. 관계 파악

- MOC에 속한 노트 간 관계는 Canvas(`.canvas`) 파일의 JSON으로 표현된다. `nodes`는 노트, `edges`는 관계이며 `label`이 관계 의미를 나타낸다. 관련 Canvas는 MOC의 "관계 지도" 섹션에서 찾는다.
- 관계 질의(백링크·전방링크·"X와 연결된 노트")는 `obsidian backlinks path="..."` / `obsidian links path="..."`를 쓴다. `.canvas` 파일 자체를 대상으로 호출하면(`links path="MOC_Music_Technology.canvas"`) 임베드된 노트 전체가 펼쳐진다.
- "X와 연결된 노트 중 태그 Y" 같은 복합 질의는 `links`/`backlinks` 결과와 `tag name=` 결과의 교집합을 구한다(사용 중인 셸의 리스트 교집합 기능 활용, 예: PowerShell `Where-Object`, POSIX `comm`/`grep -Fxf`).
- Obsidian이 실행 중이 아니거나 CLI 호출이 실패할 때만 Canvas JSON에서 `"file":"..."` 노드를 grep으로 직접 추출한다.

### 4. Frontmatter 작성 규격

frontmatter는 도구로 바로 검색되도록 다음 규격을 지킨다.

- 키는 항상 줄 시작에 온다 (`^type:`, `^description:` 형태로 매칭 가능).
- `type`은 단일 값만 쓴다. 쉼표로 여러 값을 넣지 않는다.
- `description`에는 검색될 만한 핵심 키워드를 한국어·영어 병기로 넣는다.
- 태그는 새로 만들 때도 항상 아래 "태그 체계" 절의 명명 규칙을 따른다. 임기응변 표기(띄어쓰기, 대소문자 혼용, 동의어 중복)는 태그 검색을 깨뜨리므로 금지한다.

이 규격 위에서 다음이 가능하다: `type` 값으로 최상위 카테고리 필터링(grep, Base `note.type == "..."`; 노트/참고자료/MOC 구분), `tags`로 주제 필터링(grep, Base `file.hasTag(...)`), `description`으로 키워드 검색(grep), 본문 헤딩으로 섹션 단위 탐색.

### 5. Base·Dataview 실행 확인

- Base 쿼리(`.base` 파일) 실행 확인: `obsidian base:query file="..." format=json`.
- MOC·HOME의 Dataview 태그 집계 블록은 아래 eval로 같은 DQL을 실행해 확인한다.
- Dataview DQL 실행: `obsidian eval code="app.plugins.plugins.dataview.api.query('<DQL>').then(r => JSON.stringify(r.value.values))"`.

## MOC 구축 전략

### MOC 구성 요소

- frontmatter:

```yaml
---
type: MOC
description: "주제 설명"
parent: "[[상위MOC]]"
updated: YYYY-MM-DD
aliases:
  - 주제의 한국어 번역이나 유의어
tags:
  - MOC
  - 관련태그들
---
```

- `aliases`에는 태그를 복제하지 않는다. 주제의 한국어 번역·유의어처럼 `tags`와 파일명이 커버하지 못하는 표현만 넣는다.

- 본문: 주제에 대한 1문단 맥락 설명
- 관계 지도: 노트 간의 관계 정보를 표현한 Canvas 파일 링크
- 하위·관련 태그: Dataview 코드블록으로 MOC 태그와 공출현하는 태그를 자동 집계(자기 태그·`MOC` 태그 제외). 노트 목록은 두지 않는다 — 노트 나열은 네이티브 태그 검색이 이미 제공하며, MOC의 역할은 태그 구조화다

- 하위·관련 태그 블록의 표준 쿼리: `TABLE length(rows) AS 노트수 FROM #<MOC태그> FLATTEN file.tags AS t WHERE t != "#<MOC태그>" AND t != "#MOC" GROUP BY t SORT length(rows) DESC`
- 에이전트는 같은 집계를 `obsidian eval`(dataview api)로 실행하거나, Obsidian 미실행 시 frontmatter `tags` 블록 grep으로 대체한 뒤, 좁힌 태그로 `obsidian tag name=`을 실행해 노트에 도달한다.
- Bases는 `groupBy`가 있어도 출력이 파일 행 단위라 태그 집계에 쓸 수 없다. 태그 집계는 Dataview만 쓴다.
- `HOME.md`는 같은 패턴의 볼트 전역 뷰를 갖는다: 최상위 태그 집계(2건 이상) Dataview 블록.

### 태그 → MOC 승격 기준

아래 조건을 만족하는 태그만 MOC로 승격한다.

1. 개념적 유의미성: 태그 자체가 하나의 개념으로서 설명할 내용이 있는가
2. 구조화 가능성: 관련 노트들을 Canvas나 계층 구조로 체계화할 수 있는가
3. 충분한 노트 수: 구조화할 만큼 관련 노트가 축적되었는가

- 승격 시 `MOC_{주제}.md`를 생성하고 `HOME.md` 테이블에 등록한다.

### MOC 계층 확장 원칙

MOC 계층은 기존 태그 체계를 따라 확장한다.

- 하위 MOC를 만들 때는 nested tag를 기준으로 분화한다.(예: `AI MOC` -> `AI/RAG MOC`로 분화)
- 새 하위 MOC는 상위 MOC를 `parent`로 참조하고, 상위 MOC는 전체 주제의 진입점 역할을 유지한다.
- MOC 노트의 관계 지도는 기본적으로 해당 MOC 태그의 바로 한 단계 아래 nested tag를 기준으로 그룹화한다. 더 깊은 단계의 분해 규칙은 캔버스 관련 skill에서 관리한다.
- 구체적인 Canvas 분리 기준, 그룹 대체 방식, MOC 노드 배치 규칙은 캔버스 관련 skill에서 관리한다.

## 태그 체계

- 태그는 가급적 영어로 작성한다.
- 태그 명명 규칙은 **Word_Snake_Case**를 따른다 (예: `Neural_Network`, `AI/RAG`, `TF_IDF`).
- 약어는 의미 보존을 위해 대문자로 유지한다. 다만 고유 약칭이 대소문자 혼합으로 굳어진 경우는 원형을 따른다 (예: `OOP`, `MCP`, `RAG`, `GPT_4`, `AI_Assisted_Programming`, `JSON_Schema`, `URI_Templates`, `ToT`).
- 새 노트를 만들 때는 먼저 그 노트의 주제를 가장 잘 표현하는 태그를 정의한다.
- 새 태그를 만들기 전에는 기존 태그 목록을 조회해 유사한 표현이 있는지 먼저 확인한다.
- 의미가 같은 기존 태그가 있으면 새 태그를 만들지 말고 기존 태그로 통일한다.
- 상위·하위 관계가 분명하면 독립 태그 대신 nested tag로 만든다.
- 이미 만든 태그라도 더 적절한 계층 관계가 드러나면 nested tag 체계에 맞게 정리한다.
- 태그는 주제를 나타낸다.

## 주의사항

- 이 볼트는 제텔카스텐 메모법을 따른다. 노트가 특정 분류에 갇히지 않도록 유연하게 다룬다.
- 노트 간 연결을 적극 권장한다. `[[wikilink]]`, `![[transclusion]]`, 블록 참조(`#^blockid`)를 활용한다.
- 기존 노트를 수정할 때 frontmatter 스키마를 깨뜨리지 않는다.
