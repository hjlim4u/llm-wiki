---
type: Note
created: 2025-01-31
published:
author: []
tags:
  - Closure
  - Prototype
  - JavaScript/Paradigm
source: []
total_page:
description: 자바스크립트의 런타임 환경, 변수 스코프, 함수 시스템, 객체 프로토타입 및 클로저 등 언어의 뿌리가 되는 핵심 개념들을 체계적으로 정리한 노트입니다.
---

### 날짜 : 2025-01-31

### 태그 : 

### 메모 (한줄평)
>

### (독서) 노트
##### 자바스크립트
- JS 런타임 환경(브라우저 엔진, Node.js)은 전역 스코프에 API를 추가해 자체적으로 사용할 수 있는 기능 제공(ex. alert fetch getCurrentLocation, fs.write())
- 패러다임: 코드를 어떻게 구조화할지에 대한 접근 방식
	- 절차적 프로그밍: 코드가 톱다운이면서 선형적으로 구조화, 프로시저라 불리는 코드 단위에 미리 정해진 일련의 연산 작성
	- 객체지향 프로그래밍: 클래스 기준으로 코드 구조화
	- 함수형 프로그래밍: 함수 단위로 구조화, 부수 효과 없는 순수 함수
- 하위 호환성 보장: 단 한 번이라도 유효한 문법이라고 인정되면 명세서 변경되더라도 절대 그 유효성은 보장
- 상위 호환성 보장 안함: 새로운 명세서에 추가된 문법으로 코드 작성 시 이전 명세서를 준수하는 구형 엔진이 문제 없이 돌아가는지 여부
	- 트랜스파일: 다른 형태로 소스 코드를 변환(let -> var)
	- 폴리필: 지원하는 않는 api메서드 정의 추가
- 인터프리터, 스크립트 언어: 한줄씩 코드 해석 및 실행, 코드 실행 전까지 오류 처리 지연
- 컴파일 언어: 파싱을 통한 추상 구문 트리 생성 후 컴파일 거쳐 바이너리 코드 생성, 실행 전 초기 오류 탐지
- 컴파일 단계에서 가상 머신에 전달할 이진 바이트 코드 생성, 파싱 이후 생성된 코드를 다양한 방법으로 실행 전 그때 그때(JIT) 처리 및 최적화
- ASM.js: C 등 다른 언어로 작성한 코드를 트랜스 파일한 것, 일관성 있는 타입 시스템 사용하여 성능 최적화 뛰어남
- 웹어셈블리: 다른 언어로 작성된 파일이 JS엔진 위에서도 돌아가도록 도와주는 툴
	- 파싱 컴파일 없이 처리
- 엄격 모드: JS 엔진이 코드를 최적화하고 효율적으로 실행할 수 있게 해주는 안내 가이드 역할을 하는 모드
##### 자바스크립트 조망하기
- 파일 = 프로그램
	- 전역 스코프를 통한 상태 공유, 접근 가능한 공통 기능을 통해 여러 js 파일이 하나의 프로그램처럼 동작 가능
	- ES6 이후 보통의 독립형 프로그램 포맷 외 모듈 포맷 지원
- 변수 선언과 사용: var(함수 스코프), let(블록 스코프)
- 상수 const: 참조 변경 불가, 값 변경 가능
- 함수 선언
```javascript
function 함수(매개변수) { //컴파일 단계에서 함수 명과 함수 객체간 연결
	return 반환값;
}
```
- 함수 표현식
```javascript
var 함수명 = function () {}; //실행 단계에서 변수명과 함수 객체간 연결
```
- 함수는 일급 객체: 반환값, 매개변수, 객체 프로퍼티 등 변수가 사용될 수 있는 곳에 사용
- 일치 연산자(===)
```javascript
3 === 3.0 //true
null === null //true
NaN === NaN // false Number.isNan() 권장
0 === -0 // true Object.is() 권장 
```
- 동등 연산자(==) : 타입 통일 작업 후 비교
```javascript
43 == '43' // true
1 == true // true
```

- 클래식 모듈: 모듈 인스턴스 내부 데이터를 대상으로 동작하는 함수를 가진 인스턴스를 반환하는 모듈 팩토리 함수 선언
```javascript
function Publication(title, author, pubDate) {
	var publicAPI = {
		print() {
			console.log(`
				제목: ${title}
			`)
		}
	}
	return publicAPI
}
```
- ES 모듈: 모듈 정의하는 래핑 함수 X, 싱글톤으로 생성되는 모듈 인스턴스
##### 자바스크립트 뿌리 파헤치기
- 이터레이터 패턴: 데이터를 일정 단위로 쪼개고 차례대로 순회하면서 처리하는 패턴
	- next(): value와 done이라는 프로퍼티가 있는 이터레이터 리절트 객체 반환
- 이터레이터 소비
```javascript
// for ... of
var it = /* ... */;
for (let val of it) {
	console.log(`iterator val ${val}`);
}
// 전개 구문
var vals = [...it];
// 나머지 매개변수
doSomething(...it);
```
- 이터러블: 이터레이터 인스턴스 생성하고 소비 가능한 객체
```javascript
var arr = [10, 20, 40];
for (let a of arr) // for (let [idx, val] of arr.entries())
var greetings = "Hello world!";
var buttonNames = new Map(); 
for (let [btn, btnName] of buttonNames) // let btnName of buttonNames.values()

```
- 클로저: 함수가 정의되지 않은 스코프에서 실행하더라도 스코프 밖에 있는 변수를 기억하고 외부 변수에 계속 접근할 수 있는 경우
```javascript
function greeting(msg) {
	return function who(name) {
		console.log(`${ name }, ${ msg} !`);
	}
}
```
- 클로저는 변수 msg를 복사가 아닌 변수 자체와 관계를 맺어 변수의 최신 상태값 반영
```javascript
function couter(step = 1) {
	var count = 0;
	return function increaseCount() {
		count = count + step;
		return count;
	}
}
var incBy1 = counter(1);
var incBy3 = counter(3);
```
- this 키워드
	- 스코프: 정적이며 함수를 정의하는 순간, 해당 스코프에서 사용할 수 있는 한정된 변수 집합
	- 실행 컨텍스트: 동적이며 정의, 호출 위치 상관없이 호출 방식에 따라 결정
```javascript
var homework = {
	topic : "JS",
	assignment: assignment
}
homework.assignment(); 
assignment.call(homework); // this가 참조하는 객체를 결정
```
- 프로토타입: 두 객체를 연결하는 장치(프로퍼티에 접근할 때 동작)
```javascript
homework.toString() // Object.prototype로 위임
var otherHomework = Object.create(homework); // 프로토타입으로 연결할 객체 설정
otherHomework.topic = "수학"; // otherHomework 객체의 프로퍼티가 프로토타입으로 연결된 객체의 프로퍼티를 가림
```

```javascript
var homework = {
	study() { console.log(`${this.topic} study`);}
};
var jsHomework = Object.create(homework);
jsHomework.topic = "JS";

var mathHomework = Object.create(homework);
mathHomework.topic = "수학";
```


##### 부록 A
- 다양한 형태의 함수
	```javascript
	var functionName = function(parameter) {
		return returnValue;
	}
	functionName.name; // 익명 함수의 경우 자체적으로 추론 "functionName"
	
	```

	- = 연산자를 사용해 함수 표현식을 할당한 경우에만 추론 유효(함수 표현식을 인자로 전달할 경우 추론 발생하지 않음)
	- 추론된 이름은 문자열 형태의 메타데이터, 함수를 참조하는 유효한 식별자 아님
- 강제 조건부 비교
	```javascript
	var x = "안녕하세요"
	if (x) {} // if(Boolean(x) == true)
	while (x) {}
	```
- 프로토타입 클래스: 프로토타입 연결 장치
	```javascript
	function Classroom() {} //함수는 기본적으로 prototype 프로퍼티를 통해 빈 객체 참조
	Classroom.prototype.welcome = function hello() {};
	var mathClass = new Classroom(); // mathClass 의 프로토타입이 Classroom.prototype
	mathClass.welcome();
	```
	- prototype 프로퍼티 != 함수의 프로토타입(프로토타입을 통해 함수와 연결된 객체)
	- 프로퍼티는 new 연산자로 생성된 객체의 프로토타입을 설정할 수 있도록 합니다


### 생각 (질문)
- 

### 출처 (인물)
- 

### 연결 (이유)
- 
