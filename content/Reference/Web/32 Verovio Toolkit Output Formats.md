---
title: Verovio Toolkit Output Formats
source: https://book.verovio.org/toolkit-reference/output-formats.html
created: 2026-06-14
published:
author:
type: WebReference
clip_status: ok
feature: 포맷 변환/타임맵
description: Verovio가 지원하는 입출력 포맷과 timemap/expansionmap. 악보-연주 동기화에 쓸 타이밍 매핑 데이터 생성 근거.
tags:
  - Music_Technology
  - MEI
  - MusicXML
  - MIDI
  - Score_Following
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# Verovio Toolkit Output Formats

- 원문: [Verovio Toolkit Output Formats](https://book.verovio.org/toolkit-reference/output-formats.html)
- 관련 기능: 포맷 변환/타임맵
- 선별 이유: Verovio가 지원하는 입출력 포맷과 timemap/expansionmap. 악보-연주 동기화에 쓸 타이밍 매핑 데이터 생성 근거.

## 원문 클리핑

## Input Formats
- MusicXML
- ABC
- MEI (Music Encoding Initiative)
- Humdrum
- Plaine and Easie (PAE)

## Output Formats

**Visual/Audio Formats:**
- **SVG**: 내부 구조와 SVG 출력 제어 옵션 제공
- **MIDI**: command-line/JavaScript 툴킷에서 기본 MIDI 출력 가능
- **MEI**: MEI 변환기로 사용해 구버전 파일을 최신 MEI로 업그레이드 가능

**Data/Mapping Formats:**
- **Timemap**: note timing 이벤트를 timestamp + quarter-note 위치로 추적하는 JSON 배열
- **Expansionmap**: 원본 악보 요소를 반복/펼친(unfolded) 구간에 매핑하는 JSON
- **Plaine and Easie**: 모든 음표에 명시적 duration을 갖는 텍스트 포맷
- **Humdrum**: MusicXML 입력에서만 가능

## Format Conversion Commands

```
verovio -t [format] -o output.file input-file
```

- MIDI: `verovio -t midi -o output.midi input-file.mei`
- Timemap: `verovio -t timemap -o output.json input-file.mei`
- Expansionmap: `verovio -t expansionmap -o output.json expansion-001.mei`
- Humdrum from MusicXML: `verovio -f musicxml-hum -t hum file.xml`

> 비고: timemap은 악보 음표를 시간 좌표로 매핑하므로 score-audio alignment 결과를 악보 위에 시각화할 때 핵심 데이터다. expansionmap은 반복 기호로 인한 점프 처리(23/24번 클립의 Just Label the Repeats 문제)와 직접 연결된다.
