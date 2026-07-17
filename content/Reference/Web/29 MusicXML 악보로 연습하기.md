---
title: MusicXML 악보로 연습하기
source: https://hojel.tistory.com/entry/MusicXML-%EC%95%85%EB%B3%B4%EB%A1%9C-%EC%97%B0%EC%8A%B5%ED%95%98%EA%B8%B0
created: 2026-06-14
published:
author:
type: WebReference
clip_status: ok
feature: MusicXML 활용 한국어 사례
description: MusicXML 악보, OMR, YouTube 연동, 재생 위치 표시 같은 연습 UX를 한국어로 정리한 사례.
tags:
  - Music_Technology
  - Music_Performance_Assessment
  - MusicXML
  - Optical_Music_Recognition
canvas:
  - "[[MOC_Music_Technology.canvas]]"
MOC_Music_Technology: []
---

# MusicXML 악보로 연습하기

- 원문: [MusicXML 악보로 연습하기](https://hojel.tistory.com/entry/MusicXML-%EC%95%85%EB%B3%B4%EB%A1%9C-%EC%97%B0%EC%8A%B5%ED%95%98%EA%B8%B0)
- 관련 기능: MusicXML 활용 한국어 사례
- 선별 이유: MusicXML 악보, OMR, YouTube 연동, 재생 위치 표시 같은 연습 UX를 한국어로 정리한 사례.

## 원문 클리핑

### 배경지식

상용 스캔 악보나 [IMSLP](https://imslp.org/) 에서 다운받을 수 있는 저작권만료 악보들은 PDF이다.

PDF는 일반문서 포맷으로 패드에서 보거나 프린터에서 출력하기 좋으나 파일크기가 크고 음악에 대한 정보가 없다.

MusicXML은 악보를 기록하거나 Musescore, Finale, Sibelius 같은 작곡프로그램 간에 이동을 쉽게 하기 위해 만들어진 포맷이다. Musescore는 악보를 기록하는 오픈소스 프로그램으로 MusicXML로 된 파일을 불러오거나 내보낼 수 있다.

### MusicXML 파일 다운받기

MusicXML은 .mxl 확장자를 가지고 있다.

[OpenScore](https://openscore.cc/) 라는 오픈소스 악보를 공유하는 프로젝트가 있고, Musescore 사이트에서 유료 악보와 같이 제공하고 있다. 다운받으려 하더라도 Musescore 사이트 가입하면 플랜에 가입하라고 귀찮게 한다. 무료악보 다운받는데는 유료 서비스에 가입할 필요가 없으니 창닫기를 누른다. 예를 들어 저작권이 없는 바하는 무료이고, 저작권이 살아있는 지브리 ost 편곡은 유료이다.

가장 위의 검색창에서 곡을 검색하고 악기로 필터링 가능하다. 예를 들어 스즈키 가보트는 Lully Gavotte로 검색하면 여러개 나오고 Cello, Piano 악기로 필터링하면 피아노 반주 있는 첼로 악보를 찾을 수 있다.

화면에 **PD** 라고 나오는건 Public Domain, 즉 무료배포 수정가능한 악보란 뜻이다.

![](https://blog.kakaocdn.net/dna/bbvn0g/btsC2vU54sZ/AAAAAAAAAAAAAAAAAAAAANeqvEJhbaR7LkPip4Zqasqr8teGlrBXfFmqm9ddBKl5/img.png?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1782831599&allow_ip=&allow_referer=&signature=18uzMspdiadun2oABg7hiE9XXK4%3D)

[클릭](https://musescore.com/user/9928481/scores/5515080) 해 들어가면 아래와 같은 화면이 나오며 여기서 곡을 연주해볼 수 있다. 템포를 조절하거나, 피아노 반주를 끄고 켜는 것도 가능하다.

아이패드에서 [모바일 뮤즈스코어](https://apps.apple.com/us/app/musescore-sheet-music/id835731296) 앱에서도 웹사이트에서 같이 검색과 연주, 옵션조절이 가능하나, 오프라인 저장 같은 필요한 기능들이 유료가입자에게만 허용되어 있다.

오른쪽에 Download 단추가 있는데 누르면 여러 포맷이 뜨고 중간의 MusicXML 을 선택해서 다운로드 한다.

![](https://blog.kakaocdn.net/dna/nh2eB/btsCZ88fhxb/AAAAAAAAAAAAAAAAAAAAAE3JS9rRT4j8DQdhP8xFCtmwamVOJKbumqLMLreIuZ2i/img.png?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1782831599&allow_ip=&allow_referer=&signature=HFW9T21EysNI22e6zC%2BAaRFYjsY%3D)

다음을 알아두면 원하는 악보를 찾는데 유용하다.

- *Official* 딱지가 붙어 있는 악보는 유료계정에서만 다운로드 가능하다.
- *PRO* 딱지가 붙어 있는 것은 제공자가 프로계정을 가지고 있다는 뜻으로 돈을 내야한다는 것은 아니다.
- 왼쪽 필터옵션에서 바이올린과 피아노를 같이 선택하면 피아노 반주가 있는 바이올린 악보를 쉽게 찾을 수 있다.
- 어떤 악보들은 Public Domain이라도 musescore에서 연주, 출력만 가능하고 다운로드를 막은 것도 있다.

악보 파일 수정

혹시나 다운받은 악보에서 맘에 들지 않는 것이 있다면 [데스크탑 Musescore](https://musescore.org/) 앱에서 수정이 가능하다.

특히 활 방향, 손가락 등을 악보에 미리 추가할 수 있다.

이런 사보앱들은 자체 저장포맷이 있기에 저장대신 Export to MusicXML로 저장해야 한다.

### 아이패드에서 MusicXML 악보 보기

아이패드에서는 [Newzik](https://newzik.com/en/app/) 이라는 프로그램을 설치한다. 악보관리, 필기관리가 가능한 툴인데 PDF만을 지원하는 다른 앱들과 달리 MusicXML을 지원하는 것이 특징이다.

![](https://blog.kakaocdn.net/dna/CIWqT/btsCX4YfVwx/AAAAAAAAAAAAAAAAAAAAACvSRxZMqBv9xNC5mMULecfDkbQAdNYy7leshQnRTlMf/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1782831599&allow_ip=&allow_referer=&signature=4h9mFujYKcKleXsz%2BCQsPys9V0s%3D)

Newzik

가입하면 여기서도 일시불, 월정액 뭐라 나오는데 당장은 가입할 필요는 없다. 무료라도 3곡까지는 가능하다.

컴퓨터에 저장된 mxl 파일을 아이패드로 옮겨야 하는데 크게 세가지 방법이 있다.

- 아이패드로 애어드롭으로 파일을 보낸다. My Library에서 + 단추를 누르면 Import File 메뉴가 뜨는데 Files에서 저장된 파일을 선택한다.
- iCloud나 Dropbox 클라우드에 저장을 하고 앱에서 불러온다. Import 메뉴에서 Cloud 서비스로 들어가 파일을 선택한다.
- [Newzik 웹사이트](https://newzik.com/en/) 에 로그인하면 앱의 기능들을 브라우저에서도 사용가능하다. 여기서 악보를 로드하면 자동 싱크되어 앱에서도 보인다.

혹시나 악보가 너무 작게 나와도 놀래지 말고 핀치줌으로 적절한 크기로 조절한다. MusicXML의 장점은 한줄당 마디 Measure를 조절할 수 있다는 것이다.

아래는 아이폰에서 캡쳐한 화면이다.

![](https://blog.kakaocdn.net/dna/Ie5an/btsCWMjeTgL/AAAAAAAAAAAAAAAAAAAAAAUWnB0mzq-CahiHyV83RaMmXAIOcoz-2W9_b5jG-S2q/img.jpg?credential=yqXZFxpELC7KVnFOS48ylbz2pIh7yKj8&expires=1782831599&allow_ip=&allow_referer=&signature=o9ZA6Dl6R499ipl%2BiHQPPJ0maWU%3D)

1번 메뉴에서 전체, 첼로 악보 선택할 수 있다. 반주를 들을 거면 전체를 선택.

2번 메뉴에서 템포를 조절

3번 메뉴에서 참고할 유튜브 비디오를 연결

4번 메뉴에서 어떤 악보를 볼지(Staff), 반주때 어떤 악기 소리가 나오게 할지(Track) 정할 수 있다.

플레이를 누르면 빨간 바가 현재 연주되는 위치를 가르쳐준다.

참고로 다음 기능을 원할 때 아래와 같이 설정한다.

- **현악기 연주 미리 듣기** - 1에서 현악기를 고름
- **피아노 반주** - 4번에서 Piano Staff를 끄고, Tracks에서 Cello 음을 끈다

그외에도 다음과 같은 기능들을 지원한다 한다.

- 악보 메모
- 악보 및 메모를 팀원들과 공유 (유료)
- 악보인식 OMR - 뒤에 설명
- OMR 결과를 MusicXML로 출력 (유료)

### 스캔악보 연주하기

Newzik의 또다른 차별점은 LiveScores라고 하는 악보인식(OMR) 기능을 지원하는 것이다. 카메라로 찍거나 PDF로 된 악보을 인식해서 위와 같은 플레이가 가능하게 해준다. 플랜 가입유저는 제한없이 가능하고, 무료유저는 10페이지까지만 써볼 수 있다. 자세한 건 [리뷰](https://www.scoringnotes.com/reviews/newzik-maestria-review/#) 를 보기 바란다.

![](https://www.youtube.com/watch?v=RztWYDfaDEo)

### 추가: 뮤즈스코어를 이용해서 연습하기

안드로이드 태블릿의 경우 MusicXML을 지원하는 앱을 없다. 대신 OpenScore악보와 연계되어 있는 Musescore 앱을 이용할 수 밖에 없다.

Musescore도 트랙선택을 지원하지만 유료 옵션이다. 피아노 반주가 있는 악보라도 **Solo Piano** 로 표시된 악보는 피아노 반주 소리만 ~~나오니 이를 찾아보자~~ 나와야하나 잘 지켜지지 않는다.

### 유용한 정보

- [악보 뷰어 앱 비교](https://blog.naver.com/sim4m/222836207913) - ForScore 등의 여러 악보관리 앱을 비교
	- [스즈키 바이올린 악보](https://hojel.tistory.com/entry/%EC%8A%A4%EC%A6%88%ED%82%A4-%EB%B0%94%EC%9D%B4%EC%98%AC%EB%A6%B0-%EA%B3%A1-%EB%AA%A9%EB%A1%9D)
	- [스즈키 첼로 악보](https://hojel.tistory.com/entry/%EC%8A%A4%EC%A6%88%ED%82%A4-%EC%B2%BC%EB%A1%9C-%EA%B3%A1-%EB%AA%A9%EB%A1%9D)
	- [바이올린/첼로 소품 악보](https://hojel.tistory.com/entry/%EB%B0%94%EC%9D%B4%EC%98%AC%EB%A6%B0-%EC%86%8C%ED%92%88-%EC%95%85%EB%B3%B4%EB%93%A4)

#### '바이올린' 카테고리의 다른 글

| [스즈키 바이올린 곡 목록](https://hojel.tistory.com/entry/%EC%8A%A4%EC%A6%88%ED%82%A4-%EB%B0%94%EC%9D%B4%EC%98%AC%EB%A6%B0-%EA%B3%A1-%EB%AA%A9%EB%A1%9D) (0) | 2025.04.14 |
| --- | --- |
| [유명 바이올린 샵들 지도](https://hojel.tistory.com/entry/%EC%9C%A0%EB%AA%85-%EB%B0%94%EC%9D%B4%EC%98%AC%EB%A6%B0-%EC%83%B5%EB%93%A4-%EC%A7%80%EB%8F%84) (0) | 2024.07.04 |
| [바이올린 추천 악보 정리](https://hojel.tistory.com/entry/%EB%B0%94%EC%9D%B4%EC%98%AC%EB%A6%B0-%EC%95%85%EB%B3%B4-%EC%A0%95%EB%A6%AC) (0) | 2023.12.26 |
| [대학입시 바이올린 지정곡](https://hojel.tistory.com/entry/%EB%8C%80%ED%95%99%EC%9E%85%EC%8B%9C-%EB%B0%94%EC%9D%B4%EC%98%AC%EB%A6%B0-%EC%A7%80%EC%A0%95%EA%B3%A1) (0) | 2023.07.29 |
