---

title: "Rethinking the Role of Demonstrations: What Makes In-Context Learning Work?"
source: "http://arxiv.org/abs/2202.12837"
author:
  - "Sewon Min"
  - "Xinxi Lyu"
  - "Ari Holtzman"
  - "Mikel Artetxe"
  - "Mike Lewis"
  - "Hannaneh Hajishirzi"
  - "Luke Zettlemoyer"
published: 2022-10-19
created: 2026-03-16
description: "Analyzes in-context learning and argues that prompt format, label space, and structural cues can matter more than the literal semantic content of demonstrations."
tags:
  - AI/LLM
  - AI/In_Context_Learning
---

## Rethinking the Role of Demonstrations: What Makes In-Context Learning Work?

### Formatted Bibliography

Min, Sewon, Xinxi Lyu, Ari Holtzman, 기타. 2022년. “Rethinking the Role of Demonstrations: What Makes In-Context Learning Work?” arXiv:2202.12837. Preprint, arXiv, 10월 20. [https://doi.org/10.48550/arXiv.2202.12837](https://doi.org/10.48550/arXiv.2202.12837).


### Abstract

Large language models (LMs) are able to in-context learn -- perform a new task via inference alone by conditioning on a few input-label pairs (demonstrations) and making predictions for new inputs. However, there has been little understanding of how the model learns and which aspects of the demonstrations contribute to end task performance. In this paper, we show that ground truth demonstrations are in fact not required -- randomly replacing labels in the demonstrations barely hurts performance on a range of classification and multi-choce tasks, consistently over 12 different models including GPT-3. Instead, we find that other aspects of the demonstrations are the key drivers of end task performance, including the fact that they provide a few examples of (1) the label space, (2) the distribution of the input text, and (3) the overall format of the sequence. Together, our analysis provides a new way of understanding how and why in-context learning works, while opening up new questions about how much can be learned from large language models through inference alone.



> replacing gold la- bels with random labels only marginally hurts performance
> 

> recovering the expected input- label correspondence
> 

> selecting random labels from a true distribution of labels (instead of a uniform distribution) reduces the gap even further, and (2) the trends may depend on the dataset,
> 

> insensitive to the number of correct labels in the demonstrations.
> 

> larger labeled data is beneficial mainly for super- vising the input-label correspondence, and other components of the data like the example inputs, example labels and the data format are easier to recover from the small data,
> 

> in-distribution inputs in the demonstrations substantially contribute to perfor- mance gains.
> 

> conditioning on the label space significantly contributes to per- formance gains.
> 

> using OOD inputs, or removing labels instead of using random English words is significantly worse, indicating that keep- ing the format of the input-label pairs is key
> 

> exploit simpler aspects of the demonstra- tions and to ignore others.
> 

> independent specification of the input space and the label space
> 

> inputs only or the label set only if the right format is used
> 

> in-context learning may not work on a task whose input-label correspondence is not al- ready captured in the LM
> 


기술 보고서: 대규모 언어 모델의 인텍스트 학습(In-Context Learning)에서 데모(Demonstration)의 역할 재조명

1. 서론: 인텍스트 학습의 기존 통념에 대한 도전

인텍스트 학습(In-Context Learning, ICL)은 대규모 언어 모델(LM)이 별도의 가중치 업데이트(gradient updates) 없이, 소수의 입력-레이블 쌍(데모)을 조건으로 제시받는 것만으로 새로운 과업을 수행하는 방법론입니다. ICL의 작동 원리를 정확히 이해하는 것은 비용이 많이 드는 파인튜닝(fine-tuning)에 대한 의존도를 최소화하고 사전 학습된 모델의 투자 수익률(ROI)을 극대화하는 데 있어 전략적으로 매우 중요합니다.

이 보고서는 인텍스트 학습에 대한 기존의 통념에 도전하는 핵심적인 연구 결과를 제시합니다. 일반적인 가정과 달리, 데모에 포함된 입력-레이블 쌍의 정확성이 ICL 성능 향상의 주된 요인이 아니라는 것이 이 보고서의 핵심 주장입니다.

본 보고서에서 상세히 다룰 주요 발견은 다음과 같습니다. 데모의 레이블을 무작위로 바꾸어도 성능 저하가 미미하며, 실제 성능은 데모가 제공하는 **레이블 공간(label space), 입력 텍스트의 분포, 그리고 전체적인 형식(format)**에 의해 결정됩니다. 이러한 발견들은 인텍스트 학습의 작동 방식에 대한 새로운 관점을 제시하며, 이어지는 실험 설계 및 방법론을 통해 그 근거를 자세히 살펴보겠습니다.

2. 실험 설계 및 방법론

데모가 인텍스트 학습에서 수행하는 역할을 엄밀하게 검증하기 위해 포괄적인 실험 환경이 설계되었습니다. 이 방법론의 전략적 목표는 데모를 구성하는 각 요소가 모델 성능에 미치는 영향을 개별적으로 분리하여 측정하는 것입니다.

2.1. 실험 대상 모델 및 데이터셋 (Models and Datasets)

* 모델: 실험에는 총 12개의 모델이 사용되었으며, 파라미터 크기는 774M(7억 7,400만)에서 175B(1,750억)에 이릅니다. 주요 모델로는 GPT-3, GPT-J, MetaICL 등이 포함되었으며, 각 모델에 대해 '직접(direct)' 추론 방식과 '채널(channel)' 추론 방식이 모두 적용되었습니다.
* 데이터셋: 감성 분석, 자연어 추론(NLI), 질문 응답(QA) 등 다양한 분류 및 다지선다형 과업을 포괄하는 총 26개의 데이터셋이 평가에 사용되었습니다.

2.2. 평가 지표 및 실험 조건 (Metrics and Conditions)

성능 평가는 분류 과업의 경우 Macro-F1 점수를, 다지선다형 과업의 경우 **정확도(Accuracy)**를 지표로 사용했습니다. 명시되지 않은 경우, 모든 실험은 기본적으로 16개(k=16)의 예시를 데모로 사용했습니다. 핵심적인 실험은 아래 세 가지 조건을 비교하여 진행되었습니다.

실험 조건 (Condition)	설명 (Description)
데모 미사용 (No demonstrations): 어떠한 예시도 제공하지 않는 표준적인 제로샷(zero-shot) 기준선입니다.
정답 레이블 데모 (Demonstrations w/ gold labels): 입력과 정답 레이블이 정확히 짝지어진 표준적인 인텍스트 학습 방식입니다.
무작위 레이블 데모 (Demonstrations w/ random labels): 	정답 레이블을 해당 과업의 가능한 레이블 집합 내에서 무작위로 추출한 레이블로 대체한 핵심 실험 조건입니다.

이러한 실험 설계를 바탕으로 도출된 핵심 결과는 다음 섹션에서 자세히 제시됩니다.

3. 핵심 결과: 정답 레이블의 미미한 영향력

본 연구의 가장 중요하고 놀라운 발견은 데모의 정답 레이블이 모델 성능에 미치는 영향이 예상보다 훨씬 적다는 것입니다. 이 결과는 ICL의 기저 메커니즘에 대한 근본적인 재평가를 촉구하며, 우리의 초점을 의미론적 학습(semantic learning)에서 구조적 및 분포적 패턴 매칭(structural and distributional pattern matching)으로 전환해야 함을 시사합니다.
![[Pasted image 20251205135927.png]]
실험 결과(Figure 3)에 따르면, 정답 레이블이 포함된 데모를 사용하는 것이 데모를 사용하지 않는 제로샷 방식보다 훨씬 뛰어난 성능을 보이는 것은 기존의 연구와 일치합니다.

그러나 핵심적인 발견은 정답 레이블을 무작위 레이블로 대체했을 때, 성능 저하가 평균적으로 0-5%p 수준에 그쳤다는 점입니다. 특히 이 영향은 다지선다형 과업(평균 1.7%p 하락)보다 분류 과업(평균 2.6%p 하락)에서 약간 더 크게 나타났습니다. 이러한 경향성은 실험에 사용된 12개 모델 대부분과 과업 전반에 걸쳐 일관되게 나타났으며, 이는 모델이 과업 수행을 위해 데모에 제시된 특정 입력-레이블 쌍에 직접적으로 의존하지 않음을 강력하게 시사합니다. ^18dfd9

3.1. 추가 분석 (Ablation Studies)

이러한 발견을 뒷받침하기 위한 추가 분석 결과는 다음과 같습니다.
![[Pasted image 20251205135957.png]]
* 정답 레이블 비율 (Proportion of Correct Labels): 데모에 포함된 정답 레이블의 비율을 조절하며 실험한 결과(Figure 4), 모델 성능은 정답 레이블의 비율에 거의 영향을 받지 않았습니다. 심지어 정답 레이블이 0%인 경우에도 데모를 전혀 사용하지 않는 것보다 월등히 높은 성능을 보였습니다.
![[Pasted image 20251205141620.png]]
* 데모 예시 개수 (Varying Number of Examples, k): 데모에 사용된 예시의 개수(k)를 늘려가며 실험한 결과(Figure 5), 정답 레이블 데모와 무작위 레이블 데모 간의 성능 차이는 k값의 변화에도 불구하고 일관되게 작게 유지되었습니다. 또한, 일반적인 지도 학습과 달리 ICL의 성능은 k=8 근방에서 안정화(plateau)되는 경향을 보였습니다.

* 무작위 레이블 추출 방식 (Random Label Sampling Method): 무작위 레이블을 균등 분포가 아닌 실제 훈련 데이터의 레이블 분포에 따라 추출했을 때, 정답 레이블과의 성능 격차는 더욱 감소했습니다.

종합적으로 볼 때, 이러한 추가 분석들은 핵심 발견을 더욱 공고히 합니다. 즉, 모델 성능은 레이블의 의미론적 정확성에 대해 놀라울 정도로 강건하며, 이는 데모가 전통적인 지도 학습 신호(supervised training signal)로 기능하지 않는다는 것을 나타냅니다.

이러한 결과는 "무엇을" 관찰했는지를 명확히 보여줍니다. 다음 섹션에서는 이러한 현상이 "왜" 발생하는지, 즉 인텍스트 학습의 실제 성능 동인이 무엇인지를 심층적으로 분석합니다.

4. 인텍스트 학습의 실제 동인 분석 ^e71d16

입력-레이블 매핑이 핵심이 아니라면, 무엇이 인텍스트 학습의 성능을 이끄는 것일까요? 이 섹션에서는 데모를 구성 요소별로 분해하여 ICL 성능에 실질적으로 기여하는 요인들을 분석합니다. 연구 결과, 다음 세 가지 요소가 결정적인 역할을 하는 것으로 밝혀졌습니다.
![[Pasted image 20251205140044.png]]
1. 입력 텍스트의 분포 (The distribution of the input text) 데모에 사용되는 입력 텍스트가 실제 과업의 데이터 분포와 일치하는 것이 매우 중요합니다. 과업과 관련 없는 외부 데이터(Out-of-Distribution, OOD)를 입력으로 사용했을 때, 성능이 3-16%p 크게 하락했습니다(Figure 8). 특히, 일부 모델(Direct GPT-J, 다지선다형 과업)의 경우 데모를 전혀 사용하지 않는 것보다도 성능이 현저히 낮아졌습니다. 이는 모델이 과업과 유사한 분포의 텍스트에 조건화될 때 더 효과적으로 작동함을 의미합니다.
![[Pasted image 20251205141803.png]]
2. 레이블 공간 (The label space) 유효한 레이블 공간을 제공하는 것의 가치를 분리하여 확인하기 위해, 정답 레이블을 다른 유효 레이블이 아닌 무작위 영어 단어로 대체하는 핵심 실험이 수행되었습니다. 이는 모델이 기대하는 출력 어휘에 대한 정보를 차단하는 효과를 낳습니다. 그 결과, 특히 직접(direct) 추론 모델에서 5-16%p의 심각한 성능 저하가 발생했습니다(Figure 9). 이는 모델이 데모를 통해 어떤 종류의 답변을 생성해야 하는지에 대한 단서를 얻는다는 것을 보여줍니다.
![[Pasted image 20251205141841.png]]
3. 전체 형식 (The overall format) '입력-레이블' 쌍을 제시하는 구조 자체가 모델에게 강력한 신호로 작용합니다. 이러한 쌍 구조를 없애고 입력 텍스트만 나열하거나 레이블만 나열했을 경우, 성능은 데모를 전혀 사용하지 않는 것과 비슷하거나 오히려 더 나빴습니다(Figure 10). 이 형식은 모델이 주어진 테스트 입력에 대해 무엇을 해야 할지 예측하도록 유도하는 역할을 합니다.

이 세 가지 요소—입력 분포, 레이블 공간, 형식—는 종합적으로 지식의 원천으로서가 아니라, 모델의 방대한 사전 학습 능력을 당면한 좁은 문제에 집중시키도록 제약하는 **'과업 명세서(task specification)'**로 기능합니다.

특히, ICL을 목표로 메타 학습(meta-training)된 MetaICL 모델은 이러한 경향을 더욱 증폭시켰습니다. MetaICL의 과장된 행동은 매우 중요한 증거입니다. 이 모델은 명시적으로 인텍스트 학습을 수행하도록 훈련되었기 때문에, '더 단순한 단서'에 크게 의존하는 모습은 이러한 단서들이 우연한 발견이 아니라 메타 학습이 최적화하는 ICL 메커니즘의 핵심임을 시사합니다.

이러한 작동 원리에 대한 분석은 다음 섹션에서 다룰 기술적, 전략적 함의로 자연스럽게 연결됩니다.

5. 기술적 함의 및 고찰

앞선 분석은 단순히 학술적인 논의에 그치지 않습니다. 이는 우리 NLP 엔지니어들이 프롬프트를 설계하는 방식, 데이터 과학자들이 소수샷(few-shot) 과제를 위한 데이터 레이블링에 접근하는 방식, 그리고 프로젝트 관리자들이 모델의 제로샷(zero-shot) 역량을 평가하는 방식에 직접적이고 실행 가능한 시사점을 제공합니다.

* 테스트 시점에서의 학습 (Learning at Test Time): 언어 모델이 과연 테스트 시점에 "학습"을 하는지에 대해 더 정교한 이해가 필요합니다. 모델은 데모에 제시된 특정 입력-레이블 쌍의 관계를 학습하는 것이 아니라, 해당 과업의 입력 분포, 레이블 공간, 그리고 과업 형식에 적응하는 방식으로 학습합니다.
* 대규모 언어 모델의 내재된 능력 (Inherent Capacity of LMs): 이번 발견은 언어 모델이 사전 학습(pretraining) 과정에서 이미 방대한 과업에 대한 암묵적인 이해를 습득했음을 시사합니다. 데모는 새로운 지식을 주입하는 직접적인 감독(supervision)의 원천이라기보다, 새로운 것을 가르치는 것이 아니라 사전 학습 시 습득된 잠재 능력을 활성화하는 '과업 탐색기(task locator)' 역할을 합니다. ^6a3c3f
* 제로샷 성능의 재정의 (Improved Zero-Shot Performance): 레이블이 없는 데이터만으로도 k-shot 학습에 준하는 성능을 달성할 수 있다는 점은 실용적으로 매우 중요한 발견입니다. 즉, 레이블이 없는 입력에 올바른 레이블 공간에서 무작위로 추출한 레이블을 짝지어주는 것만으로도 제로샷 기준선을 크게 상회하는 성능을 얻을 수 있습니다.

다만, 이 연구는 분류 및 다지선다형 과업에 초점을 맞추었으므로 결과를 모든 상황에 과도하게 일반화하는 것은 주의해야 합니다. 데이터셋에 따라 성능 편차가 존재할 수 있으며, 가장 극단적인 경우 GPT-J 모델을 사용한 financial_phrasebank 데이터셋에서는 정답 레이블과 무작위 레이블 간에 약 14%p의 성능 차이가 발생하기도 했습니다. 이러한 발견들은 인텍스트 학습에 대한 우리의 관점을 전환시키며, 최종 결론으로 이어집니다.

6. 결론

본 보고서는 인텍스트 학습에서 데모의 역할에 대한 기존의 이해를 재정립하는 핵심적인 분석을 제시했습니다. 가장 중요한 결론은 데모에 포함된 정답 입력-레이블 매핑이 기존에 생각했던 것보다 훨씬 덜 중요하다는 것입니다.

인텍스트 학습의 실제 성능을 이끄는 핵심 동인은 다음과 같습니다.

1. 입력과 레이블을 쌍으로 제시하는 형식(format)
2. 가능한 출력의 범위를 알려주는 레이블 공간(label space)
3. 과업의 특성을 보여주는 입력 텍스트의 분포(distribution of input text)

이러한 발견은 모델 프롬프팅 전략을 개선할 뿐만 아니라, 언어 모델의 내재된 능력과 한계를 이해하는 데 중요한 단서를 제공합니다. 향후 연구 과제로는 본 분석을 텍스트 생성(generation)과 같은 더 복잡한 과업으로 확장하고, 데이터셋별로 나타나는 특이한 동작을 심층적으로 규명하는 것이 포함될 수 있습니다.
