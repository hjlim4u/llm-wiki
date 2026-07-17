---
source: https://www.youtube.com/watch?v=HhFPGClMY9o&list=PLcXyemr8ZeoQRLFPZz3YKfudotIe-ZJFA&index=15
created: 2025-11-15
published: 2025-10-01
title: "제네릭 6부 : 와일드카드의 핵심 개념과 세 가지 종류의 와일드카드까지 한방에 설명드립니다!"
description: "이번 영상에서는 아래와 같은 개념을 다루게 됩니다* 공변과 불공변의 개념* 배열은 왜 공변일까?* 제네릭은 왜 불공변일까?* 제네릭에서 서브타입 개념이 영상은 9월 5일 오전 9시에 Improver 이상의 멤버십 전용 영상으로 전환됩니다.👉 멤버십 가입 링크 : https://w..."
author:
  - 쉬운코드
duration: 24:19
tags:
  - Java/Generic/Wildcard
media_link: https://www.youtube.com/watch?v=HhFPGClMY9o&list=PLcXyemr8ZeoQRLFPZz3YKfudotIe-ZJFA&index=15
cover: https://i.ytimg.com/vi/HhFPGClMY9o/maxresdefault.jpg
canvas:
  - "[[JAVA_temp.canvas]]"
JAVA_temp: []
---

![제네릭 6부 : 와일드카드의 핵심 개념과 세 가지 종류의 와일드카드까지 한방에 설명드립니다!](https://www.youtube.com/embed/HhFPGClMY9o&list=PLcXyemr8ZeoQRLFPZz3YKfudotIe-ZJFA&index=15)

> [!summary]- Description
> 제네릭의 와일드카드부터 어렵게 느껴지기 시작하죠.
> 
> 쉬운코드가 와일드카드의 핵심 개념을 이해하기 쉽게 설명드립니다!
> 
> 세 가지 종류의 와일드카드까지 포함해서 자세히 설명하니까요, 놓치지 마세요!
> 
> 이 영상은 10월 4일 21시에 Improver 이상의 멤버십 전용 영상으로 전환됩니다.
> 👉 멤버십 가입 링크 : https://www.youtube.com/channel/UCReNwSTQ1RqDZDnG9Qz_gyg/join
> 
> 00:00 제네릭이 불공변이라서 생기는 장단점
> 00:32 제네릭의 불편한 점 : 다형성을 못쓰는 경우
> 01:27 이런 불편함을 해결하는 존재: 와일드카드
> 01:54 와일드카드(wildcard) 뜻 핵심
> 02:33 와일드카드 특징 1: 여러 type argument를 유연하게 받고 싶을 때 사용
> 03:47 와일드카드 특징 2: type argument 위치에서만 사용 가능
> 06:11 와일드카드 특징 3: 제네릭 타입의 객체를 참조하는 용도로만 사용 가능
> 06:49 와일드카드 특징 4: 와일드카드를 쓰면 실제 type argument가 뭔지는 모름
> 07:44 와일드카드 개념 정리
> 08:01 중간 정리: 지금까지의 제네릭 시리즈 내용 요약
> 08:53 와일드카드의 세가지 종류 소개
> 09:44 unbounded wildcard 소개
> 0955  unbounded wildcard 기반에서 참조하기
> 10:11 unbounded wildcard 기반에서 데이터 읽기
> 11:51 unbounded wildcard 기반에서 데이터 쓰기
> 12:50 upper bounded wildcard 소개
> 13:21 upper bounded wildcard 기반에서 참조하기
> 14:30 upper bounded wildcard 기반에서 데이터 읽기
> 16:08 upper bounded wildcard 기반에서 데이터 쓰기
> 17:37 lower bounded wildcard 소개
> 18:14 lower bounded wildcard 기반에서 참조하기
> 18:53 lower bounded wildcard 기반에서 데이터 읽기
> 20:57 lower bounded wildcard 기반에서 데이터 쓰기
> 23:50 와일드카드 세 종류 설명 마무리
> 24:00 마무리

> [!\"transcript\"]- \"Transcript (YouTube)\"
> 

  

﻿[00:29](https://youtu.be/HhFPGClMY9o?t=29)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_88929a54-46ca-489f-960a-77cd3749741d.jpeg)

  

  

﻿[01:18](https://youtu.be/HhFPGClMY9o?t=78)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_01609613-be8d-4bdd-b756-c47b077354b0.jpeg)

  

  

﻿[01:25](https://youtu.be/HhFPGClMY9o?t=85)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_f2fc982d-f84d-4a95-8761-1febedc49140.jpeg)

  

  

  

﻿[02:23](https://youtu.be/HhFPGClMY9o?t=143)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_70ef64be-a2fe-4616-8324-427060f29222.jpeg)

  

  

  

﻿[03:04](https://youtu.be/HhFPGClMY9o?t=184)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_24072083-a503-4354-9fdc-d2d1c8d4dd99.jpeg)

  

  

﻿[03:27](https://youtu.be/HhFPGClMY9o?t=207)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_9842c50d-46a0-481d-8fd9-7be55bc04416.jpeg)

  

  

﻿[05:15](https://youtu.be/HhFPGClMY9o?t=315)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_1be95696-73c1-413b-a3d6-a9d9b451317f.jpeg)

  

  

﻿[05:41](https://youtu.be/HhFPGClMY9o?t=341)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_24189407-0d0c-4a17-a4ae-51e760332635.jpeg)

  

  

﻿[05:52](https://youtu.be/HhFPGClMY9o?t=352)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_305b24d2-370d-4bc5-803b-e5f6f9469fa7.jpeg)

  

  

﻿[06:48](https://youtu.be/HhFPGClMY9o?t=408)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_6a382189-b518-4bad-9840-7f0bd7323945.jpeg)

  

  

﻿[07:01](https://youtu.be/HhFPGClMY9o?t=421)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_d706588d-70be-4ab6-adab-ee4640c76130.jpeg)

  

  

﻿[08:00](https://youtu.be/HhFPGClMY9o?t=480)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_62c3f048-f02f-4359-92ef-b85236332fe1.jpeg)

  

  

﻿[08:31](https://youtu.be/HhFPGClMY9o?t=511)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_d80d1b5a-675c-44d0-aa3e-1f2923b86624.jpeg)

  

  

﻿[08:41](https://youtu.be/HhFPGClMY9o?t=521)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_2e580d2c-312d-49b7-8b13-d4301923d335.jpeg)

  

  

﻿[09:39](https://youtu.be/HhFPGClMY9o?t=579)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_2c8a0d61-988f-4bf7-b466-cce2e4fb7fbd.jpeg)

  

  

﻿[10:11](https://youtu.be/HhFPGClMY9o?t=611)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_7c90b6cc-a9b0-4dc0-bb41-219674e9a96a.jpeg)

  

  

﻿[10:48](https://youtu.be/HhFPGClMY9o?t=648)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_563748d3-7caa-4542-b47c-da3dba69f032.jpeg)

  

  

﻿[15:38](https://youtu.be/HhFPGClMY9o?t=938)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_367c2d1b-ec93-4e4a-a85d-7c4e72f30f28.jpeg)

  

  

﻿[15:45](https://youtu.be/HhFPGClMY9o?t=945)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_31926de0-ee6f-4a85-970c-3adc7d630f73.jpeg)

  

﻿[16:05](https://youtu.be/HhFPGClMY9o?t=965)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_03a2dd32-b4c8-43ad-a1d3-a3b1f5a1e842.jpeg)

  

  

  

﻿[05:58](https://youtu.be/HhFPGClMY9o?t=358)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_b672fcf8-5744-4723-92a8-5ffd5c6a0d09.jpeg)

  

  

﻿[22:41](https://youtu.be/HhFPGClMY9o?t=1361)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_2df61cd6-c0a6-4c80-8723-93a7f43f5511.jpeg)

  

  

﻿[23:10](https://youtu.be/HhFPGClMY9o?t=1390)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_c2f77f71-ccd6-46f4-bf54-6d33f0917685.jpeg)

  

  

﻿[23:34](https://youtu.be/HhFPGClMY9o?t=1414)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_759ec64a-80d0-49d6-9730-99e4718e295b.jpeg)

  

  

﻿[23:41](https://youtu.be/HhFPGClMY9o?t=1421)﻿

![Please Reload/Refresh this tab.](https://storage.googleapis.com/askify-screenshot/oqt4gxMSzBPf28I0LALXQLuokX13/extension_screenshots/screenshot_default_15ef2f97-4f7f-48ef-a380-c5f91754c5bb.jpeg)
