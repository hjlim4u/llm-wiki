---
title: pretty_midi Library
source: https://github.com/craffel/pretty-midi
created: 2026-06-14
published:
author:
type: WebReference
clip_status: ok
feature: MIDI 분석/조작
description: MIDI를 pitch/start/end/velocity 단위 객체로 다루는 Python 라이브러리. 연주 note event 표준화와 피드백 지표 계산에 적합.
tags:
  - Music_Technology
  - MIDI
  - Music_Information_Retrieval
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# pretty_midi Library

- 원문: [pretty_midi Library](https://github.com/craffel/pretty-midi)
- 관련 기능: MIDI 분석/조작
- 선별 이유: MIDI를 pitch/start/end/velocity 단위 객체로 다루는 Python 라이브러리. 연주 note event 표준화와 피드백 지표 계산에 적합.

## 원문 클리핑

## Overview

pretty_midi는 MIDI 데이터를 직관적인 형태로 다뤄 수정과 정보 추출을 쉽게 만드는 Python 유틸리티 라이브러리다("utility function/classes for handling MIDI data").

## Key Components

**PrettyMIDI Object**: MIDI 파일 데이터의 메인 컨테이너. tempo estimation, chroma analysis 등 전체 곡 단위 연산 지원.

**Instrument Class**: 파일 내 개별 악기. program(예: Cello, Piano)과 `is_drum` 속성으로 타악기 구분.

**Note Class**: 개별 음표의 4가지 핵심 속성:
- `pitch`: MIDI note number
- `velocity`: 세기(0–127)
- `start`: onset 시간(초)
- `end`: offset 시간(초)

## Common Usage Patterns

- **Analysis**: 로드 → tempo 추정 → chroma 벡터 계산(key 추정)
- **Modification**: non-drum 음표 transpose
- **Creation**: instrument 인스턴스화 → note 추가 → 파일 작성
- **Synthesis**: sine wave 합성 또는 fluidsynth로 오디오 변환

pip 설치 가능, 문서·Jupyter 튜토리얼·예제 MIDI 포함.

> 비고: Basic Pitch(15/16번)나 AMT가 만든 MIDI를 `pitch/start/end/velocity` 배열로 표준화하면, Partitura의 score note array와 정렬해 음정·리듬·길이·다이내믹 지표를 바로 계산할 수 있다.
