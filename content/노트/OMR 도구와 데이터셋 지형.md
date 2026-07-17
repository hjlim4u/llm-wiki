---
type: SynthesisNote
description: 광학 악보 인식(OMR) 도구를 이미지 기반과 오디오 기반 두 갈래로 구분하고, 평가용 데이터셋 출처를 정리 (OMR, audio transcription)
tags:
  - Music_Technology
  - Optical_Music_Recognition
sources:
  - "[[06 Audiveris README]]"
  - "[[08 Understanding Optical Music Recognition]]"
  - "[[09 Optical Music Recognition State of the Art and Major Challenges]]"
  - "[[43 Optical Music Recognition State of the Art and Open Issues]]"
  - "[[15 Basic Pitch README]]"
  - "[[17 AnthemScore Documentation]]"
  - "[[10 OMR Datasets]]"
updated: 2026-07-17
---

## 정리

"OMR"이라는 이름 아래 실제로는 **입력 신호가 다른 두 갈래 도구**가 섞여 있다. 이 구분이 앱 파이프라인 설계에서 가장 먼저 정리돼야 한다.

### 갈래 1 — 이미지→표기 (진짜 OMR)

- Calvo-Zaragoza 등의 "Understanding Optical Music Recognition"과 Shatri·Fazekas의 "State of the Art and Major Challenges"는 OMR을 **악보 이미지(스캔/사진)를 기계가 읽을 수 있는 표기로 변환**하는 문제로 정의한다. 두 서베이 모두 이 분야가 아직 젊고(50년 넘게 연구됐지만) 용어·정의가 통일돼 있지 않다고 지적하며, 최근 고전적 컴퓨터 비전에서 딥러닝 접근으로 전환되는 흐름을 공통적으로 짚는다.
- **Audiveris**가 이 갈래의 대표적 오픈소스 엔진이다. 다만 실사용 시 주의할 점 — `audiveris.com`(정식 사이트 아님)은 피싱 사이트로 확인되어 있으며, 진짜 프로젝트는 GitHub(Audiveris 조직) 기반이다.

### 갈래 2 — 오디오→노트 (음악 전사, OMR과는 다른 문제)

- **Basic Pitch**(Spotify)와 **AnthemScore**는 입력이 이미지가 아니라 **오디오**(연주 녹음)다. 오디오에서 피치·타이밍을 검출해 MIDI/악보로 변환하는 오디오 트랜스크립션 도구이며, 스캔된 악보를 읽는 것과는 다른 문제다.
- AnthemScore는 오디오·MIDI·MusicXML을 모두 열 수 있어 사실상 "오디오→표기" 변환기 겸 뷰어 역할을 한다.
- 이 갈래는 "악보 없이 연주만 있는 경우"(즉석 연주, 커버 영상 등)의 표기화에 쓰이고, 갈래 1은 "악보는 있는데 디지털 표기가 없는 경우"(스캔본, 절판 악보 등)의 표기화에 쓰인다 — 입력 상황이 다르면 선택할 도구도 다르다.

### 평가 데이터셋

- OMR Datasets 저장소는 오선 검출/제거, CNN 학습, 벤치마크용 데이터셋을 표(엔그레이빙 방식·크기·포맷·용도)로 정리해 제공하며, 대부분 라이선스·인용 조건이 걸려 있다. 큐레이션된 서지 목록은 `omr-research.github.io`.

## 앱 파이프라인에 대한 함의

"악보 기반 연주 피드백 앱"이 실제로 다루는 입력이 무엇인지에 따라 필요한 도구가 갈린다.

- 사용자가 **스캔·사진 악보**를 올린다 → 갈래 1(Audiveris류 이미지 OMR) 필요, 출력은 [[악보 포맷 비교 (MusicXML·MIDI·MEI)|MusicXML]]로 표준화.
- 사용자가 **연주 녹음**을 올린다(악보 없이) → 갈래 2(Basic Pitch/AnthemScore류 오디오 전사) 필요, 출력은 MIDI/노트 이벤트.
- 두 입력이 다 있는 일반적 시나리오(디지털 악보 + 연주 녹음)라면 OMR 자체는 필요 없고, 바로 스코어 팔로잉(정렬)과 연주 평가로 넘어갈 수 있다 — OMR 도구 채택 여부부터 입력 가정을 먼저 확정해야 한다.

## 열린 질문

- 앱의 실제 입력 시나리오(스캔 악보 업로드 vs 녹음만 업로드 vs 둘 다)가 아직 확정됐는가? 이게 갈래 1/2 중 어디에 투자할지를 결정한다.
- Audiveris(고전적/규칙 기반 계열)와 최신 딥러닝 기반 OMR 엔진 사이의 정확도 격차를 실측 비교한 자료가 필요한가?
