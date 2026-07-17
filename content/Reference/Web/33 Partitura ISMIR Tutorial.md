---
title: Partitura ISMIR Tutorial
source: https://cpjku.github.io/partitura_tutorial/
created: 2026-06-14
published:
author:
type: WebReference
clip_status: ok
feature: 악보-연주 정렬 튜토리얼
description: Partitura로 symbolic music을 처리하고 performance-score 자동 정렬을 다루는 ISMIR 튜토리얼. note array 설계와 alignment 구현 단서.
tags:
  - Music_Technology
  - Music_Information_Retrieval
  - Score_Following
  - Music_Performance_Assessment
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# Partitura ISMIR Tutorial

- 원문: [Partitura ISMIR Tutorial](https://cpjku.github.io/partitura_tutorial/)
- 관련 기능: 악보-연주 정렬 튜토리얼
- 선별 이유: Partitura로 symbolic music을 처리하고 performance-score 자동 정렬을 다루는 ISMIR 튜토리얼. note array 설계와 alignment 구현 단서.

## 원문 클리핑

## Tutorial Focus

Python 패키지 Partitura로 symbolic music을 처리해 "extract relevant MIR features from symbolic musical formats in a fast, intuitive, and scalable way" 하는 법을 소개한다.

## Core Topics

1. **Introduction & Basics** — I/O와 symbolic music 자료구조의 기본
2. **Score-Performance Alignment** — performance와 그에 대응하는 score의 자동 정렬
3. **Pitch Spelling Model** — Partitura 기반 구현
4. **Transformer-Based Beat Generation** — 신경망 기반 생성

## Data & Formats

확장판 ASAP Dataset 사용:
- MusicXML scores
- MIDI performances
- Audio performances
- Score-to-performance alignments

## Target Audience

symbolic music 지식이 없는 MIR 연구자 대상. Python 숙련과 기초 통계/ML 이해 필요. 자료는 Google Colab 노트북으로 제공.

> 비고: 본 앱의 핵심인 "악보 note ↔ 연주 event" 매칭 설계에 직접 대응하는 튜토리얼이다. ASAP(MusicXML score + MIDI/audio performance + alignment)은 평가 파이프라인 프로토타이핑의 좋은 데이터셋 후보다. 구체 코드는 페이지가 아닌 Colab 노트북에 있음.
