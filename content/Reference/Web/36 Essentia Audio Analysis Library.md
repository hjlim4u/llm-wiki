---
title: Essentia Audio Analysis Library
source: https://essentia.upf.edu/
created: 2026-06-14
published:
author:
type: WebReference, WebReference
clip_status: ok
feature: 오디오 특징 추출
description: pitch/onset/beat/tempo/spectral/tonal/high-level descriptor를 추출하는 오픈소스 MIR 라이브러리. 연주 분석·평가 특징 추출 후보.
tags:
  - Music_Technology
  - Music_Information_Retrieval
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# Essentia Audio Analysis Library

- 원문: [Essentia Audio Analysis Library](https://essentia.upf.edu/)
- 관련 기능: 오디오 특징 추출
- 선별 이유: pitch/onset/beat/tempo/spectral/tonal/high-level descriptor를 추출하는 오픈소스 MIR 라이브러리. 연주 분석·평가 특징 추출 후보.

## 원문 클리핑

## What Is Essentia?

오디오 분석과 음악 정보 검색(MIR)을 위한 오픈소스 C++ 라이브러리. "open-source library and tools for audio and music analysis, description and synthesis"로 소개되며, robustness·연산 속도·낮은 메모리 사용에 최적화되어 cross-platform 지원.

## Core Capabilities

- audio I/O, 표준 DSP 블록, 데이터 통계 특성화
- spectral, temporal, tonal, high-level music descriptor 다수
- Beat tracking / tempo(BPM) estimation
- Pitch/melody extraction (monophonic & polyphonic)
- Onset detection / transient 식별
- Spectral analysis, loudness metering, key detection
- Audio segmentation, cover song detection, voice activity detection
- TensorFlow 딥러닝 모델 추론

## Language Support

Python·JavaScript 바인딩, 다양한 command-line 도구, third-party 확장 제공 → 빠른 프로토타이핑에 유리.

## Applications

similarity, sound classification, mood detection, audio fingerprinting, synthesis, audio quality assessment 등. Freesound, AcousticBrainz, LANDR, Plex 등이 채택.

> 비고: 음원을 MIDI로 완전 변환하지 않고도 pitch contour·onset·loudness·spectral descriptor를 뽑아 score-following과 연주 평가(음정/리듬/다이내믹/음색)에 쓸 수 있는 핵심 후보. madmom(37번)·librosa(19번)와 역할이 겹치므로 비교 검토 필요.
