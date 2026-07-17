---

title: "Retrieval-Augmented Generation for Large Language Models: A Survey"
source: http://arxiv.org/abs/2312.10997
author:
  - "Yunfan Gao"
  - "Yun Xiong"
  - "Xinyu Gao"
  - "Kangxiang Jia"
  - "Jinliu Pan"
  - "Yuxi Bi"
  - "Yi Dai"
  - "Jiawei Sun"
  - "Meng Wang"
  - "Haofen Wang"
published: 2024-03-27
created: 2026-03-16
description: "Surveys retrieval-augmented generation for large language models, covering retrievers, generators, knowledge sources, evaluation methods, limitations, and future directions."
tags:
  - AI/LLM
  - AI/RAG
---

## Retrieval-Augmented Generation for Large Language Models: A Survey

### Formatted Bibliography

Gao, Yunfan, Yun Xiong, Xinyu Gao, 기타. 2024년. “Retrieval-Augmented Generation for Large Language Models: A Survey”. arXiv:2312.10997. Preprint, arXiv, 3월 27. [https://doi.org/10.48550/arXiv.2312.10997](https://doi.org/10.48550/arXiv.2312.10997).


### Abstract

Large Language Models (LLMs) showcase impressive capabilities but encounter challenges like hallucination, outdated knowledge, and non-transparent, untraceable reasoning processes. Retrieval-Augmented Generation (RAG) has emerged as a promising solution by incorporating knowledge from external databases. This enhances the accuracy and credibility of the generation, particularly for knowledge-intensive tasks, and allows for continuous knowledge updates and integration of domain-specific information. RAG synergistically merges LLMs' intrinsic knowledge with the vast, dynamic repositories of external databases. This comprehensive review paper offers a detailed examination of the progression of RAG paradigms, encompassing the Naive RAG, the Advanced RAG, and the Modular RAG. It meticulously scrutinizes the tripartite foundation of RAG frameworks, which includes the retrieval, the generation and the augmentation techniques. The paper highlights the state-of-the-art technologies embedded in each of these critical components, providing a profound understanding of the advancements in RAG systems. Furthermore, this paper introduces up-to-date evaluation framework and benchmark. At the end, this article delineates the challenges currently faced and points out prospective avenues for research and development.



> Indexing
> 다양한 포맷(PDF, HTML, Markdown) 데이터 추출 및 정제 -> 청크 단위로 분해(컨텍스트 제약 해결) -> 임베딩 -> 벡터 저장소 저장

> Retrieval
> 쿼리 임베딩 -> 유사도 검색 -> 유사한 조각 추출

> Generation
> 특정 기준(내재된 지식 활용 유무)에 따라 답변 생성

> Retrieval Challenges
> 관련 없는 핵심 정보가 결여된 정보 추출 가능성

> Generation Difficulties
> 환각(추출된 문서와 관련없는 지식 반환, 편견, 질 낮은 지식 반환 가능)

> Augmentation Hurdles
> 증강된 지식 자체의 한계(중복된 정보 추출, 일관되지 않은 문서 추출 등)

> Pre-retrieval process
> 인덱싱 구조 개선(분절 단위, 인덱싱 구조 수정, 메타데이터 추가 등)

> Post-Retrieval Process
> 추출된 문서 재정렬, 핵심 정보 압축

> enhanced adaptability and versatility
> 각 컴포넌트 별 개선(임베딩 추출 모델 미세조정, 유사도 검색 모듈 추가, 파이프라인 설계 등)

> New Modules
> 검색: 다양한 소스(데이터베이스, 검색엔진, 지식 그래프) 검색
유저 쿼리 확장 후 병렬 검색(RAG-Fusion)
메모리: LLM 메모리 활용하여 추출 방식 설계, self-enhancement로 실제 데이터 분포와 일치하는 메모리 풀 생성
라우팅: 중복 및 노이즈 제거
태스트 어댑터: downstream task에 맞춤 RAG 방식 설계

> New Patterns
> 새로운 모듈의 수정 및 추가로 유연한 확장 가능

> Prompt engineering
> 외부 지식의 주입을 최소화하면서 모델의 내재된 역량을 최대한 끌어올리는 방법

> RAG
> 외부 지식(참고서) 제공

> FT
> 지식을 내제화

> Unstructured Data
> 

> Semi-structured data
> 텍스트와 테이블이 조합된 데이터

> challenges for conventional RAG systems
> 표 데이터 분절의 어려움, 유사도 검색에 악영향 우려

> Structured data
> 구조화된 데이터(지식 그래프 ex KnowledGPT, G-Retriever)

> LLMs-Generated Content
> 아는 질문은 LLM 활용, LLM 생성 답변을 컨텍스트로 활용 등)

> Selfmem
> LLM이 생성한 답변을 메모리풀에 저장 -> 검색 후 재생성을 통해서 조금 더 깊은 문제를 해결할 수 있도록 강화

> recursive splits
> 큰 단위 -> 작은 단위(문장)로 분할

> sliding window methods
> 청크간 내용이 일부 겹치도록 분할

> sparse encoder
> 개별 단어별로 가중치를 할당해 쿼리와 문서의 유사도를 계산(표면적 단어 일치)

> dense retriever
> 벡터 공간에 좌표 계산 후 유사도 측정

> mitigate such discrepancies
> 

> align the retriever and generator
> 

> align the retriever and generator
> 

> soft rewards
> LLM이 여러 태스크를 수행하며 각 결과에 대해 부여하는 점수

> LLMs can work with effectively
> downstream task에서의 LLM 정밀도, 정확도, 적합성 등을 기준으로 판단

> substituted
> retriever를 특정 태스크에 맞게 미세 조정하는 것이 아닌 아예 교체

> MRR
> 정답이 검색 결과에서 몇 번째 등장하는지 확인

> remove unimportant tokens
> 

> reducing the number of documents
> 

> additional knowledge
> 

> adjust the model’s input and output
> 

> tripartite training
> 

> contrastive learning
> 쿼리, 문서간 관련성을 파악하여 임베딩 모델 학습

> converging on the most pertinent information through a feedback loop
> 

> CoT
> 

> ToC
> 질의의 애매한 부분을 최적화할 clarification tree 생성

> clarification tree
> 초기 질의에서 애매한 부분을 여러 단계로 나누어 각 단계마다 구체적이고 명확한 하위 질문을 생성하는 트리형 자료구조

> WebGPT
> 답변 생성과 동시에 검색 진행하도록 강화학습

> Flare
> 답변 confidence가 특정 수치 이하로 감소 시 검색 수행

> Self-RAG
> 

> beam search
> 여러 경로(문장 혹은 조각 조합)를 동시에 탐색하며 가장 일관성 있는 답변 시퀀스를 찾아내는 답변 기법

> Context Relevance
> 추출된 컨텍스트의 정확성과 구체성

> Answer Faithfulness
> 

> Answer Relevance
> 

> Noise Robustness
> 질문과 관련있지만 정보가 부족한 문서 관리

> Negative Rejection
> 

> Information Integration
> 

> Counterfactual Robustness tests
> 

