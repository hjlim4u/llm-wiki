---
title: "Finetuned Language Models Are Zero-Shot Learners"
source: "http://arxiv.org/abs/2109.01652"
author:
  - "Jason Wei"
  - "Maarten Bosma"
  - "Vincent Y. Zhao"
  - "Kelvin Guu"
  - "Adams Wei Yu"
  - "Brian Lester"
  - "Nan Du"
  - "Andrew M. Dai"
  - "Quoc V. Le"
published: 2022-02-07
created: 2026-03-16
description: "Shows that instruction tuning on a large mixture of tasks can substantially improve zero-shot generalization and make language models better follow unseen instructions."
tags: [Computer_Science/NLP, AI/LLM, AI/Fine_Tuning, AI/Zero_Shot]
---

## Finetuned Language Models Are Zero-Shot Learners

### Formatted Bibliography

Wei, Jason, Maarten Bosma, Vincent Y. Zhao, 기타. 2022년. “Finetuned Language Models Are Zero-Shot Learners”. arXiv:2109.01652. Preprint, arXiv, 2월 8. [https://doi.org/10.48550/arXiv.2109.01652](https://doi.org/10.48550/arXiv.2109.01652).


### Abstract

This paper explores a simple method for improving the zero-shot learning abilities of language models. We show that instruction tuning -- finetuning language models on a collection of tasks described via instructions -- substantially improves zero-shot performance on unseen tasks. We take a 137B parameter pretrained language model and instruction-tune it on over 60 NLP tasks verbalized via natural language instruction templates. We evaluate this instruction-tuned model, which we call FLAN, on unseen task types. FLAN substantially improves the performance of its unmodified counterpart and surpasses zero-shot 175B GPT-3 on 20 of 25 tasks that we evaluate. FLAN even outperforms few-shot GPT-3 by a large margin on ANLI, RTE, BoolQ, AI2-ARC, OpenbookQA, and StoryCloze. Ablation studies reveal that number of finetuning datasets, model scale, and natural language instructions are key to the success of instruction tuning.



> perform well on prompts that are not similar to the format of the pretraining data
> gpt의 zero shot 한계 원인

> improve the zero-shot performance
> instruction tuning의 효과

> instruction tuning
> 

> turned the task around
> 원래 태스크 방향뿐 아니라 ‘반대로 뒤집은’ 템플릿도 몇 개 추가

> NLI examples are unlikely to have appeared naturally in an unsupervised training set
> GPT 3의 한계

> instruction tuning fills the entire model capacity, causing these models to perform worse on new tasks
> 

> how labeled data can be used to help large language models perform many, unseen tasks
> instruction tuning의 의의

# 언어 모델에게 지시를 따르는 법 가르치기: 인스트럭션 튜닝(Instruction Tuning)의 핵심 요소

### 서론: 더 똑똑하게 학습하는 방법

뛰어난 학생이 있는데, 이 학생은 평생 객관식 시험만 봐왔다고 상상해 보세요. 이 학생은 분명 똑똑하지만, 생전 처음 보는 '에세이 작성' 같은 새로운 유형의 문제를 받으면 당황할 수 있습니다. 지식은 많지만, 그 지식을 새로운 방식으로 적용하는 법은 배우지 못했기 때문입니다.

기존의 대규모 언어 모델(LLM)이 바로 이와 비슷했습니다. GPT-3와 같은 모델은 몇 가지 예시를 보여주면(`소수샷 학습, few-shot learning`) 뛰어난 성능을 발휘하지만, 예시가 전혀 없는(`제로샷 학습, zero-shot learning`) 새로운 과업을 주면 성능이 크게 떨어지는 경향이 있었습니다.

이 문제를 해결하기 위해 **`인스트럭션 튜닝(Instruction Tuning)`**이라는 간단하면서도 강력한 방법이 등장했습니다. 이 기술은 마치 학생에게 다양한 문제 유형을 푸는 '방법'을 가르치듯, 언어 모델이 한 번도 본 적 없는 과업에 대한 지시를 따르는 법을 학습시키는 것입니다. 이 문서에서는 연구 논문에서 제시된 **`FLAN(Finetuned Language Net)`**이라는 모델을 예시로 살펴보겠습니다. 이 모델은 기반이 되는 언어 모델의 성능을 크게 향상시켰을 뿐만 아니라, 평가된 25개 데이터셋 중 20개에서 1750억 파라미터의 GPT-3 제로샷 성능을 능가하는 놀라운 결과를 보여주었습니다.

이 문서는 연구 결과를 바탕으로 인스트럭션 튜닝을 성공으로 이끄는 3가지 핵심 요소를 명확하게 설명하는 것을 목표로 합니다. 이제 인스트럭션 튜닝이 정확히 무엇인지부터 알아보겠습니다.

## 1. 인스트럭션 튜닝(Instruction Tuning)이란 무엇인가?

인스트럭션 튜닝은 사전 학습된 언어 모델을 수많은 종류의 과업 데이터셋으로 추가 훈련(미세조정)하는 기법으로, 이때 각 과업은 "이 영화 리뷰의 감성은 긍정적인가요, 부정적인가요?"와 같이 자연어 지시문 형태로 제공됩니다.

이 기법이 기존 방식과 어떻게 다른지 비교하면 그 특징이 더 명확해집니다.


| 접근 방식 (Approach)                  | 핵심 아이디어 (Core Idea)                           | 주요 특징 (Key Characteristic)                       |
| --------------------------------- | --------------------------------------------- | ------------------------------------------------ |
| **사전학습-미세조정 (Pretrain-Finetune)** | 하나의 특정 과업을 위해 모델을 전문화시킵니다.                    | 각 과업마다 별도의 전문화된 모델이 필요합니다.                       |
| **프롬프팅 (Prompting)**              | 사전 학습된 모델이 텍스트를 자연스럽게 완성하도록 유도합니다.            | 성능을 높이기 위해 몇 개의 예시(few-shot)나 프롬프트 엔지니어링이 필요합니다. |
| **인스트럭션 튜닝 (Instruction Tuning)** | 다양한 과업에 대한 지시를 따르도록 훈련시켜, 처음 보는 과업도 수행하게 합니다. | 하나의 모델이 자연어 지시를 통해 많은 과업을 수행하는 법을 배웁니다.          |

인스트럭션 튜닝의 가장 큰 장점은 모델이 훈련받은 과업만 잘하게 되는 것이 아니라, 훈련 과정에서 한 번도 보지 못한 **새로운 유형의 과업**까지 수행하는 일반화 능력을 갖추게 된다는 점입니다.

그렇다면 이 강력한 효과를 만들어내는 '비법 재료'는 무엇일까요?

## 2. 성공적인 인스트럭션 튜닝을 위한 3가지 핵심 요소

### 2.1. 재료 1: 과업의 다양성 (많을수록 좋다)

인스트럭션 튜닝의 성공은 미세조정 과정에서 사용되는 과업의 **수와 다양성**에 크게 의존합니다. FLAN 모델은 60개 이상의 자연어 처리(NLP) 데이터셋으로 튜닝되었으며, 이 데이터셋들은 유사한 유형끼리 "과업 클러스터"로 그룹화되었습니다. ^699947
![[Pasted image 20251205140720.png]]
연구진의 실험 결과는 이 원칙의 중요성을 명확히 보여줍니다.
![[Pasted image 20251205140755.png]]
- **핵심 발견:** 튜닝에 사용되는 과업 클러스터(task cluster)의 수를 늘릴수록, 모델이 한 번도 보지 못한 새로운 유형의 과업에 대한 성능이 꾸준히 향상되었습니다.
- **시사점:** 이는 모델이 단순히 개별 과업을 암기하는 것이 아니라, 다양한 지시를 통해 "지시를 이해하고 따르는" 일반적인 능력을 학습하고 있다는 것을 의미합니다. 더 나아가, 성능 향상 곡선이 둔화되지 않는다는 점은, 더 많은 유형의 과업을 추가하면 모델의 일반화 성능이 계속해서 향상될 수 있음을 시사합니다.

결론적으로, 다양성이 핵심입니다. 번역, 상식 추론, 감성 분석 등 온갖 종류의 과업을 학습함으로써 모델은 더 견고하고 일반적인 '지시 따르기' 기술을 습득하게 됩니다.

이제 모델이 무엇을 배우는지에서, 모델 자체의 특성인 '규모'가 왜 중요한지로 넘어가 보겠습니다.

### 2.2. 재료 2: 모델의 규모 (크기가 중요하다)

인스트럭션 튜닝의 긍정적인 효과는 언어 모델이 충분히 클 때 비로소 나타납니다. 이는 연구에서 가장 놀라운 발견 중 하나였습니다.

모델 규모에 따른 실험 결과는 극명한 대조를 보였습니다.
![[Pasted image 20251205140839.png]]
- **소규모 모델 (80억 파라미터 이하):** 인스트럭션 튜닝이 오히려 **성능을 저해**했습니다. 이는 모델의 전체 용량이 튜닝 과업 자체를 학습하는 데 모두 소진되어, 새로운 과업에 일반화하는 데 필요한 '지시를 따르는' 상위 능력을 학습할 여력이 없었기 때문일 수 있습니다.
- **대규모 모델 (680억 파라미터 이상):** 인스트럭션 튜닝이 **성능을 크게 향상**시켰습니다. 이 모델들은 수많은 과업을 배우고도 "지시를 따르는 방법"이라는 상위 개념을 학습할 추가적인 용량을 가지고 있었습니다.

작은 모델에게 인스트럭션 튜닝은 너무 많은 정보를 한 번에 주입하려는 것과 같습니다. 반면, 큰 모델은 새로운 것을 배울 충분한 "정신적 여유"가 있어, 과업 수행 능력과 지시 이해 능력을 함께 발전시킬 수 있습니다.

모델의 규모와 더불어, 마지막 핵심 재료는 바로 지시문 그 자체의 본질입니다.

### 2.3. 재료 3: 자연어 지시 자체 (단어의 힘)

^3ec848

성능 향상이 단순히 여러 과업을 동시에 학습(multi-task learning)했기 때문만이 아니라, 구체적으로 **`자연어 지시(natural language instructions)`**를 사용해 훈련했기 때문이라는 점이 중요합니다.

연구진은 지시문 없이 모델을 튜닝하는 실험을 통해 이를 증명했습니다.
![[Pasted image 20251205141120.png]]
- **지시 없이 튜닝 (예: 입력/출력 쌍만 제공):** 성능이 크게 저하되었습니다.
- **데이터셋 이름으로 튜닝 (예: "[번역: WMT'14 프랑스어]..."):** 자연어 지시를 사용한 경우보다 성능이 현저히 낮았습니다.
- **결론:** 모델이 새로운 과업을 수행하게 하는 데에는 "무엇을 해야 하는지" 명확히 알려주는 자연스러운 언어로 된 지시문이 결정적인 역할을 합니다.

이는 모델이 단순히 여러 데이터셋의 패턴을 인식하는 것을 넘어, 진정으로 **지시를 따르는 법**을 배우고 있음을 증명합니다. 바로 이 점이 인스트럭션 튜닝된 모델을 더 직관적이고 유용한 도구로 만듭니다.

이제 이 세 가지 재료가 어떻게 결합하여 강력한 시너지를 내는지 종합해 보겠습니다.

## 3. 결론: 왜 이 방법이 효과적인가?

결론적으로, 인스트럭션 튜닝의 성공은 세 가지 핵심 요소의 조합에 있습니다. `**매우 큰(large-scale)**` 모델을 `**매우 다양한(highly diverse)**` 과업 모음에 대해 `**자연어 지시(natural language instructions)**` 형태로 미세조정함으로써, 모델은 개별 과업을 암기하는 수준을 넘어섭니다. 대신, "어떻게 지시를 따를 것인가"라는 한 차원 높은 일반화되고 추상적인 기술을 학습하게 되는 것입니다.

이는 단순히 더 나은 모델을 만드는 것을 넘어 AI와의 상호작용 방식에 대한 패러다임 전환을 의미합니다. 과거에는 각 과업에 맞는 전문화된 모델이 필요했지만, 인스트럭션 튜닝은 범용 모델 하나가 자연어를 통해 표현된 인간의 의도를 이해하고 따르는 근본적인 기술을 학습하게 합니다. 이는 AI를 특정 과업을 위한 전문가 도구에서, 우리의 말을 이해하고 다양한 요청을 수행할 수 있는 직관적이고 접근성 높은 파트너로 만드는 중대한 첫걸음이며, 우리가 앞으로 AI 시스템과 소통하는 방식에 심오한 영향을 미칠 것입니다.
