---

title: "[소프트웨어공학] Chapter2. Software Process"
source: https://velog.io/@wilko97/%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4%EA%B3%B5%ED%95%99-Chapter2.-Software-Process
author: []
published:
created: 2025-11-09
description: "소프트웨어 개발 프로세스의 공통 4단계(명세, 설계/구현, 검증, 진화)를 정의합니다. 폭포수(Waterfall), 점진적(Incremental), 재사용 기반 모델의 특징과 장단점을 비교 분석합니다."
tags:
  - Software_Engineering
  - Software_Engineering/Software_Process
  - Software_Engineering/Process_Model/Waterfall_Model
  - Software_Engineering/Process_Model/Incremental_Development
  - Software_Engineering/Process_Model/Prototyping
  - Software_Engineering/Process_Improvement
canvas:
  - "[[MOC_Software_Engineering.canvas]]"
MOC_Software_Engineering:
  - "[[소프트웨어공학 요구공학과 요구사항 분석]]"
cover: https://velog.velcdn.com/images/wilko97/post/d5138c59-0ede-4feb-95ad-e6dac15af9c5/image.png
---
[wilko97.log](https://velog.io/@wilko97/posts)

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2Fb8626f77-8e17-4d80-a542-83fd0a3421c3%2Fse.png)

## 2.1 Software process model

Software system을 개발하기 위한 다양한 방법들이 존재한다. 하지만 많은 다양한 방법론들 가운데서 아래와 같이 정형화된 **공통적인 4단계** 가 있다. 소프트웨어 개발 모델은 추상적으로 과정을 나타낸 것이다.

- 1. **Specification(명세)**: 소프트웨어가 어떤 기능을 해야하는지 정의한다
- 1. **Design and Implementation(설계 및 개발)**: system 구성 조직들을 정의하고 구현한다
- 1. **Validation(검증)**: 고객이 원하는대로 만들어졌는지 검증한다
- 1. **Evolution(진화)**: 고객의 변화에 맞추어 SW를 수정한다.

> **Software process descriptions**  
> 개발 과정들에 관해 얘기할 때, 과정에서의 활동(데이터모델 명시, UI 설계 등)들과 활동들의 순서에 관해 얘기한다. 즉, 누가 이 과정의 일부이며, 과정의 결과물은 무엇이며, 전후 단계의 조건들은 중요하다고 할 수 있다.

대표적인 소프트웨어 개발 모델들은 다음과 같다.  
1) **Waterfall model** -> 대표적으로 plan-based  
2) **Incremental model** -> 대표적으로 agile  
3) **Integration & Configuration model**

위의 방법들 중에서 맞거나 틀린 모델은 존재하지 않는다! 상황에 따라서 가장 적합한 모델을 적용하면 되는 것이다.

## 2.1.1 Waterfall model

**Plan 기반의 모델로서, specification/development 등 각 단계가 분리되어 있다.**

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2Fd5138c59-0ede-4feb-95ad-e6dac15af9c5%2Fimage.png)

다음과 같이 각 단계별 분리 및 순서가 존재하며, 앞의 단계가 끝나야 뒤의 단계로 넘어가기 때문에, 뒤에서 앞으로 되돌아 가기 위해서는 감수 비용이 큰 단점이 있다. 대표적인 방법으로 **plan-based process** 들이 있는데, **개발 계획을 먼저 단계별로 만든 후에, 계획대로 실행해야 한다. 각 단계별로 task들이 명확하게 명시** 되어야 하며, 이 방법은 전통적으로 사용되는 방법이다. 보통 hardware 개발 관련 분야(임베디드)나, 보안 관련 분야, 규모가 큰 프로젝트, 대기업 등에서 자주 사용하는 방법이라 한다. 특히, 대규모 프로젝트의 경우, 여러 단체가 참여하는데, plan-based 방식은 이들의 협력이 잘 되도록 한다.

폭포수 모델의 단계 분류는 다음과 같다

- 1) Requirement analysis and definition
- 2) System and software design
- 3) Implementation and system testing
- 4) Integration and system testing
- 5) Operation and maintenance

> waterfall model의 단점
> 
> - Inflexible한 partition은 **변화하는 고객의 requirements에 대응하기 어렵게 만든다** -> 다시 처음부터 돌아가야 하기 때문이다! 따라서, requirements를 처음에 잘 정의해야할 필요가 있으며, 이는 4장에서 자세히 다룬다

## 2.1.2 Incremental development

**개발 단계들이 서로 연결되어 있으며, version-up하는 방식으로, 연속적인 시스템 개발을 하는 방법이다.** 초기의 버전에서, 피드백을 통한 연속적인 evolution을 통해, 시스템의 기능이 차츰 늘어난다. 또한 과정들이 동시 다발적으로 일어난다.

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2F63da7002-7ddc-46cc-ad8b-c672c7937564%2Fimage.png)

plan-based, agile 방식 모두 사용이 가능하며, plan-based의 경우에는 미리 버전 업데이트에 관한 계획을 정해둔다. 반면 agile은, 변화된 상황과 개발 상황에 맞추어 유연하게 시스템 업데이트를 진행한다.

> **Incremental development의 장점**  
> **Incremental development의 장점으로는 (requirement) 변화에 대응하기 쉽다는 점이다.** waterfall 방식에 비해 앞단계로 돌아갈때 필요한 cost가 적으며, 고객들의 피드백을 받아서 버젼업을 할 수 있다. 최근에는 sw의 개발과 운영이 빠른 속도로 이뤄져야 하는데, Incremental development의 경우 초기 버젼을 빠르게 개발한 이후, 점진적으로 업데이트를 통해 보완할 수 있다는 면에서 최근의 needs에 맞는 방식이라 할 수 있다.

> **Incremental development의 단점**
> 
> - **개발 과정이 가시적이지 않다**. 개발 결과물이 빠르게 변화하므로, manager들의 개발 진행상황을 측정하여 문서화 시키기에 용이하지는 않다.
> - **새로운 기능이 추가될 때마다 시스템 구조는 훼손된다**. 부분적인 변화를 계속 수용하다 보면, 전체적인 그림을 파악하기에 애로사항이 발생하고 새로운 기능을 추가하는 작업에 더 많은 비용 소요된다. 구조적인 품질 저하를 방지하기 위해 정기적인 리팩토링 필요하다.

## 2.1.3 Integration & Configuration

**소프트웨어 재사용에 초점을 맞추어, 시스템을 기존에 존재하던 것들로 구성한다.** Reused elements들은 고객의 requirement에 맞추어 구성된다. 최근에는 이 방법이 흔하다고 한다.

재사용 가능한 소프트웨어들의 종류는 다음과 같다.  
1\. Stand-alone application systems(COTs): 특정 환경에 사용가능하도록 구성된다.  
2\. 객체들이 패키지 단위로 개발되어, 프레임워크에 통합가능한 형태  
3\. 서비스 표준에 맞추어 개발되었으며, 원격 접속이 가능한 웹서비스들

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2Fe96f3e6b-d82a-4e98-9757-13cfa07ebfe6%2Fimage.png)

> **5가지 핵심 단계**
> 
> - Requirements specification: 고객의 요구사항 명세화
> - Software discovery and evaluation: 소프트웨어 발견과 평가
> - Requirement refinement: 요구의 정제
> - Application system configuration: 시스템 구성
> - component adaptation and integration: 구성 성분 적용 및 통합

> **장단점**  
> 백지상태서 개발하는 것보다는 적은 위험과 비용이 드는 것과 빠른 개발 및 운영이 가능하다는 장점이 있다. 하지만 requirement를 감안해야 하므로 시스템이 사용자의 실제 needs에 부합하지 않을 수 있다. 또한 재사용 요소들이 업데이트 되면, 시스템 통제가 약화된다.

## 2.2 Process activities

sw개발 단계는 기초적으로 **specification, development, validation, evolution 4단계** 가 있다. waterfall방식은 서로 구분되지만, incremental방식에서는 연결되어 있다.

## 2.2.1 Requirement Specification

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2F138f6941-1102-44b6-bc88-9e4aa25aaf64%2Fimage.png)

**소프트웨어의 필요 기능과 제약 사항들을 결정하는 것이다**. 위의 그림과 같은 requirement engineering process를 통해 최종적인 requirement를 도출한다.

- 요구사항 도출 및 분석: 당사자들이 시스템에게 기대하는 점은 무엇인가?
- 요구사항 명세화: 요구사항들을 자세히 정의한다.
- 요구사항 검증: 도출된 요구사항의 내용을 검증한다.

## 2.2.2 Design and Implementation

시스템 세부사항을 가지고 구현하는 것이다. 설계는 세부 사항들을 현실화하기 위해서 소프트웨어를 구조화. 구현은 이러한 구조들을 실행 가능한 프로그램으로 만드는 것이다. **설계와 구현은 서로 밀접하게 연관되어 있다.**

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2F11dd99a6-0b36-432d-b6ac-05d7759fc741%2Fimage.png)

소프트웨어 설계에 대한 일반적인 모델은 위와 같다.

- Architecture design: 전반적인 시스템 구조와 구성 요소들을 설계한다.
- Database design: 시스템 데이터 구조와 어떻게 데이터 베이스에 나타나 있는지를 설계
- Interface design: 시스템 구성요소간의 interfaces를 설계
- Component selection and design: 재사용 가능한 구성요소들을 검색. 불가시, 직접 설계해야 한다.

Design output으로는 보통 구체적인 문서들로 구성되며, agile 등에서는 프로그램 코드 자체가 문서가 될 것이다.

## 2.2.3 Software Validation

Verification & Validation이 있다. **Verification은 '기능에 맞게 구현했는가?'를 check하는 것이고, Validation은 '요구사항에 맞게 구현했는가?'를 확인** 하는 것이다. System testing은 spec에 따른 test cases들로 검증한다. Testing은 대표적인 V&V 활동이다.

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2Ff0ae48c0-7bb1-4bce-9389-cabfecdb95c9%2Fimage.png)

Component testing의 경우, 개발자가 생각하지 못한 경우에 대하여 제3자가 객관적으로 test를 하여야 한다. 또한 구성요소모다 독립적으로 테스팅되어야 한다. System testing은 시스템 전체로서 테스트하는 것이다. Customer testing은 고객에게 테스트 받는 것으로, needs를 만족했는가를 주로 테스트한다.

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2F5ca58561-afd1-404b-a5ec-9d4da5953671%2Fimage.png)

Plan-base의 평가 방식은 다음과 같이 여러 계획에 따라 평가가 진행된다. specification에 따른 평가 계획을 미리 만든후에, 실제로 평가시 사용한다. 대기업의 경우 평가를 전용으로 하는 팀들도 존재한다.

## 2.2.4 Software evolution

Software는 flexible하며 자주 변한다. 특히 시장 상황에 따라 변화가 자주 발생하므로, 변화에 대한 evolve는 필수적이다.  
![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2F0332d2ac-24d6-4661-a544-b983783cce7e%2Fimage.png)

## 2.3 Coping with changes

대규모 개발 프로젝트에서 변화는 필수적이다. 시장의 변화, 기술의 변화, 플랫폼의 변화등이 있을 수 있다. 소프트웨어 공학서는 *'어떻게 하면 효율적으로 변화를 받아들일지'* 에 관하여 다룬다.

> Rework의 비용을 낮추는 2가지 방법
> 
> - **Change anticipation(변화에 대한 예측)**: 단계들별로 미리 변화에 대해 예측하는 활동을 담는 것이다. Ex) Prototype
> - **Change tolerance(변화에 대해 관대함)**: 변화를 손쉽게 할 수 있도록 과정들을 설계한다. Ex) Incremental development

> **System prototyping**  
> 시스템의 일부 또는 초기 버전을 빠르게 만들어서, 소비자 요구사항을 만족하는지 확인하고, 설계 결정에 대한 실행가능성을 검토한다. 프로토타입을 실제 서비스에서 제공해서는 안된다! 이 방법은 변화에 대한 예측을 한다.  
>   
> **Incremental delivery**  
> 시스템은 점진적으로 개발함으로써, 고객들의 체험과 코멘트를 받을 수 있다.

## 2.3.1 Prototype

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2Fc06500c1-a947-4545-afe1-8dae571688a4%2Fimage.png)

프로토타입은 고객의 의사 결정을 위해, 시스템의 초기 버전을 빠르게 개발한다. 이 방법의 장점으로는 시스템 사용성의 개선, 사용자의 실제 needs를 충족, 설계 완성도를 높이며, 유지보수성을 개선, 추후 실제 시스템 개발시 어느 정도의 노력 감소 등이 있다. 이를 통해 보다 개발을 명확하게 할 수 있으며, 설계의 현실성을 확인하는 곳에서도 사용가능하다. 무엇보다도 **프로토타입은 빠르게 개발되어야 하며, 기능 중심으로 개발이 되어야 한다.** 오류 검증이나, 비기능적요소(신뢰성, 보안)등은 고려할 필요가 없다. 또한, **개발된 프로토타입은 실제 개발에 사용해서는 안되며, 반드시 버려야한다.** 프로토타입은 앞서 기능 중심으로 확인하는 것을 목적으로 하기 때문에, 기능 외적으로는 신뢰성이 없기 때문이다.

## 2.3.2 Incremental Delivery

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2Fc3e7741f-9bf5-4235-9f07-363c9752d38f%2Fimage.png)

우선순위가 높은 requirement 위주로 초기 버전을 개발한 이후, 나머지 부분을 점진적으로 추가한다. 개발-구현-검증이 같은 단계서 이뤄진다.

- Incremental development: 시스템을 점진적으로 개발하며, 다음 버전으로 넘어가기 전에 현단계에 대한 평가를 진행한다. 보통 agile 방법을 많이 사용한다
- Incremental delivery: 실제 소프트웨어를 운영하며, 현실적인 평가들을 얻을 수 있다.

> **점진적 배포의 장점**
> 
> - 고객들에게 미리 제공함으로써 빠른 피드백을 받을 수 있다.
> - 초기 단계서 나중 단계를 위한 고객들의 요구사항들을 도출 가능
> - 프로젝트 실패에 대한 리스크가 줄어듬
> - 우선순위가 높은 것부터 Testing받음  
> 	  
> 	**단점**
> - 공통적으로 사용하는 기능들이 있을 터인데, 요구사항이 미리 세부적으로 정해지지 않으면, 공통적인 기능이 무엇인지 확인하기 힘듬
> - 점진적 접근법에서는 최종 점진 사항 명세가 나오기 전까지 완전한 시스템 명세가 존재하지 않으므로, 이것이 개발 계약의 일부인 경우 부적합하다

## 2.4 Process improvement

소프트웨어 과정들은 SW를 개선하고, 비용을 줄이며, 개발 속도 가속화에 집중하고 있다.

> **개발 과정 개선의 2가지 방법**  
> 1\. **Process maturity approach**: 프로세스 개선 및 좋은 SW 개발 관행 도입 등에 초점.  
> 2\. **Agile approach**: 반복적인 개발과정과 프로세스 부담을 낮추는 것을 초점으로 한다.

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2Fb2867849-bdfa-4237-adc2-8436355b08ee%2Fimage.png)

> **프로세스 개선 Cycle**  
> 1) 프로세스 평가: 소프트웨어 프로세스나 제품의 속성 하나 이상을 측정  
> 2) 프로세스 분석: 현재 프로세스를 평가하여, 취약점과 병목점을 파악한다.  
> 3) 프로세스 변화: 파악된 취약점 해결을 위해 프로세스 변화를 준다.

프로세스의 평가를 위해서는 가능한 데이터를 통해 **정량적으로 평가** 하는 것이 바람직하다. 이를 위해서는 지표가 필요할 것이다. 사용 가능한 지표로는 시간, resource, events 발생 횟수 등이 있을 것이다. 또한 프로세스 평가자료는 후에 프로세스 개선에 사용되어야 한다.

![](https://velog.velcdn.com/images%2Fwilko97%2Fpost%2Fc7546408-725f-4bba-917a-4401d8ec1cbd%2Fimage.png)

위 그림은 **SEI capabillity maturity model(process 성숙도 레벨)을 나타낸 것으로서, 프로세스를 정량적으로 측정할 수 있다.** 성숙 모델의 수준은 다음과 같이 분류할 수 있다

- Initial: 통제되지 않은 상태
- Managed: 제품 관리의 단계들의 절차가 정의되어 사용되고 있는 단계
- Defined: 제품 관리 단계들의 절차와 전략들이 정의되어 사용되고 있는 단계
- Managed: 품질 관리 전략들이 정의되어 사용되고 있는 단계
- Optimising: 프로세스 개선의 전략들이 정의되어 사용되는 단계

## Summary

- 소프트웨어 개발 과정들은 소프트웨어 시스템 개발하는 과정들을 포함한다.(plan-based, Incremental, Integration) 소프트웨어 개발 모델들은 이러한 절차들을 추상화 시킨 것이다.
- 일반적인 프로세스 모델들은 소프트웨어 개발과정들의 구성을 설명한다.
- Requirement engineering은 softwared specification(명세)를 작성하는 절차이다.
- 설계와 구현은 requirements specifications을 실행 가능한 소프트웨어 시스템들로 만드는 것이다
- 소프트웨어 검증은 시스템이 명세와 맞는지, 사용제의 실제 니즈와 부합한지를 검사하는 단계이다
- 소프트웨어 진화는 기존의 SW를 변화된 requirement에 맞게 수정하는 것이다. 유용하기 위해서는 반드시 진화해야 한다
- 개발 절차들은 변화에 대처하기 위해 프로토타입이나, 점차적 배포(incremental delivery)등을 포함한다
- 개발 절차들은 반복적인 개발을 위해 구조화 되어야하며, 변화들은 시스템 전체를 상쇄하지 않으며 일어나야 한다.
- 개발 절차의 개선 방법들은 agile, 프로세스 부담 줄이기, maturity-based 방법들을 사용하여, 향상된 프로세스들의 관리와 좋은 소프트웨어 관행의 사용을 목표로 한다
- SEI 평가 절차는 성숙도 단계를 파악하여 해당되는 좋은 소프트웨어 개발 관습을 도입한다.[이전 포스트](https://velog.io/@wilko97/%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4%EA%B3%B5%ED%95%99-Chapter1.-Introduction)

[

### \[소프트웨어공학\] Chapter1. Introduction

](https://velog.io/@wilko97/%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4%EA%B3%B5%ED%95%99-Chapter1.-Introduction)[다음 포스트](https://velog.io/@wilko97/%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4%EA%B3%B5%ED%95%99-Chapter2.-Software-Process-przoaqia)

[![Powered by GraphCDN, the GraphQL CDN](https://graphcdn.io/badge.svg)](https://graphcdn.io/?ref=powered-by)
