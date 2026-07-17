---
source: https://www.youtube.com/watch?v=9-Jl0dxWQs8&list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi&index=8&t=1073s
created: 2025-11-20
published: 2024-08-31
title: How might LLMs store facts | Deep Learning Chapter 7
description: Enjoy the videos and music you love, upload original content, and share it all with friends, family, and the world on YouTube.
author:
  - 3Blue1Brown
duration: 22:42
tags: [AI/LLM, Deep_Learning/Transformer]
media_link: https://www.youtube.com/watch?v=9-Jl0dxWQs8&list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi&index=8&t=1073s
cover: https://i.ytimg.com/vi/9-Jl0dxWQs8/maxresdefault.jpg
---

![How might LLMs store facts | Deep Learning Chapter 7](https://www.youtube.com/embed/9-Jl0dxWQs8&list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi&index=8&t=1073s)

> [!summary]- Description
> Unpacking the multilayer perceptrons in a transformer, and how they may store facts
> Instead of sponsored ad reads, these lessons are funded directly by viewers: https://3b1b.co/support
> An equally valuable form of support is to share the videos.
> 
> AI Alignment forum post from the Deepmind researchers referenced at the video's start:
> https://www.alignmentforum.org/posts/iGuwZTHWb6DFY3sKB/fact-finding-attempting-to-reverse-engineer-factual-recall
> 
> Anthropic posts about superposition referenced near the end:
> https://transformer-circuits.pub/2022/toy_model/index.html
> https://transformer-circuits.pub/2023/monosemantic-features
> 
> Some added resources for those interested in learning more about mechanistic interpretability, offered by Neel Nanda
> 
> Mechanistic interpretability paper reading list
> https://www.alignmentforum.org/posts/NfFST5Mio7BCAQHPA/an-extremely-opinionated-annotated-list-of-my-favourite
> 
> Getting started in mechanistic interpretability
> https://www.neelnanda.io/mechanistic-interpretability/getting-started
> 
> An interactive demo of sparse autoencoders (made by Neuronpedia)
> https://www.neuronpedia.org/gemma-scope#main
> 
> Coding tutorials for mechanistic interpretability (made by ARENA)
> https://arena3-chapter1-transformer-interp.streamlit.app/
> 
> Звуковая дорожка на русском языке: Влад Бурмистров.
> 
> Sections:
> 0:00 - Where facts in LLMs live
> 2:15 - Quick refresher on transformers
> 4:39 - Assumptions for our toy example
> 6:07 - Inside a multilayer perceptron
> 15:38 - Counting parameters
> 17:04 - Superposition
> 21:37 - Up next
> 
> ------------------
> 
> These animations are largely made using a custom Python library, manim.  See the FAQ comments here:
> https://3b1b.co/faq#manim
> https://github.com/3b1b/manim
> https://github.com/ManimCommunity/manim/
> 
> All code for specific videos is visible here:
> https://github.com/3b1b/videos/
> 
> The music is by Vincent Rubinetti.
> https://www.vincentrubinetti.com
> https://vincerubinetti.bandcamp.com/album/the-music-of-3blue1brown
> https://open.spotify.com/album/1dVyjwS8FBqXhRunaG5W5u
> 
> ------------------
> 
> 3blue1brown is a channel about animating math, in all senses of the word animate. If you're reading the bottom of a video description, I'm guessing you're more interested than the average viewer in lessons here. It would mean a lot to me if you chose to stay up to date on new ones, either by subscribing here on YouTube or otherwise following on whichever platform below you check most regularly.
> 
> Mailing list: https://3blue1brown.substack.com
> Twitter: https://twitter.com/3blue1brown
> Instagram: https://www.instagram.com/3blue1brown
> Reddit: https://www.reddit.com/r/3blue1brown
> Facebook: https://www.facebook.com/3blue1brown
> Patreon: https://patreon.com/3blue1brown
> Website: https://www.3blue1brown.com

> [!\"transcript\"]- \"Transcript (YouTube)\"
> 

## Transformer 아키텍처 내 MLP를 통한 사실적 정보 저장 메커니즘 분석

-----

**1.0 서론 (Introduction) [00:00](http://www.youtube.com/watch?v=9-Jl0dxWQs8&t=0)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D9-Jl0dxWQs8%26t%3D0s)**
대규모 언어 모델(Large Language Models, LLM)이 어떻게 방대한 양의 사실적 지식을 내부에 저장하고 활용하는지 이해하는 것은 인공지능 연구 분야의 핵심적인 과제 중 하나입니다. 대규모 언어 모델에 '마이클 조던이 하는 스포츠는 \_\_'이라는 문장을 제시했을 때, 모델이 '농구'라고 정확히 예측하는 능력은 그 자체로 중요한 분석 대상입니다. 이는 모델의 수십억 개 매개변수 어딘가에 특정 사실이 내재되어 있음을 명확히 시사합니다.
본 기술 백서의 주요 목표는 Transformer 아키텍처 내에서 다층 퍼셉트론(Multi-Layer Perceptron, MLP) 블록이 사실적 정보를 저장하고 검색하는 데 수행하는 역할에 대한 상세하고 기술적인 해설을 제공하는 것입니다. Google DeepMind 연구원들의 통찰을 바탕으로, "마이클 조던은 농구 선수이다"라는 구체적인 사례를 통해 MLP의 내부 연산 과정을 단계별로 분석하여 그 메커니즘을 명확히 설명하고자 합니다.
MLP의 정교한 기능을 온전히 이해하기 위해, 먼저 이 메커니즘이 작동하는 Transformer 아키텍처의 기본 데이터 흐름과 고차원 벡터 공간이라는 개념적 틀을 구축하는 것이 필수적입니다.

**2.0 Transformer 아키텍처와 고차원 벡터 공간 (Transformer Architecture and High-Dimensional Vector Spaces) [02:12](http://www.youtube.com/watch?v=9-Jl0dxWQs8&t=132)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D9-Jl0dxWQs8%26t%3D132s)**
MLP 블록의 세부적인 작동 원리를 분석하기에 앞서, 이 블록이 어떤 환경에서 작동하는지 이해하는 것이 중요합니다. 이는 Transformer 모델 내 데이터의 흐름과, 모델이 정보를 표현하기 위해 사용하는 고차원 벡터 공간의 본질을 파악하는 것을 의미합니다.
Transformer의 데이터 처리 파이프라인은 입력된 텍스트가 '토큰(token)'이라는 작은 단위로 분할되는 것에서 시작됩니다. 각 토큰은 고유한 고차원 벡터, 즉 긴 숫자 목록으로 매핑되어 벡터 시퀀스를 형성합니다. 이후 이 벡터 시퀀스는 어텐션(Attention) 블록과 MLP 블록, 그리고 그 사이에 포함된 정규화(Normalization) 단계로 구성된 계층을 반복적으로 통과하며 처리됩니다.
이 과정에서 핵심적인 역할을 하는 것이 바로 '의미론적 벡터 공간(semantic vector space)'입니다. 이 고차원 공간에서 특정 '방향'은 특정 의미나 개념을 인코딩합니다. 고전적인 예시로 vector("여성") - vector("남성") + vector("삼촌") 연산은 vector("이모")와 매우 근접한 벡터를 결과로 내놓습니다. 이는 해당 벡터 공간 내에 '성별'이라는 개념을 나타내는 특정 방향이 존재함을 보여줍니다.
Transformer 내에서 벡터는 단순한 단어 임베딩 이상의 의미를 지닙니다. 이 벡터들은 네트워크를 통과하면서 어텐션 메커니즘을 통해 주변 문맥 정보를 흡수하고, MLP 블록을 통해 모델에 저장된 지식을 통합합니다. 이 과정을 거치면서 벡터는 다음 토큰을 예측하는 데 필요한 풍부하고 복합적인 정보를 담게 됩니다. 이러한 기초적인 이해를 바탕으로, 이제 MLP 블록 내부에서 일어나는 구체적인 연산 단계를 분석해 보겠습니다.

**3.0 MLP의 연산 과정: 사실 저장의 핵심 (The Computational Process of MLP: The Core of Fact Storage) [04:44](http://www.youtube.com/watch?v=9-Jl0dxWQs8&t=284)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D9-Jl0dxWQs8%26t%3D284s)**
이 장에서는 본 백서의 기술적 핵심 내용을 다룹니다. "마이클 조던은 농구 선수이다"라는 사실을 저장하는 MLP의 메커니즘을 단계별로 해부하여, 어떻게 특정 정보가 처리되고 추가되는지 구체적으로 살펴보겠습니다.
MLP 블록 내의 연산은 입력된 벡터 시퀀스의 각 벡터에 대해 독립적으로, 그리고 병렬적으로 동일하게 적용됩니다. 이 특성 덕분에 우리는 단 하나의 벡터가 MLP 블록을 통과하는 여정만 이해하면 전체 프로세스를 파악할 수 있어 분석이 용이해집니다.
사례 연구를 위해 다음과 같은 핵심 가정을 설정합니다.

  * 이전 계층의 어텐션 블록이 '마이클' 토큰과 '조던' 토큰의 정보를 성공적으로 통합하여, 분석 대상이 되는 단일 벡터 E가 두 이름의 의미를 모두 인코딩하고 있다고 가정합니다.
  * 벡터 공간 내 특정 방향이 이름 '마이클(Michael)'이라는 개념을 나타냅니다.
  * 이와 거의 직교하는 다른 방향이 성 '조던(Jordan)'이라는 개념을 나타냅니다.
  * 세 번째 방향은 '농구(basketball)'라는 스포츠를 나타냅니다.
  * '마이클 조던'을 나타내는 입력 벡터 E는 '마이클' 방향 벡터 및 '조던' 방향 벡터 각각과 내적(dot product)했을 때 그 값이 1이 됩니다.

**3.1 1단계: 상향 투영 (Up-Projection) - 특징 탐지 (Step 1: Up-Projection - Feature Detection) [07:22](http://www.youtube.com/watch?v=9-Jl0dxWQs8&t=442)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D9-Jl0dxWQs8%26t%3D442s)**
첫 번째 연산 단계는 입력 벡터 E에 거대한 '상향 투영(up-projection)' 행렬(W\_up)을 곱하고, 편향(bias) 벡터(B\_up)를 더하는 과정입니다.
W\_up 행렬의 각 행은 입력 벡터 E에 특정 특징이 존재하는지를 탐지하는 '탐침(probe)' 벡터로 해석될 수 있습니다. 예를 들어, W\_up의 특정 행이 '마이클' 방향 벡터(M)와 '조던' 방향 벡터(J)의 합, 즉 M+J와 같다고 가정해 보겠습니다. 이 행과 입력 벡터 E의 내적은 (M+J) • E = M•E + J•E로 계산됩니다. 가정에 따라 M•E와 J•E는 각각 1이므로 내적 값은 2가 됩니다. 여기에 편향 값으로 -1을 더하면 최종 결과는 1이 됩니다. 이 설계의 목적은 입력 벡터가 '마이클 조던' 전체 이름을 포함하는 경우에만(if and only if) 결과값이 양수가 되도록 하여, 명확한 트리거 신호를 생성하는 데 있습니다.

**3.2 2단계: 비선형 활성화 (Non-linear Activation) - 'AND 게이트' 구현 (Step 2: Non-linear Activation - 'AND Gate' Implementation) [10:30](http://www.youtube.com/watch?v=9-Jl0dxWQs8&t=630)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D9-Jl0dxWQs8%26t%3D630s)**
두 번째 단계에서는 상향 투영을 통해 얻은 중간 벡터를 비선형 활성화 함수, 구체적으로는 ReLU(Rectified Linear Unit)에 통과시킵니다. ReLU 함수의 작동 방식은 다음과 같습니다.

  * 모든 음수 값을 0으로 변환합니다.
  * 모든 양수 값은 그대로 유지합니다.

이러한 특성 덕분에 ReLU는 이 문맥에서 선택적 필터 또는 논리적인 'AND 게이트' 역할을 수행합니다. 이전 단계에서 '마이클 조던'이라는 특정 조합이 탐지되었을 때만 양수 값(1)이 생성되었고, 나머지 경우는 0 또는 음수였습니다. ReLU는 0 이하의 값들을 모두 0으로 '잘라내어' 오직 '마이클 조던'이라는 특징이 탐지되었을 때만 1이라는 깨끗한 신호(활성화된 '뉴런')가 발생하도록 만듭니다. 실제 모델에서는 GELU와 같이 더 부드러운 함수가 사용되기도 하지만, 개념적 설명을 위해서는 ReLU로 충분합니다.

**3.3 3단계: 하향 투영 (Down-Projection) - 정보 추가 (Step 3: Down-Projection - Information Addition) [12:13](http://www.youtube.com/watch?v=9-Jl0dxWQs8&t=733)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D9-Jl0dxWQs8%26t%3D733s)**
세 번째 단계는 활성화된 뉴런 값들로 구성된 벡터에 '하향 투영(down-projection)' 행렬(W\_down)을 곱하고, 편향 벡터(B\_down)를 더하는 과정입니다.
여기서는 W\_down 행렬을 열(column) 단위로 해석하는 것이 유용합니다. 각 열은 임베딩 공간과 동일한 차원을 가지며, 특정 개념을 나타내는 방향 벡터로 간주될 수 있습니다. 우리의 사례에 적용해 보면, 모델이 학습을 통해 W\_down의 첫 번째 열을 '농구' 방향 벡터와 동일하게 만들었다고 가정할 수 있습니다. 이렇게 되면, 첫 번째 뉴런이 1로 활성화되었을 때 '농구' 방향 벡터가 최종 결과에 더해집니다. 만약 뉴런이 0으로 비활성화 상태라면 아무런 정보도 더해지지 않습니다.

**3.4 4단계: 잔차 연결 (Residual Connection) - 정보 통합 (Step 4: Residual Connection - Information Integration) [14:09](http://www.youtube.com/watch?v=9-Jl0dxWQs8&t=849)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D9-Jl0dxWQs8%26t%3D849s)**
MLP 블록의 마지막 단계는 하향 투영을 통해 계산된 결과 벡터를 원래의 입력 벡터 E에 더하는 것입니다. 이 과정을 '잔차 연결(residual connection)'이라고 합니다.
전체 과정을 종합하면, MLP 블록은 정교한 '키-값(key-value)' 메모리 시스템처럼 작동합니다. 입력 벡터 E가 '마이클 조던'이라는 '키' 역할을 하면, MLP의 연산 과정은 그에 해당하는 '값', 즉 '농구'라는 정보를 검색하여 원래 벡터에 추가합니다. 이로써 벡터는 "마이클 조던은 농구와 관련이 있다"는 새로운 정보로 의미가 더욱 풍부해집니다. 이처럼 비교적 단순해 보이는 구조가 LLM 전체 매개변수의 막대한 부분을 차지하며 지식 저장의 핵심 역할을 수행합니다.

**4.0 GPT-3 사례를 통한 규모 분석 (Scale Analysis through the Case of GPT-3) [15:40](http://www.youtube.com/watch?v=9-Jl0dxWQs8&t=940)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D9-Jl0dxWQs8%26t%3D940s)**
MLP 블록이 얼마나 방대한 정보를 저장할 수 있는지 이해하기 위해서는 그 물리적인 규모를 살펴보는 것이 중요합니다. OpenAI의 GPT-3 모델을 기준으로 MLP 블록의 주요 사양은 다음과 같습니다.

|주요 사양 (Key Specification)|값 (Value)|
|--|--|
|전체 Transformer 블록 수|96개|
|임베딩 공간 차원|12,288|
|MLP 중간 차원 (뉴런 수)|약 50,000 (임베딩 차원의 4배)|
|MLP 블록 당 매개변수|약 12억 개 (W_up + W_down)|
|모든 MLP 블록의 총 매개변수|약 1,160억 개|
|전체 모델 매개변수에서 차지하는 비율|약 66% (1,750억 개 중 2/3)|

위 표에서 알 수 있듯이, GPT-3의 전체 1,750억 개 매개변수 중 약 2/3에 해당하는 1,160억 개가 MLP 블록에 집중되어 있습니다. 이러한 아키텍처적 선택은 LLM의 상당 부분이 단순한 연산 엔진이 아니라, 방대하고 분산된 지식 베이스(knowledge base) 역할을 하도록 설계되었다는 가설을 물리적으로 뒷받침합니다.
하나의 뉴런이 하나의 사실을 저장한다는 모델은 MLP의 작동 방식을 이해하는 데 유용한 비유입니다. 하지만 과연 이 거대한 매개변수 공간에서 정보가 실제로 그렇게 단순하게 저장될까요? 다음 장에서는 이 질문에 대한 더 발전된 가설을 살펴보겠습니다.

**5.0 고급 개념: 중첩 (Superposition) 가설 [17:52](http://www.youtube.com/watch?v=9-Jl0dxWQs8&t=1072)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D9-Jl0dxWQs8%26t%3D1072s)**
'중첩(superposition)' 가설은 LLM이 사실을 저장하는 방식에 대해 더 발전되고 현실에 가까운 설명을 제공합니다. 이 가설은 LLM의 놀라운 정보 저장 효율성과 동시에 모델 내부를 해석하기 어려운 이유를 설명하는 데 도움을 줍니다.
중첩은 고차원 공간의 독특한 기하학적 특성 때문에 가능합니다.

  * 먼저, n차원 공간에서 서로 완벽하게 직교(perpendicular)하는 벡터는 최대 n개만 존재할 수 있습니다. 이는 차원의 수학적 정의이기도 합니다.
  * 하지만 벡터들이 완벽하게 직교하지 않고 '거의 직교'(예: 89도에서 91도 사이)하는 것을 허용하면, 상황은 근본적으로 달라집니다. 고차원 공간에서는 이렇게 거의 직교하는 벡터를 차원 수(n)보다 지수적으로(exponentially) 더 많이 수용할 수 있습니다. 이 현상은 '존슨-린덴스트라우스 보조정리(Johnson-Lindenstrauss lemma)'라는 수학적 원리에 의해 뒷받침됩니다.

중첩 가설이 LLM에 시사하는 바는 다음과 같습니다.

  * 저장 용량: 모델은 자신이 가진 벡터 공간의 차원보다 훨씬 더 많은 독립적인 특징이나 개념을 저장할 수 있습니다. 이러한 지수적 성장 특성은 모델의 확장성에 중요한 시사점을 던집니다. 예를 들어, 10배 더 많은 차원을 가진 공간은 10배보다 훨씬 더 많은 독립적인 아이디어를 저장할 수 있으며, 이는 모델의 크기가 커질수록 성능이 급격하게 향상되는 '스케일링 법칙(scaling laws)'의 일부를 설명합니다.
  * 해석의 어려움: '마이클 조던'과 같은 깨끗한 단일 특징이 하나의 뉴런 활성화로 표현되는 것이 아니라, 여러 뉴런이 특정 조합으로 동시에 활성화되는 '중첩된' 상태로 표현될 가능성이 높다는 것을 의미합니다. 이로 인해 특정 뉴런의 역할을 개별적으로 파악하는 기계적 해석(mechanistic interpretability)은 극도로 어려워집니다.

이 중첩 가설은 모델을 통과하는 임베딩 공간 벡터뿐만 아니라, MLP 내부의 중간 뉴런 활성화 벡터에도 동일하게 적용됩니다. 즉, GPT-3 규모의 모델은 약 5만 개의 개별 특징을 탐지하는 것이 아니라, 거의 직교하는 방향을 활용하여 잠재적으로 지수적으로 더 많은 중첩된 특징들을 탐지할 수 있습니다. 이는 모델의 방대한 용량과 불투명성을 동시에 설명하는 핵심적인 통찰입니다. 연구자들은 이러한 중첩된 특징들을 분해하고 추출하기 위해 '희소 오토인코더(sparse autoencoder)'와 같은 도구를 사용하고 있습니다.

**6.0 결론 (Conclusion) [21:42](http://www.youtube.com/watch?v=9-Jl0dxWQs8&t=1302)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3D9-Jl0dxWQs8%26t%3D1302s)**
본 백서는 Transformer 아키텍처 내 MLP 블록이 단순한 연산 계층을 넘어, 정교한 '키-값' 메모리 시스템으로 기능하며 사실적 지식을 저장하는 핵심적인 역할을 수행함을 분석했습니다.
MLP의 핵심 메커니즘은 상향 및 하향 투영 행렬 곱셈과 비선형 활성화 함수의 조합을 통해 입력 벡터에 내재된 특정 특징(키)을 감지하고, 그와 연관된 사실 정보(값)를 벡터에 추가하여 의미를 풍부하게 만드는 과정으로 요약할 수 있습니다.
GPT-3의 사례에서 보았듯이 MLP는 모델 전체 매개변수의 약 2/3를 차지하며, '중첩' 가설은 모델이 고차원 공간의 특성을 활용하여 차원 수를 훨씬 뛰어넘는 정보를 효율적으로 저장하고 있음을 시사합니다. 따라서, 고도로 분산되고 압축된 형태로 저장된 지식의 정확한 작동 원리를 밝혀내는 것은, 신뢰할 수 있고 투명한 인공지능을 구현하기 위한 핵심적인 도전 과제이자 가장 활발한 연구 영역으로 남아있습니다.
