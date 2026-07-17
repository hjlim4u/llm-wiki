---
source: https://www.youtube.com/watch?v=eMlx5fFNoYc&list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi&index=7
created: 2025-11-22
published: 2024-04-07
title: How might LLMs store facts | Deep Learning Chapter 7
description: Unpacking the multilayer perceptrons in a transformer, and how they may store factsInstead of sponsored ad reads, these lessons are funded directly by viewer...
author:
  - 3Blue1Brown
duration: 26:09
tags:
  - Deep_Learning/Attention
  - Deep_Learning/Transformer
media_link: https://www.youtube.com/watch?v=eMlx5fFNoYc&list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi&index=7
cover: https://i.ytimg.com/vi/eMlx5fFNoYc/maxresdefault.jpg
---
 
![Attention in transformers, step-by-step | Deep Learning Chapter 6](https://www.youtube.com/embed/eMlx5fFNoYc&list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi&index=7)

> [!summary]- Description
> Demystifying attention, the key mechanism inside transformers and LLMs.
> Instead of sponsored ad reads, these lessons are funded directly by viewers: https://3b1b.co/support
> Special thanks to these supporters: https://www.3blue1brown.com/lessons/attention#thanks
> An equally valuable form of support is to simply share the videos.
> 
> Demystifying self-attention, multiple heads, and cross-attention.
> Instead of sponsored ad reads, these lessons are funded directly by viewers: https://3b1b.co/support
> 
> The first pass for the translated subtitles here is machine-generated and, therefore, notably imperfect. To contribute edits or fixes, visit https://www.criblate.com
> 
> Звуковая дорожка на русском языке: Влад Бурмистров.
> 
> ------------------
> 
> Here are a few other relevant resources
> 
> Build a GPT from scratch, by Andrej Karpathy
> https://youtu.be/kCc8FmEb1nY
> 
> If you want a conceptual understanding of language models from the ground up, @vcubingx just started a short series of videos on the topic:
> https://youtu.be/1il-s4mgNdI?si=XaVxj6bsdy3VkgEX
> 
> If you're interested in the herculean task of interpreting what these large networks might actually be doing, the Transformer Circuits posts by Anthropic are great. In particular, it was only after reading one of these that I started thinking of the combination of the value and output matrices as being a combined low-rank map from the embedding space to itself, which, at least in my mind, made things much clearer than other sources.
> https://transformer-circuits.pub/2021/framework/index.html
> 
> Site with exercises related to ML programming and GPTs
> https://www.gptandchill.ai/codingproblems
> 
> History of language models by Brit Cruise,  @ArtOfTheProblem  
> https://youtu.be/OFS90-FX6pg
> 
> An early paper on how directions in embedding spaces have meaning:
> https://arxiv.org/pdf/1301.3781.pdf
> 
> ------------------
> 
> Timestamps:
> 0:00 - Recap on embeddings
> 1:39 - Motivating examples
> 4:29 - The attention pattern
> 11:08 - Masking
> 12:42 - Context size
> 13:10 - Values
> 15:44 - Counting parameters
> 18:21 - Cross-attention
> 19:19 - Multiple heads
> 22:16 - The output matrix
> 23:19 - Going deeper
> 24:54 - Ending
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

### 트랜스포머 어텐션 메커니즘 기술 개요

**1. 서론: 어텐션 메커니즘의 중요성 [00:00](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=0)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D0s)**

어텐션 메커니즘은 현대 대규모 언어 모델(LLM)의 근간을 이루는 핵심 기술이다. 2017년 발표된 논문 'Attention is All You Need'에서 처음 소개된 이래, 어텐션은 모델이 텍스트 내 단어들 간의 복잡한 문맥적 관계를 파악하는 방식을 근본적으로 바꾸었다. LLM의 근본적인 목표가 주어진 텍스트를 바탕으로 다음에 올 단어를 예측하는 것임을 고려할 때, 문맥에 대한 깊은 이해는 필수적이다. 어텐션은 순차적 정보 처리 방식에서 벗어나, 모델이 시퀀스 내 모든 단어를 동시에 고려하여 특정 단어의 의미를 업데이트할 때 어떤 다른 단어에 '집중'해야 할지를 동적으로 결정하게 함으로써 이러한 이해를 가능하게 한다. 이 능력 덕분에 모델은 장거리 의존성을 효과적으로 학습하고 문맥에 따라 단어의 의미가 미묘하게 변하는 현상을 포착할 수 있다.

본 문서는 이 강력한 어텐션 메커니즘의 계산 과정을 단계별로 시각화하여 상세히 설명하고자 한다. 먼저 모델이 텍스트를 이해하는 출발점인 임베딩의 기본 개념부터 시작하여, 어텐션의 핵심 구성 요소들을 차례로 분석해 나가겠다.

**2. 기본 구성 요소: 토큰과 임베딩 [00:36](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=36)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D36s)**

어텐션 메커니즘의 작동 원리를 이해하기 위해서는, 먼저 모델이 텍스트를 어떻게 수치적 형태로 변환하는지에 대한 이해가 선행되어야 한다. 이 과정은 토큰화(tokenization)와 임베딩(embedding)이라는 두 가지 핵심 단계를 통해 이루어진다. 입력된 텍스트는 먼저 '토큰'이라는 의미 단위로 분리되고, 각 토큰은 다시 고차원의 숫자 벡터인 '임베딩'으로 변환된다. 이 초기 임베딩은 어텐션 메커니즘이 문맥 정보를 처리하기 위한 원재료가 된다.

**토큰화(Tokenization)**

토큰화는 입력된 텍스트를 모델이 처리할 수 있는 작은 단위인 '토큰(token)'으로 분할하는 과정이다. 토큰은 단어, 혹은 더 작은 단어 조각일 수 있다. 본 문서의 예시에서는 설명을 단순화하기 위해, 하나의 토큰이 하나의 단어와 동일하다고 가정한다.

**임베딩(Embeddings) [01:56](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=116)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D116s)**

각 토큰은 고유한 고차원 벡터, 즉 임베딩과 연결된다. 임베딩은 단어의 의미를 벡터 공간 내의 특정 지점 또는 방향으로 표현한다.

  * **의미론적 정보 인코딩:** 임베딩 벡터의 '방향'은 성별('왕'과 '여왕')과 같은 다양한 의미론적 정보를 인코딩할 수 있다. 고차원 공간 내의 수많은 방향들이 단어가 가진 다채로운 의미의 측면들을 각각 표현한다.
  * **문맥 정보의 부재:** 초기 임베딩은 문맥을 고려하지 않는 일종의 조회 테이블(look-up table)과 같다. 예를 들어, "The spy was a mole"과 "A mole on the skin" 두 문장에서 'mole'이라는 단어는 문맥에 따라 의미가 다르지만, 초기 임베딩 단계에서는 동일한 벡터 값을 갖는다.
  * **결합된 정보 표현:** 초기 임베딩 벡터는 단어의 고유한 의미론적 정체성(semantic identity)뿐만 아니라, 해당 단어가 문장 내에서 몇 번째에 위치하는지에 대한 순서 정보(positional information)도 함께 포함하는 결합된 표현이다.

트랜스포머의 궁극적인 목표는 문맥이 배제된 이러한 초기 임베딩을 어텐션 메커니즘을 통해 점진적으로 조정하고, 풍부한 문맥적 의미를 담은 정교한 벡터 표현으로 발전시키는 것이다. 예를 들어, 'tower'라는 단어의 초기 임베딩이 있다고 가정하자. 만약 이 단어 앞에 'Eiffel'이 온다면, 어텐션 메커니즘은 이 임베딩 벡터를 '파리', '프랑스'와 같은 개념 방향으로 이동시켜야 한다. 반면, 앞에 'miniature'가 온다면, 벡터를 '크고 높은'이라는 개념으로부터 멀어지는 방향으로 조정해야 한다. 다음 장에서는 이 목표를 달성하기 위한 핵심 계산 과정을 살펴보겠다.

**3. 단일 자기-어텐션 헤드(Single-Head Self-Attention)의 작동 원리 [04:49](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=289)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D289s)**

단일 자기-어텐션 헤드는 특정 종류의 문맥적 관계(예: 형용사와 명사의 관계)를 포착하도록 설계된 계산 단위이다. 각 단어의 초기 임베딩으로부터 쿼리(Query), 키(Key), \*\*밸류(Value)\*\*라는 세 가지 핵심 벡터를 생성하고, 이들 간의 상호작용을 통해 시퀀스 내 다른 단어로부터 정보를 얼마나, 그리고 어떻게 가져올지를 결정한다. 이 전체 계산 흐름은 모델이 문맥을 이해하는 기초를 형성한다.

**3.1. 쿼리(Query), 키(Key), 밸류(Value) 벡터 생성 [06:15](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=375)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D375s)**

각 토큰의 임베딩 벡터는 학습 가능한 세 개의 고유한 가중치 행렬(Wq, Wk, Wv)과 각각 곱해져 쿼리(q), 키(k), 밸류(v)라는 세 가지 새로운 벡터를 생성한다.

  * **쿼리 (Query, q):** 특정 단어가 문맥 내 다른 단어들로부터 필요한 정보를 얻기 위해 던지는 '질문'으로 개념화할 수 있다. 예를 들어, creature라는 단어의 쿼리 벡터는 '내 앞에 나를 수식하는 형용사가 있는가?'라는 질문을 인코딩할 수 있다.
  * **키 (Key, k):** 다른 모든 단어들이 쿼리의 질문에 대해 제공하는 '잠재적 답변'이다. 예를 들어, fluffy나 blue와 같은 형용사의 키 벡터는 '나는 형용사이며, 특정 위치에 있다'는 정보를 담아 creature의 쿼리에 응답할 수 있다.
  * **밸류 (Value, v):** 쿼리와 키의 상호작용을 통해 높은 관련성이 확인되었을 때, 다른 임베딩에 실질적으로 더해질 '변화량(delta)'의 원재료가 되는 벡터다. 쿼리와 키가 '어디에 집중할지(where to look)'를 결정한다면, 밸류는 '무슨 정보를 가져올지(what to bring back)'를 결정한다. 즉, fluffy의 밸류 벡터는 creature의 의미를 '푹신한 생물'로 조정하는 데 필요한 벡터 정보를 담고 있다.

이때, 쿼리와 키 벡터의 차원(예: 128)은 일반적으로 원래 임베딩 벡터의 차원(예: 12,288)보다 훨씬 작게 설정된다.

**3.2. 어텐션 스코어(Attention Score) 계산 [08:29](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=509)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D509s)**

특정 단어(쿼리)와 문장 내 모든 단어(키) 간의 연관성을 측정하기 위해, 해당 쿼리 벡터와 모든 키 벡터 간의 \*\*내적(dot product)\*\*을 계산한다.

  * 내적 값의 크기는 두 벡터의 유사도, 즉 두 단어의 연관성을 나타낸다. creature의 쿼리와 fluffy, blue의 키 사이의 내적 값은 큰 양수가 될 것이며, 관련성이 적은 the와 같은 단어의 키와의 내적 값은 작거나 음수일 것이다.
  * 기술적으로, 계산된 내적 값들은 수치적 안정성을 위해 키/쿼리 공간의 차원(d\_k)의 제곱근(\\sqrt{d\_k})으로 나누어 스케일링된다.

**3.3. 정규화: 소프트맥스(Softmax) 적용 [09:51](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=591)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D591s)**

어텐션 스코어는 음의 무한대에서 양의 무한대까지의 범위를 가지므로, 이를 가중치로 사용하기 용이한 확률 분포 형태로 변환해야 한다. 이를 위해 생성된 어텐션 스코어 행렬의 각 열에 개별적으로 소프트맥스(Softmax) 함수를 적용한다. 여기서 각 열은 하나의 토큰(쿼리)이 다른 모든 토큰(키)과 갖는 관계 점수 집합에 해당한다.

  * 소프트맥스 함수는 각 열의 모든 스코어를 0과 1 사이의 값으로 정규화하며, 각 열의 합이 1이 되도록 만든다.
  * 이렇게 정규화된 스코어로 구성된 그리드를 \*\*'어텐션 패턴(Attention Pattern)'\*\*이라고 부른다. 이 패턴은 특정 단어가 다른 모든 단어에 얼마나 '주의'를 기울여야 하는지를 나타내는 가중치 맵이다.

**3.4. 마스킹(Masking) [11:52](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=712)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D712s)**

GPT와 같은 디코더(decoder-only) 기반 모델의 훈련 과정에서는, 모델이 정답을 미리 보는 것을 방지해야 한다. 즉, 특정 토큰의 의미를 계산할 때 자기보다 뒤에 나오는 미래의 토큰 정보를 참고할 수 없도록 해야 한다.

  * 이를 위해 '마스킹(masking)' 과정이 적용된다. 어텐션 패턴에서 대각선 위쪽, 즉 미래 토큰에 해당하는 위치의 스코어들을 소프트맥스 함수를 적용하기 전에 음의 무한대(-∞)로 설정한다.
  * 이 과정을 통해 해당 위치의 소프트맥스 결과값은 0이 되어, 미래 정보가 현재 토큰에 영향을 미치는 것을 원천적으로 차단한다.

**3.5. 최종 임베딩 업데이트 [13:46](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=826)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D826s)**

마지막으로, 계산된 어텐션 패턴을 가중치로 사용하여 모든 \*\*밸류(v) 벡터의 가중 합(weighted sum)\*\*을 계산하여 임베딩을 업데이트한다. 이 과정은 다음과 같은 형태로 표현될 수 있다:

새로운 임베딩\_i = 기존 임베딩\_i + Σ (어텐션 가중치\_ij \* 밸류 벡터\_j)

  * 여기서 i는 업데이트 대상 토큰의 인덱스, j는 문장 내 모든 토큰의 인덱스를 의미한다. 시그마(Σ) 항, 즉 모든 밸류 벡터의 가중 합이 바로 임베딩에 더해질 총 변화량(delta-e)이다.
  * 예를 들어, creature(i)는 fluffy(j=1)와 blue(j=2)에 높은 어텐션 가중치를 부여받아, 이들의 밸류 벡터가 가중 합 계산에 큰 비중을 차지하게 된다.
  * 이 가중 합 벡터를 creature의 원래 임베딩에 더하면, 마침내 주변 문맥이 풍부하게 반영된 새로운 임베딩 벡터가 생성된다.

단일 자기-어텐션 헤드는 이처럼 하나의 특정 관점에서 문맥을 포착한다. 하지만 문맥적 관계는 매우 다양하므로, 여러 종류의 관계를 동시에 파악하기 위해서는 더 확장된 구조가 필요하다.

**4. 확장된 구조: 멀티-헤드 자기-어텐션 (Multi-Head Self-Attention) [20:33](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=1233)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D1233s)**

단일 어텐션 헤드가 문맥의 한 가지 측면만을 포착하는 한계를 극복하기 위해, 트랜스포머는 멀티-헤드 자기-어텐션(Multi-Head Self-Attention) 구조를 사용한다. 이는 여러 개의 어텐션 헤드를 병렬로 실행하여, 문법적 관계, 의미론적 연관성 등 다양한 종류의 문맥적 관계를 동시에 학습하고 통합하는 방식이다.

**병렬 처리**

멀티-헤드 어텐션 블록은 여러 개의 독립적인 어텐션 헤드(예: GPT-3의 경우 96개)로 구성되어 병렬로 작동한다.

  * 각 헤드는 자신만의 고유한 가중치 행렬(Wq, Wk, Wv) 세트를 가진다.
  * 이를 통해 각 헤드는 서로 다른 종류의 관계에 집중하여 고유한 '어텐션 패턴'을 학습한다. 예를 들어, 한 헤드는 형용사-명사 관계를, 다른 헤드는 인과 관계를, 또 다른 헤드는 동의어 관계를 포착할 수 있다.

**결과 통합**

병렬적으로 계산된 각 헤드의 결과는 최종적으로 하나로 통합된다.

  * 각 토큰 위치에 대해, 96개의 헤드가 각각 독립적으로 계산한 '업데이트 제안 벡터(가중 합된 밸류 벡터)'를 모두 합산하여 단일 통합 업데이트 벡터를 생성한다.
  * 이 최종 통합 벡터가 해당 위치의 원래 임베딩에 더해져, 다각적인 문맥이 반영된 정제된 임베딩 시퀀스, 즉 멀티-헤드 어텐션 블록의 최종 출력이 된다.

**파라미터에 대한 고찰**

GPT-3의 구체적인 수치를 예로 들면, 멀티-헤드 어텐션의 규모를 짐작할 수 있다.

  * 수치: 임베딩 차원 12,288, 키/쿼리 차원 128, 헤드 수 96개.
  * 파라미터 수 (단일 헤드):
      * Wq, Wk 행렬: 각각 12,288 × 128 ≈ 157만 개의 파라미터.
      * Wv 행렬은 파라미터 효율성을 위해 두 개의 작은 행렬(Wv\_down: 12,288 × 128, Wv\_up: 128 × 12,288)로 분해된다. 이는 총 ≈ 314만 개의 파라미터를 갖는다. 이 방식은 단일 거대 행렬(12,288 × 12,288 ≈ 1.5억)을 사용하는 것보다 파라미터 수를 극적으로 줄여 멀티-헤드 구조를 실용적으로 만든다.
      * 총계: 단일 헤드는 157만(Wq) + 157만(Wk) + 314만(Wv) ≈ 630만 개의 파라미터를 가진다.
  * 파라미터 수 (멀티-헤드 블록): 96개 헤드를 모두 합하면 약 630만 × 96 ≈ 6억 개의 파라미터에 달한다.

멀티-헤드 어텐션은 이처럼 모델에 풍부하고 다각적인 문맥 이해 능력을 부여하는 핵심 요소이다. 이러한 어텐션 블록은 전체 트랜스포머 아키텍처 내에서 반복적으로 사용되며 모델의 깊이를 더한다.

**5. 트랜스포머 아키텍처 내 어텐션의 역할 [23:27](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=1407)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D1407s)**

어텐션 블록은 트랜스포머 모델 내에서 단독으로 작동하지 않는다. 대신, 다층 퍼셉트론(Multi-Layer Perceptron, MLP)과 같은 다른 구성 요소와 함께 하나의 '레이어'를 형성하며, 이러한 레이어가 여러 층에 걸쳐 반복적으로 쌓이는 구조를 이룬다. 이 깊은 계층 구조를 통해 모델은 점진적으로 더 높은 수준의 추상적 의미를 학습하게 된다.

**반복적인 계층 구조**

트랜스포머는 어텐션 블록과 MLP 블록으로 구성된 레이어를 여러 번(GPT-3의 경우 96개) 반복하는 깊은 네트워크 구조를 가진다.

  * 데이터가 각 레이어를 통과할 때마다, 임베딩은 주변 문맥 정보를 반복적으로 흡수하며 정제된다.
  * 네트워크의 초기 계층에서는 주로 '형용사-명사'와 같은 직접적인 문법 관계를 학습할 수 있다. 이렇게 정제된 임베딩이 다음 계층의 입력이 되면, 모델은 '원인-결과'나 '주제-세부사항'과 같이 더 복잡하고 추상적인 관계를 학습할 수 있다. 깊은 계층으로 갈수록 임베딩은 단순한 단어 의미를 넘어 문맥 전체의 정서(sentiment), 어조(tone), 비유, 추상적 아이디어까지 인코딩하게 된다.

**어텐션 메커니즘의 성공 요인**

어텐션 메커니즘의 진정한 성공은 특정 알고리즘의 우수성뿐만 아니라, 그 구조가 GPU 기반 병렬 연산에 최적화되어 모델 규모의 폭발적 확장을 가능하게 했다는 점에 있다.

  * 시퀀스 내 모든 토큰에 대한 어텐션 계산은 서로 독립적으로 수행될 수 있어, \*\*고도로 병렬화 가능(parallelizable)\*\*하다.
  * 이러한 병렬화 가능성은 이전 아키텍처보다 모델의 규모를 훨씬 크게 확장하는 것을 가능하게 했으며, 이는 '규모가 성능을 결정한다'는 딥러닝의 핵심 원칙을 실현시킨 결정적 요인이었다.

**성능적 한계**

어텐션 메커니즘의 주요 성능 병목 현상은 계산 복잡도에 있다.

  * 어텐션 패턴 그리드의 크기는 입력 시퀀스 길이의 제곱에 비례하여 증가한다.
  * 이 때문에 모델이 한 번에 처리할 수 있는 컨텍스트 창(context window)의 크기가 주요 \*\*병목 현상(bottleneck)\*\*이 되며, 이를 효율적으로 확장하는 것은 여전히 중요한 연구 과제로 남아있다.

**6. 결론 [25:22](http://www.youtube.com/watch?v=eMlx5fFNoYc&t=1522)(https://www.google.com/search?q=https://www.youtube.com/watch%3Fv%3DeMlx5fFNoYc%26t%3D1522s)**

어텐션 메커니즘은 트랜스포머 아키텍처의 심장부로서, 대규모 언어 모델이 인간의 언어처럼 문맥을 이해하게 만드는 핵심 원동력이다. 이 메커니즘은 문맥 정보가 배제된 토큰의 초기 임베딩을, 쿼리, 키, 밸류 벡터 간의 정교한 상호작용을 통해 문맥적으로 풍부한 벡터 표현으로 변환한다. 단일 자기-어텐션 헤드가 특정 관계를 포착하고, 멀티-헤드 구조가 이를 병렬적으로 확장하여 다각적인 의미를 동시에 학습함으로써 모델의 이해력을 극대화한다.

무엇보다 어텐션 메커니즘의 본질적인 병렬화 가능성은 현대 AI 발전의 핵심 동력이 되었다. 이 특성 덕분에 모델의 규모를 전례 없이 확장할 수 있었고, 이는 트랜스포머 아키텍처와 오늘날의 대규모 언어 모델이 경이로운 성공을 거두는 데 결정적인 역할을 했다. 어텐션은 단순한 기술을 넘어, AI가 복잡한 데이터를 이해하고 생성하는 방식에 대한 패러다임을 전환시킨 혁신이라 할 수 있다.

http://googleusercontent.com/youtube_content/0
