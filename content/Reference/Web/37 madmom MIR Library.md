---
title: madmom MIR Library
source: https://github.com/CPJKU/madmom
created: 2026-06-14
published:
author:
type: WebReference, WebReference
clip_status: ok
feature: onset/beat/tempo 분석
description: onset detection, beat/downbeat tracking, tempo estimation, note transcription을 신경망으로 제공하는 Python MIR 라이브러리. 리듬·타이밍 평가 하위기능 후보.
tags:
  - Music_Technology
  - Music_Information_Retrieval
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# madmom MIR Library

- 원문: [madmom MIR Library](https://github.com/CPJKU/madmom)
- 관련 기능: onset/beat/tempo 분석
- 선별 이유: onset detection, beat/downbeat tracking, tempo estimation, note transcription을 신경망으로 제공하는 Python MIR 라이브러리. 리듬·타이밍 평가 하위기능 후보.

## 원문 클리핑

madmom은 "an audio signal processing library written in Python with a strong focus on music information retrieval (MIR) tasks"이다.

## Key Capabilities

- **Onset Detection**: bidirectional neural network으로 음표 시작 시점 식별
- **Beat and Downbeat Tracking**: 리듬 패턴·구조적 downbeat 추적
- **Tempo Estimation**: 곡 속도 산출
- **Note Transcription**: polyphonic 오디오 → 심볼릭 note 표현
- **Chord Recognition**: 장르 전반의 화성 내용 식별

## Background

오스트리아 Johannes Kepler University Computational Perception 학과와 OFAI가 개발. Python + Cython(약 97% Python, 3% Cython), NumPy/SciPy 기반.

> 비고: 연주 리듬·타이밍 평가의 핵심인 onset/beat 추출에 강하다. 음정 평가는 librosa/Essentia/CREPE류로 보완하고, madmom은 리듬·박자 정렬 정확도에 집중 배치하는 조합이 자연스럽다.
