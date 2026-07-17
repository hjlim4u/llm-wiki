---
title: Optical Music Recognition State of the Art and Open Issues
source: https://link.springer.com/article/10.1007/s13735-012-0004-6
created: 2026-06-14
published: 2012
author: Rebelo et al.
type: WebReference, WebReference
clip_status: reference
feature: OMR 파이프라인 단계
description: 전처리·기호 인식·notation reconstruction·최종 표현 생성으로 이어지는 전통 OMR 파이프라인 단계를 정리한 survey. OMR 시스템 설계의 단계적 이해.
tags:
  - Music_Technology
  - Optical_Music_Recognition
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# Optical Music Recognition State of the Art and Open Issues

- 원문: [Optical Music Recognition State of the Art and Open Issues](https://link.springer.com/article/10.1007/s13735-012-0004-6)
- 관련 기능: OMR 파이프라인 단계
- 선별 이유: 전처리·기호 인식·notation reconstruction·최종 표현 생성으로 이어지는 전통 OMR 파이프라인 단계를 정리한 survey. OMR 시스템 설계의 단계적 이해.

## 원문 클리핑

> 접근 메모: Springer가 인증 페이지로 리다이렉트해 본문 인라인 클리핑에 실패했다(paywall). 아래는 출처 식별·메타정보 중심 요약이며, 인용 시 원문(또는 기관 접근)을 직접 확인할 것.

- 서지: Rebelo et al., "Optical music recognition: state-of-the-art and open issues," *International Journal of Multimedia Information Retrieval* (Springer), 2012. DOI 10.1007/s13735-012-0004-6.
- 전통 OMR 파이프라인을 4단계로 정리하는 고전적 reference:
  1. **Image preprocessing** — 이진화, 노이즈 제거, 기울기/스큐 보정
  2. **Staff line / music symbol recognition** — 오선 검출·제거, 기호(음표머리·기둥·쉼표·조표 등) 검출
  3. **Musical notation reconstruction** — 검출된 기호를 음악적 의미(피치·박자·성부)로 재구성
  4. **Final representation construction** — MusicXML/MIDI 등 심볼릭 출력 생성
- open issues: 손글씨·저품질 악보, polyphony, 평가 기준 부재 등.

> 연관: 08번(Understanding OMR), 09번(OMR State of the Art and Major Challenges, 2020)과 함께 OMR 단계·한계 이해의 기본 3종. 본 앱에서는 단계마다 confidence를 노출하고 사용자 교정 루프를 두는 설계 근거.
