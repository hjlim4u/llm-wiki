---
source: https://www.youtube.com/watch?v=-ticJOcwrN8
created: 2025-11-03
published: 2025-05-07
title: 자바 참조 변수, 참조 타입, 스택 프레임(stack frame)
description: Enjoy the videos and music you love, upload original content, and share it all with friends, family, and the world on YouTube.
author:
  - 쉬운코드
duration: 17:07
tags:
  - Java/Reference_Type
  - Computer_Science/Memory_Management
  - Computer_Science/Stack_Frame
media_link: https://www.youtube.com/watch?v=-ticJOcwrN8
cover: https://i.ytimg.com/vi/-ticJOcwrN8/maxresdefault.jpg
---

![자바 참조 변수, 참조 타입, 스택 프레임(stack frame)](https://www.youtube.com/embed/-ticJOcwrN8)

> [!summary]- Description
> 퀴즈를 통해 자바 참조 변수와 참조 타입에 대한 개념을 점검하고 정리해 보시죠.
> 
> 지난번 영상보다 조금 더 복잡한 퀴즈입니다.
> 
> 메서드 호출 과정 동안 일어나는 일도 알기 쉽게 정리했어요.

> [!\"transcript\"]- \"Transcript (YouTube)\"
> 


[01:14](https://youtu.be/undefined?t=74)
![](https://storage.googleapis.com/askify-screenshot/WrKXkW2BoTV5HR8o4w7F28Z61NB2/extension_screenshots/screenshot_default_d76a285d-0364-45f8-9356-5a1b825e91fc.jpeg)
[04:30](https://youtu.be/undefined?t=270)
![](https://storage.googleapis.com/askify-screenshot/WrKXkW2BoTV5HR8o4w7F28Z61NB2/extension_screenshots/screenshot_default_e089f7a0-9e3e-45bc-9de8-2aab28658ca5.jpeg)this: 객체 메서드 호출 시 전달되는 숨겨진 파라미터(자기 자신 참조값)


[06:55](https://youtu.be/undefined?t=415)
![](https://storage.googleapis.com/askify-screenshot/WrKXkW2BoTV5HR8o4w7F28Z61NB2/extension_screenshots/screenshot_default_81a60404-5e01-4351-b217-f317bef3b805.jpeg)

[07:52](https://youtu.be/undefined?t=472)
![](https://storage.googleapis.com/askify-screenshot/WrKXkW2BoTV5HR8o4w7F28Z61NB2/extension_screenshots/screenshot_default_ff0073d4-04d1-4ddf-abf8-699aa2fd77f8.jpeg)
메소드 호출 후 스택 프레임 pop

[11:19](https://youtu.be/undefined?t=679)
![](https://storage.googleapis.com/askify-screenshot/WrKXkW2BoTV5HR8o4w7F28Z61NB2/extension_screenshots/screenshot_default_34b18a5b-9ec1-4bbd-8293-7c83a28a3ffd.jpeg)
call-by-reference로 전달한 객체의 내부 멤버 변수의 데이터 변경

[13:18](https://youtu.be/undefined?t=798)
![](https://storage.googleapis.com/askify-screenshot/WrKXkW2BoTV5HR8o4w7F28Z61NB2/extension_screenshots/screenshot_default_0da7d14a-88a4-4ddf-bc46-da2ec3701ae9.jpeg)
새로운 객체 생성 후 스택 프레임의 지역 변수를 새로 생성한 객체의 참조값으로 치환
[14:02](https://youtu.be/undefined?t=842)
![](https://storage.googleapis.com/askify-screenshot/WrKXkW2BoTV5HR8o4w7F28Z61NB2/extension_screenshots/screenshot_default_82f0c4a1-0713-402d-8e0f-aac5991ca784.jpeg)
wow는 static 메소드이기 때문에 인자로 this 전달 안함(스택 프레임에 this X)
