---
type: Note
created: 2026-03-18
published:
author: []
tags:
  - Java
  - Collection_Framework
  - Coding_Test
  - Syntax
source: []
total_page:
description: 자바의 역사와 주요 버전별 특징, 객체지향 4대 요소, 제네릭, 람다, JVM 구조 및 코틀린과의 상호 운용성을 정리한 종합 기술 노트입니다.
canvas:
  - "[[JAVA_temp.canvas]]"
JAVA_temp:
  - "[[JAVA 코딩테스트 문법 정리]]"
---
```dataview
list from #Java
```
## 자바의 역사
WORA(Write Once, Run Anywhere)
한 번 컴파일 된 자바 코드는 다른 플랫폼에서 다시 컴파일할 필요 없이 동작한다.

| 버전  | 주요 특징                        |
| --- | ---------------------------- |
| 1.0 | 정식 버전 발표                     |
| 1.2 | 컬렉션 프레임워크 thro               |
| 5   | 제네릭 도입, 오토박싱 등 대대적인 기능 향상    |
| 6   | 가장 오래 유지된 버전                 |
| 7   | 오라클 인수                       |
| 8   | 스트림 및 함수형 프로그래밍 언어의 특징 대거 도입 |
| 9   | JShell 등장                    |
JShell
REPL(Read-Eval-Print Loop) 환경 제공 , 기존에는 클래스 생성-> main 메소드 작성 후 빌드 실행 거쳐야 결과 확인 가능
```jshell
>/help intro
>/imports
> methods
> vars
> types //정의한 타입(클래스, 인터페이스 등) 확인인
```
## 자바의 주요 특징
절차 지향  -> 객체 지향: 캡슐화(변화와 함수 클래스 단위로 묶음)를 통해 중복 최소화, 단위 별 개발, 가독성 좋은 코드 작성
객체 지향은 모듈식 구조 제공하므로 대규모 프로그래밍 개발에 유리

### 객체 지향의 4가지 특징
- 캡슐화
	- 속성은 private , 메소드는 public으로 노출하여 정보 은닉, 느슨한 결합 가능 ->의존성이 낮으며 모듈 수정이 자유롭다.
	- 재사용 가능 테스트 용이
- 추상화: 복잡한 시스템에서 핵심적인 개념 또는 기능 간추려 내는 것
- 상속
- 다형성
	- 경우에 따라 객체가 다르게 동작(오버로딩) ,  어떤 동작을 다른 방법으로 동작(오버라이딩)
	- 조상 클래스의 인스턴스/static 변수를 오버라이딩한 자손 클래스 인스턴스
		- 조상 타입의 참조 변수: 조상 클래스의 인스턴스/static 변수
		- 자손 타입의 참조 변수: 자손 클래스의 인스턴스/static 변수
	- 조상 클래스의 인스턴스 메서드를 오버라이딩한 자손 클래스 인스턴스
		- 조상 타입의 참조 변수: 자손 클래스의 인스턴스 메서드
		- 자손 타입의 참조 변수: 자손 클래스의 인스턴스 메서드 
		- 조상 클래스 타입 참조변수의 추상 메서드 호출 가능 -> 인스턴스에 구현된 메서드 호출



### 제네릭
클래스나 메소드에서 사용할 자료형을 컴파일 타임에 미리 지정하는 방식(타입안정성 보장)
```java
//지네릭 클래스
List<String> listnames = new ArrayList<String>();
//지네릭 메서드

```
- static멤버에 타입 변수 T 사용 X: T는 인스턴스 변수로 간주
- 타입변수 new, instanceof 연산자의 피연산자 불가능: 컴파일 시점에 피연산자 타입을 알아야 실행가능 (ex new T[2]; 지네릭 배열 생성 불가)
- 타입변수의 상속관계는 지네릭 클래스의 상속과 무관:
- 타입 변수의 다형성
```java
class FruitBox<T extends Fruit & Eatable> { //fruit의 자손, Eatable 인터페이스 구현 클래스로 제한
	ArrayList<T> list = new ArrayList<>();
}
```
- 와일드 카드: 하나의 참조 변수로 여러 지네릭 타입의 객체를 다루는 방법
```java
class Juicer {
	static Juice makeJuice (FruitBox<Fruit> box) {
	...}
}
class Juicer<T> {
	static <T extends Fruit> Juice makeJuice (FruitBox<T> box) {
	//클래스 에 선언된 타입 매개변수와 별개의 타입변
	...}
} // Juicer.<Apple>makeJuice(appleBox)
```
- 타입변수가 Fruit인 FruitBox 지네릭 클래스만 매개변수가 될 수 있음. FruitBox\<Apple>불가능, 오버로딩 불가능(컴파일 할 때 타입제거)
- 지네릭 메서드
- 대입된 타입 생략 불가한 경우 참조 변수나 클래스 이름 생략 X: \<Fruit>makeJuice(fruitBox) X this. Juicer 
- 같은 지네릭 클래스라도 다른 타입변수라면 형변환 불가능 Box\<String> Box\<Object>
- 와일드 카드 사용시 타입변수에 다형성 적용 가능 Box</? extends Object>
- 지네릭 타입 거거
	1. 지네릭 타입의 경계 제거(\<T extends Fruit> -> Fruit로 치환 후 지네릭 선언 제거)
	2. 지네릭 타입 제거후 타입 불일치 시 형변환 가가

### 람다표현식
- 함수형 인터페이스(추상 메소드 하나만 갖는 인터페이스)를 간결하게 구현 ㄷ(parameter) -> { contents}
- 익명 객체

### 자바의 빌드와 실행
#### C++의 빌드과정
각 운영체제의 컴파일러->운영체제 최적화된 바이너리(이식성 좋지 않음, 각각의 환경에 맞춰 개발 필요)
#### JAVA의 빌드
컴파일러 -> 바이트코드 -> 운영체제의 자바 실행환경(JRE)
- JRE: 라이브러리와 도구 + JVM
$ javac Hello.java //Hello.class 라는 클래스파일(바이트코드) 생성
$ java Hello // .class 생략 클래스명만 지정 시 main 메소드 실행

### JVM 
가상 기계(Virtual Machine): 소프트웨어로 구현된 하드웨어
하드웨어에 맞게 완전히 컴파일된 상태가 아니고 실행 시 해석 속도 느리다. 하지만 요즘에 바이트코드 -> 하드웨어의 기계어로 바로 변환해주는 JIT 컴파일러와 최적화 기술이 적용되어 속도 개선

bin 디렉토리 내 파일들
javac.exe 자바 컴파일러(소스코드 -> 바이트 코드)
java.exe 자바 인터프리터(바이트코드 해석 및 실행)
javap.exe 역어셈블러(컴파일 클래스파일 -> 소스코드 선언부만)
jar.exe 클래스파일+실행에 필요한 파일 -> jar파일로 압축


| 인터페이스 | 해시 테이블  | 동적 배열      | 균형 트리   | 연결 리스트     | 해시테이블+연결리스트   |
| ----- | ------- | ---------- | ------- | ---------- | ------------- |
| List  |         | ArrayList  |         | LinkedList |               |
| Map   | HashMap |            | TreeMap |            | LinkedHashMap |
| Set   | HashSet |            | TreeSet |            | LinkedHashSet |
| Deque |         | ArrayDeque |         | LinkedList |               |
## JVM 기반 언어, 코틀린

- 실용성
	- 실무에 최적화된 실용적인 언어: 최신 연구분야보다는 다른 언어에 검증된 방식 채택
	- 인텔리제이의 지원
- 상호 운용성
	- 자바 라이브러리와 완벽한 호환: 하나의 프로젝트 내에서 자바, 코틀린 호환 가능, 자바 메소드 호출, 클래스 상속 가능, 자바 어노테이션 적용
- 안전성:실수할 가능성을 원천 봉쇄해 오류의 가능성 줄여줘
	- Null Safety
		```
			val a1: String? = null //nullable
			val a2: String = null // nullX
		fun strLen(s: String) : Int {
			return  // s not null 강제 s!!.length //s?.length null safe 타입 선언 반환값은 여전히 Int?
		}
		```


### 문법
```kotlin
fun square(x: Int): Int { //public이 디폴트
	return x * x
} // fun square(x: Int) = x*x 단일 표현식 리턴하는 경우 중괄호 생략 가능
fun main() {
	val result: Int = square(5); //var: 읽기 전용, val: 변경 가능
	// 타입 추론으로 반환형 생략 가능 val result = square(5)
	println("Hello World!");
}// 자바와 달리 클래스 없이 함수생성 가능

var sum = 0
for(i in 1..10) { // i in 10 downTo 0 step 2
	sum+=i
}

fun getTypeOfDayWithSwitchStatement(dayOfWeek: Int): String {
	val typeOfDay: String = when (dayOfWeek) { 
		1-> "start of week"
		2,3,4->"workday"
		5->"endofweek"
		dayOfWeek in 6..7-> "weekend" //parameter(dayOfWeek) 생략 가능
		else -> throw IllegalArgumentException("Wrong Day: $dayOfWeek")
	}
}

val result = when {
	number in 3..5 -> "숫자"
	char == "a" -> "문자"
	else -> {
		println("모름")
	}
}
fun overload(paramA: Int, paramB: Int=0 )

val doubleList = list.map { it*2 }
members.filter{ it.age == 24} //map,filter 기본 파라미터 it 제공, 함수 마지막 인자가 함수인 경우 람다식 전달 가능, 소괄호 생략 가능
	.map{ it.name }.sorted() //collect 생략 가능

//메서드 접근 제어자
public // 디폴트: 어디서든 접근 가능
protected // 상속받은 클래스 접근가능, 클래스는 final이 디폴트(상속 불가능 open 별도 선언)
internal // 모듈 접근 제한 > 자바 패키지 제한(default) 

s[start] = s[end].also {s[end] = s[start]}

val value = if (a < b) {
	b
} else {
	a
}

class OuterClass {
	val outerVal: Int = 0
	class NestedClass { //data class NestedClass 데이터 보유가 주목적인 클래
		init {
			outerVal = 1 //error
			var nestedVal: Int = 2
		}
	}
	inner class InnerClass {
		init {
			outerVal = 3
			var innerVal = 4
		}
	}
}
class ClassName constructor(val parameter: Int = 4) //annotation, access modifier x class ClassName(val parameter: Int = 4)
class Car(val passengers: Int = 4 ) {
	init {
	println("passengers: $passengers") //단순 할당 X
	}
}
```

### 빌드와 실행
```shell
$ kotlinc Hello.kt // HelloKt.class
$ javap -c HelloKt.class //disassemble
```

 - 클래스 X 함수만 선언할 경우, 함수가 실행될 수 있도록 컴파일러가 임의로 클래스와 메인 메서드로 감싸줌
 - 단순 출력 외에 코틀린 코드 자체는 실행 불가
	 - JRE는 자바 전용 실행 환경이기 때문에 코틀린은  JRE 지원 불가 -> 기본클래스와 함께 묶어서  JAR 파일로 배포
	 - ```kotlinc Array.kt-include-runtime -d array.jar // -include-runtime 코틀린 라이브러리와 리소스를 함께 묶어 jar 패키지 생성성
		java -jar array.jar```
		


### 확장 함수
클래스 외부에서 메소드 추가할 수 있는 기능
```kotlin
fun List<Int>.lastElement(): Int = this.get(this.size - 1)
```

#### 코틀린 자바 자료형
```kotlin
val four = 4
four.javaClass // java.lang.Class<kotlin.Int> = int
```

```kotlin
val intElements = IntArray(100000000) //arrayOfNulls<Int?>(100000000)
for (i in 0 until 100000000 - 1)
  intElements[i] = 1
var index = 0
while(2 != intElements[index])
	index++
println(intElements.max()) //int[] 자료형, 확장 함수를 통해 참조형의 편의 기능 제공
```

| 코틀린 자료형                   | 생성 함수                            | 자바 자료형    |
| ------------------------- | -------------------------------- | --------- |
| Int                       |                                  | int       |
| Int?                      |                                  | Integer   |
| IntArray                  | intArrayOf()                     | int[]     |
| Array\<Int\>, Array<Int?> | arrayOf(), arrayOfNulls\<Int\>() | Integer[] |

### 코틀린 컬렉션
![[Pasted image 20240509065602.png]]
List, Set, Map 기본적으로 불변 / 생성 조회 함수만 정의
MutableCollection 수정/ 삭제 변경 가능


#### 리스트 생성함수와 자료형
| 생성 함수           | 코틀린 자료형                    | 자바 클래스                     | 불변여부 |
| --------------- | -------------------------- | -------------------------- | ---- |
| listOf()        | List\<Int\>                | java.util.Arrays$ArrayList | o    |
| mutableListOf() | MutableList\<Int\>         | java.util.ArrayList        | x    |
| arrayListOf()   | java.util.ArrayList\<Int\> | java.util.ArrayList        | x    |
코틀린 버전업 여부 상관없이 ArrayList 사용시 arrayListOf 메소드 사용
LinkedList 생성함수는 없음(자바 클래스 활용용)

#### 맵 생성함수와 자료형
| 생성 함수          | 코틀린 자료형                              | 자바 클래스                  | 불변여부 |
| -------------- | ------------------------------------ | ----------------------- | ---- |
| mapOf()        | Map<String, Int>                     | java.util.LinkedHashMap | o    |
| mutableMapOf() | MutableMap<String, Int>              | java.util.LinkedHashMap | x    |
| hashMapOf()    | java.util.HashMap<String, Int>       | java.util.HashMap       | x    |
| linkedMapOf()  | java.util.LinkedHashMap<String, Int> | java.util.LinkedHashMap | x    |
| sortedMapOf()  | java.util.SortedMap<String, Int>     | java.util.TreeMap       | x    |
created:: 2026-04-13T00:00:00+09:00
