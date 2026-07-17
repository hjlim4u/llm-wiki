---
title: Basic Pitch Web Demo
source: https://basicpitch.spotify.com/
created: 2026-06-14
published:
author:
type: WebReference
clip_status: ok
feature: audio-to-MIDI 데모 UX
description: 브라우저에서 단일 악기 오디오를 업로드/녹음해 pitch bend 포함 MIDI로 변환하는 무료 오픈소스 데모. 변환 기능 UX 벤치마크.
tags:
  - Music_Technology
  - Music_Information_Retrieval
  - MIDI
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# Basic Pitch Web Demo

- 원문: [Basic Pitch Web Demo](https://basicpitch.spotify.com/)
- 관련 기능: audio-to-MIDI 데모 UX
- 선별 이유: 브라우저에서 단일 악기 오디오를 업로드/녹음해 pitch bend 포함 MIDI로 변환하는 무료 오픈소스 데모. 변환 기능 UX 벤치마크.

## 원문 클리핑

## What It Does

오디오 녹음을 MIDI 파일로 변환하는 브라우저 기반 도구. "pitch bend detection" 기능 포함, Spotify가 개발한 무료 오픈소스 앱.

## Supported Input

.wav, .mp3 등 다양한 오디오 포맷. 브라우저에서 직접 녹음하거나 단일 악기 오디오(piano, guitar, xylophone 등) 업로드.

## User Experience

1. 오디오 업로드 또는 직접 녹음
2. 다운로드된 모델로 오디오 처리
3. MIDI 파일 반환
4. MIDI 다운로드 후 DAW에서 추가 편집

## Access & Resources

데모 사이트에서 무료 제공, 소스 코드는 GitHub(15번 클립). Spotify Open Source/R&D 관련 프로젝트.

> 비고: 본 앱 "연주 음원 → 컴퓨터 포맷 변환"(2번 기능)의 가장 손쉬운 레퍼런스 UX. 단일 악기 MVP에서 사용자가 음원을 넣고 MIDI를 얻는 흐름을 그대로 차용 가능. 15/16번(README, Spotify Engineering)과 짝.
