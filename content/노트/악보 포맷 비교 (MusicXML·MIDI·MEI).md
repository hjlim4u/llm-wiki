---
type: SynthesisNote
description: MusicXML·MIDI·MEI 포맷의 표현 대상과 구조 모델을 비교하고, 악보 기반 연주 피드백 앱 파이프라인에서 각 포맷이 맡을 역할을 정리 (score format comparison for music performance feedback app)
tags:
  - Music_Technology
  - MusicXML
  - MIDI
  - MEI
sources:
  - "[[01 MusicXML 4.0 Specification]]"
  - "[[02 MusicXML Structure of MusicXML Files]]"
  - "[[03 MEI Guidelines Introduction]]"
  - "[[04 Standard MIDI Files Specification]]"
  - "[[30 MIDI Association Specifications]]"
  - "[[05 MuseScore Handbook File Formats]]"
updated: 2026-07-17
---

## 정리

세 포맷은 경쟁 관계가 아니라 **서로 다른 것을 표현**한다. "악보 기반 연주 피드백 앱"이 다뤄야 하는 두 축(악보가 무엇을 지시하는가 / 연주가 실제로 어땠는가)에 각각 다른 포맷이 대응한다.

### MusicXML — 표기(notation) 교환의 사실상 표준

- XML 기반이며, 하나의 악보를 `<score-partwise>`(파트 우선) 또는 `<score-timewise>`(마디 우선) 두 구조 중 하나로 표현한다. 둘은 XSLT(`parttime.xsl` / `timepart.xsl`)로 상호 변환 가능하지만, 오늘날 대부분의 앱은 partwise를 표준으로 쓴다.
- 헤더(`<work>`, `<identification>`, 필수 요소인 `<part-list>`)에 곡 메타데이터를, 본문(`<note>`, `<direction>`, `<barline>` 등)에 실제 표기를 담는다.
- 목적이 "인쇄된 악보를 그대로 재현하는 것"이라 표기 정보(음표, 셈여림, 슬러 등)는 풍부하지만 연주 이벤트 자체를 기록하는 포맷은 아니다.

### MEI — MusicXML보다 넓은 학술적 인코딩 프레임워크

- 역시 XML(RNG 스키마) 기반이지만 Music Encoding Initiative라는 커뮤니티가 유지하며, MusicXML이 다루지 않는 복잡한/역사적 표기(필사본, 이본 비교 등)까지 인코딩하도록 설계됐다.
- 앱 개발 관점에서는 "MusicXML로 충분하지 않은 표기를 만났을 때"의 상위 호환 옵션으로 볼 수 있다. MuseScore가 MEI를 가져오기/내보내기 지원 대상에 포함한다.

### MIDI (Standard MIDI Files) — 표기가 아니라 연주 이벤트

- MusicXML/MEI와 근본적으로 다른 층위다. 음표 이미지가 아니라 note-on/note-off와 타이밍 같은 **연주 이벤트**를 기록한다.
- 공식 스펙(RP-001)은 MIDI Association 로그인 뒤에 있어 원문 클리핑이 목차 수준에 그침 — 필요 시 직접 로그인 확인 필요(확인되지 않은 부분).

### MuseScore — 세 포맷을 잇는 실질적 변환 허브

- MusicXML·MIDI(·MEI 포함)를 모두 가져오기/내보내기 지원하는 사실상의 변환 허브. 다만 네이티브 포맷(`.mscz`)은 텍스트 폰트를 임베드하지 않아 다른 앱에서 열면 시각적으로 달라질 수 있다는 제약이 있다(글꼴이 없으면 폴백 처리).

## 앱 파이프라인에 대한 함의

"악보가 지시하는 것"(무엇을 연주해야 하는가)과 "실제로 연주된 것"(무엇이 연주됐는가)을 분리해서 다뤄야 한다면:

- OMR(광학 악보 인식) 결과물의 표준 출력 대상은 **MusicXML**이 되는 것이 자연스럽다(표기 교환의 사실상 표준이므로).
- 연주 캡처·분석은 **MIDI/노트 이벤트** 공간에서 이뤄진다(Basic Pitch 등 audio-to-MIDI 도구가 이 층위 — [[OMR 도구와 데이터셋 지형]] 참고).
- 스코어 팔로잉(Score Following)은 이 두 표현(악보의 MusicXML ↔ 연주의 MIDI/오디오)을 정렬하는 작업이므로, 두 포맷 사이의 변환·정렬 계층이 파이프라인의 핵심이 된다.
- 복잡한 표기(전통 음악, 필사본 등)를 다뤄야 하는 경우가 아니라면 MEI는 우선순위가 낮다 — MusicXML로 충분한 경우가 대다수.

## 열린 질문

- MIDI RP-001 스펙 원문(로그인 필요)을 직접 확인해 타이밍 해상도·이벤트 종류를 구체적으로 파악할 필요가 있는가?
- 앱이 MEI 수준의 표기 복잡도를 실제로 다뤄야 하는 케이스가 있는가, 아니면 MusicXML로 항상 충분한가?
