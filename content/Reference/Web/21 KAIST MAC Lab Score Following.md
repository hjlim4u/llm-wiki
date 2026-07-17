---
title: KAIST MAC Lab Score Following
source: https://mac.kaist.ac.kr/score_following/score_following.html
created: 2026-06-14
published:
author:
type: WebReference
clip_status: ok
feature: score following 연구
description: 실시간 score following, lyrics alignment, Matchmaker 등 관련 연구 목록이 있는 연구 페이지.
tags:
  - Music_Technology
  - Music_Performance_Assessment
  - Score_Following
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# KAIST MAC Lab Score Following

- 원문: [KAIST MAC Lab Score Following](https://mac.kaist.ac.kr/score_following/score_following.html)
- 관련 기능: score following 연구
- 선별 이유: 실시간 score following, lyrics alignment, Matchmaker 등 관련 연구 목록이 있는 연구 페이지.

## 원문 클리핑

### Score Following and Visualization

##### Main Contributors: Jiyun Park, Taegyun Kwon

Score following refers to the process of tracking a live musical performance in real-time and comparing it to a written musical score. It is a technology that enables machines to understand and analyze what human musicians are playing in real time, laying the first foundation for empowering interactions between human musicians and AI systems, such as playing in harmony or providing automatic accompaniment. Score following has been an active research topic in Music Information Retrieval (MIR) since the 1980s.

![](https://mac.kaist.ac.kr/score_following/img/score_following_overview.png)

The field of score following holds a fundamental significance as it lays the groundwork for interactive music performance system between human and AI. Our research on score following aims to bridge the gap between the technical aspects of audio processing and the nuanced human experience of enjoying music, in order to make live music events more immersive and interactive.

##### Score Following for Singing Performance

![](https://mac.kaist.ac.kr/score_following/img/simple_overview.png)

Unlike fixed instrumental tracks, live performances in genres like classical singing or opera are dynamic, influenced by the singer's pronunciation, tempo changes, cues with an accompanist, and even the acoustics of the venue. The goal of real-time lyrics alignment is to take live singing audio as input and to pinpoint the exact position within given lyrics on the fly. The task can benefit real-world applications such as the automatic subtitling of live concerts or operas. Our research on real-time lyrics alignment focuses on capturing the nuances of singing performances and processing them in real-time.

  
![](https://www.youtube.com/watch?v=FNcr7OByZ94)

A demo of real-time lyrics alignment system

Related Publications

- **Matchmaker: an Open Source Library for Real Time Piano Score Following and Systematic Evaluation**  
	Jiyun Park, Carlos Eduardo Cancino-Chacón, Suhit Chiruthapudi, and Juhan Nam  
	*Proceedings of the 26th International Society for Music Information Retrieval Conference (ISMIR), 2025* [\[paper\]](https://ismir2025program.ismir.net/poster_92.html)
- **Matchmaker: A Python library for Real-time Music Alignment**  
	Jiyun Park, Carlos Cancino-Chacón, Taegyun Kwon, Juhan Nam  
	*Late Breaking Demo in the 25th International Society for Music Information Retrieval Conference (ISMIR), 2024*  
	[\[paper\]](https://ismir2024program.ismir.net/lbd_435.html)
- **A Real-Time Lyrics Alignment System Using Chroma and Phonetic Features for Classical Singing Performance**  
	Jiyun Park, Sangeon Yong, Taegyun Kwon, and Juhan Nam  
	*Proceedings of the IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP), 2024*  
	[\[paper\]](https://arxiv.org/abs/2401.09200) [\[demo\]](https://laurenceyoon.github.io/real-time-lyrics-alignment/)

##### Visualization and User Interfaces

Visual feedback and user interfaces in score following are essential as they provide intuitive interaction for musicians, ensuring synchronization with the music. They also enhance the audience's experience by bridging the gap between complex musical performances and audience understanding. With the diversification of device usage and musical performance settings, it's important to tailor user interfaces to accommodate these varying contexts.

![First Image](https://mac.kaist.ac.kr/score_following/img/sf_ar1.png) ![Second Image](https://mac.kaist.ac.kr/score_following/img/sf_ar2.png)

Interactive instrument interface and visualized sheet music display on smart glasses

![Image 1](https://mac.kaist.ac.kr/score_following/img/example1.png) ![Image 2](https://mac.kaist.ac.kr/score_following/img/example2.png) ![Image 3](https://mac.kaist.ac.kr/score_following/img/example3.png) ![Image 4](https://mac.kaist.ac.kr/score_following/img/example4.png)

Lyrics display for real-time lyrics tracking system: (left) Screen on concert venue; (right) smart glasses display.

From a human-computer interaction (HCI) point of view, our research extends beyond traditional web and tablet PC interfaces to applications in extended reality (XR) environments such as smart glasses. This approach aims to broaden the scope and effectiveness of score following technology in various interactive scenarios.

Related Publications

- **음악 공연을 위한 착용형 증강현실 실시간 음악 추적 시스템 | Real-Time Music Tracking System in Wearable AR Display for Music Performance**  
	박지윤, 송하일, 이승민, 남주한, 우운택 | Jiyun Park, Hail Song, Seungmin Lee, Juhan Nam, Woontack Woo  
	*한국HCI학회 학술대회 | Proceedings of the HCI Korea, 2023*  
	[\[paper\]](https://www.dbpia.co.kr/journal/articleDetail?nodeId=NODE11229665)

##### Performances

In collaboration with professional musicians, we have been developing various systems based on score-following algorithms and applying them to real-world performances. The 'Human-AI Relay Piano Performance System' is an interactive system that enables relay performance between a human pianist and an AI pianist via microphone and MIDI connection based on pre-generated performances and predefined parts. Additionally, our 'Automatic Lyrics Tracking System', first showcased in the collaboration with Soprano Sumi Jo, synchronizes live vocal performances with displayed lyrics without manual control. By introducing a new interface based on a system that can immediately respond to the immediacy and energy of performing arts, we aim to foster the development of future performing arts and provide innovative audience experiences.

- **'Haydn Abend': 2022 Spring Festival at Daejeon Art Center [\[link\]](https://www.daejeon.go.kr/djac/performanceView.do?menuSeq=6709&code=4207&yyyymm=202204&type=image)**  
	Jiyun Park, Taegyun Kwon, and Juhan Nam  
	  
	![](https://www.youtube.com/watch?v=tK3TIYQiYi8)
	2022 Daejeon Spring Festival - Relay Performance of AI & Pianist Subin Kim
	- Date: Apr 15th 2022
		- Venue: Daejeon Art Center
		- Program
		- **Subin Kim & KAIST AI Performance Team**  
			*F. J. Haydn - Piano Sonata in e minor, Hob. XVI/34*
		- Credit
		- Development and operation of Human-AI piano relay performance system based on score following algorithm
- **AI Pianist Performance: Collaboration with Soprano Sumi Jo [\[link\]](https://ismir2023program.ismir.net/music_6.html)**  
	Taegyun Kwon, Joonhyung Bae, Jiyun Park, Jaeran Choi, Hyeyoon Cho, Yonghyun Kim, Dasaem Jeong, and Juhan Nam  
	*Music Sessions of the 24nd International Society for Music Information Retrieval Conference (ISMIR), 2023*  
	![First Image](https://mac.kaist.ac.kr/score_following/img/concert_ik1.png)
	- Date: Jun 27th 2023
		- Venue: KAIST Sports Complex (N3)
		- Program
		- **Sumi Jo & KAIST AI Performance Team**  
			*Franz Schubert - Heidenröslein*  
			*정훈희 - 꽃밭에서*  
			*Franz Schubert - Ave Maria*
		- Credit
		- Automatic lyrics tracking system with screen display
				- Automatic expressive performance generation system (Virtuosonet)
				- Vocal reactive accompaniment system to adjust the timing for Virtuosonet
				- Visualization of virtual performer
- **Human-AI Piano Relay Performance (Pf. Jonghwa Park) - 2023 International Symposium on AI and Music Performance (ISAIMP) [\[link\]](https://sites.google.com/view/isaimp2023/lecture-concert?authuser=0)**  
	Jiyun Park, Taegyun Kwon, and Juhan Nam  
	  
	![ISAIMP Image](https://mac.kaist.ac.kr/score_following/img/concert_isaimp.jpeg)
	![](https://www.youtube.com/watch?v=kNE2wQJ2PDk)
	- Date: Dec 1st 2023
		- Venue: KAIST Cultural Complex
		- Program
		- **Jonghwa Park & KAIST AI Performance Team**  
			*F. J. Haydn - Piano Sonata in e minor, Hob. XVI/34 I. Presto*
		- Credit
		- Development and operation of Human-AI piano relay performance system based on score following algorithm
