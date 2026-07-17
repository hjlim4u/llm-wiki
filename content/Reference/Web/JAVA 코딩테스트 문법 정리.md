---
title: JAVA 코딩테스트 문법 정리
source: https://yejin-code.tistory.com/55
author:
  - cool_code
published: 2024-06-10
created: 2025-11-02
description: 자바(Java)를 이용한 코딩 테스트 준비를 위한 핵심 문법 정리 노트입니다. 형변환, String 및 StringBuilder 사용법, 컬렉션 프레임워크(List, Set, Map), 정렬, Stack, Queue, Math 클래스, Stream API 등 코딩 테스트에 빈번하게 사용되는 자바의 주요 기능과 메서드들을 예제 코드와 함께 체계적으로 요약하고 있습니다.
tags:
  - Java/Coding_Test
  - Java/Syntax
  - Java/Algorithm
  - Algorithm
cover: https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdna%2FJCoFo%2FbtsHS65w0xu%2FAAAAAAAAAAAAAAAAAAAAAB1H9gK8fVMjoWlUKmF6wc44fkc9Y0MWTT-tpagSaSu6%2Fimg.png%3Fcredential%3DyqXZFxpELC7KVnFOS48ylbz2pIh7yKj8%26expires%3D1764514799%26allow_ip%3D%26allow_referer%3D%26signature%3DDvXSpP6C1VC1%252BEy1DSbs%252B05qGug%253D
canvas:
  - "[[JAVA_temp.canvas]]"
JAVA_temp: []
---
#### 형변환

```java
// 1. toString
        // toString은 기본적으로 Object의 메소드임.
        // 모든 Java 클래스는 Object 클래스를 상속하므로, 기본적으로 toString() 메서드를 사용할 수 있습니다.
        
        Integer num = 100;
        System.out.println(num.toString()); // "100"

        Double d = 12.34;
        System.out.println(d.toString()); // "12.34"

        Boolean bool = true;
        System.out.println(bool.toString()); // "true"
    
        char a = 'a'; // Char -> String 변환 
        Character.toString(a); // 위의 참조타입과 달리, 원시타입의 문법 다른거 확인!
        
        // 문자열 -> long 변환 (int 너무 클 때 사용하기)
        long l = Long.ParseLong(str); 

        // 문자 <-> 숫자 변환
        Integer.parseInt("100"); // 문자열 "100"을 숫자 100으로 변환
        Integer.toString(100); // 숫자 100을 문자열 "100"으로 변환\
        int b = Integer.parseInt(10+"");// 근데 toString 안써도 문자열+숫자 하면 숫자를 문자열로 처리하기 때문에 변환 가능함. 
        System.out.println(Integer.parseInt("100"));
        System.out.println(Integer.toString(100)); // -> Character.toString() 도 그렇고 사용법 다 동일해보임
        
        // 진수 변환
        int decimalNumber = 25; // 변환할 10진수

        // 10진수를 2진수로 변환
        String binary = Integer.toBinaryString(decimalNumber);
        System.out.println("2진수: " + binary);

        // 10진수를 8진수로 변환
        String octal = Integer.toOctalString(decimalNumber);
        System.out.println("8진수: " + octal);

        // 10진수를 16진수로 변환
        String hex = Integer.toHexString(decimalNumber);
        System.out.println("16진수: " + hex);
```

#### String

참고) String은 한번 만들어지면 문자 추가, 삭제가 불가하기에 변경이 필요하면 StringBuilder를 사용하자

```java
// 자바 메소드 정리

import java.util.Arrays;

public class MethodArchive {
    public static void main(String[] args) {

    // String 메소드

        String str = "java";

        // 길이 반환
        str.length(); //4
        System.out.println(str.length());

        // 빈 문자열 여부 확인
        str.isEmpty(); // false
        System.out.println(str.isEmpty());

        // 문자 찾기
        str.charAt(0); // 해당하는 인덱스의 문자 반환 -> j
        str.indexOf("a"); // 해당하는 문자의 인덱스 반환 -> 1
        str.lastIndexOf("a"); // 해당하는 문자의 마지막 인덱스 반환 -> 3


        // 문자 자르기
        str.substring(0,2); // 인덱스 0이상 2 미만의 문자열 반환 -> "ja"
        str.substring(2); // 인덱스 2부터 문자열 반환 -> "va"

        // 문자 치환 -> str 자체의 값은 바뀌지 않는다. (= 즉, 값 자체를 저장해야하면 다른 객체에 담아야 함)
        str.replace('a','i'); // 모든 [기존 문자], [바꿀 문자] -> "jivi"
        str.replaceAll(".", "/"); // [정규식],[바꿀문자] -> "////"
        str.replaceFirst("j","a"); // 첫번 째로 등장하는 [기존 문자], [바꿀 문자] -> "aava"
        

        // 문자 동일 여부 판단하기
        /**
         * string은 reference 객체이기 때문에 = 로 비교하면 주소값을 비교하게 된다.
         * 따라서 equals를 사용한다. -> true
          */
        str.equals("java");

        // 문자 비교
        /**
         * str = jbva 면 0
         * str < jbva (사전순으로 str이 앞이면, str - jbva는 음수니까 ~) -1
         * str > jbva (사전순으로 str이 뒤이면, str = jbva는 양수니까 ~) 1
         * str과 jbva가 마지막 문자만 다르면, 마지막 문자의 사전순 차이 반환 -> 지금 보니까 끝 아니라도 사전순 반환해줌
         */
        str.compareTo("jbva"); // -1
        str.compareTo("javc"); // -2

        // 문자 포함 여부 판단
        str.contains("ja");

        // 문자열 분리
        String[] arr1 = str.split(" "); // 공백 기준으로 문자열 분리하여 String[] 배열로 반환 -> arr1 = ["java"]
        String[] arr2 = str.split(""); // 띄어쓰기 없는 문자열 분리하여 String[] 배열로 반환 -> arr2 = ["j", "a", "v", "a"]

        System.out.println(arr1); //이렇게 하면 주소값 출력된다.
		
        // 배열 출력 방법 1 : 반복문
        for (int i = 0; i<arr1.length; i++){
            System.out.println(arr1[i]);
        }

        // for-each문
        for (String value : arr1){
            System.out.println(value);
        }

        // 배열 출력 방법 2 : Arrays.toString
        System.out.println(Arrays.toString(arr1)); // -> arr1.toString() 하면 주소값 나옴.
        // 배열 출력 방법 3: String.join
        String str = String.join('-', arr1); // 구분자 설정 가능
       
        // 문자 앞뒤 공백 제거
        str.trim(); // 문자열 사이의 공백은 제거하지 않는다.
        
        // 문자의 접두어, 접미어 확인하기
        str.startsWith("abc");
        str.endsWith("adc");
    }
}
```

#### StringBuilder

String과 달리 값을 계속 변경할 수 있다.

```java
StringBuilder sb = new StringBuilder();

        // 문자열 추가
        sb.append("java");
        System.out.println(sb); // "java"

        // 특정 인덱스에 문자 삽입
        sb.insert(2,"v"); // 2번 인덱스에 특정 문자 삽입 -> "javva"

        // 문자열 삭제
        sb.delete(0,1); // 0~1 문자열 삭제 -> "avva"

        // 특정 인덱스의 문자열 삭제
        sb.deleteCharAt(0); // "vva"

        // 특정 인덱스의 문자를 변경
        sb.setCharAt(0,'j'); // 특정 인덱스의 '문자 하나'만 변경하는거라 큰따옴표 쓰면 에러남.

        // 문자열 뒤집기
        sb.reverse(); // "avj"

        // 문자열 절대길이 줄이기 (자르기)
        sb.setLength(2); // "av"

        // 문자열 절대길이 늘리기
        sb.setLength(4); // "av  " -> 공백으로 나머지 채워짐
        
        // StringBuilder -> String
        sb.toString();
```

## Collection Framework

다음은 컬렉션 프레임워크에 해당하는 메서드다.

간단하게 컬렉션 프레임워크부터 살펴보자.

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdna%2FJCoFo%2FbtsHS65w0xu%2FAAAAAAAAAAAAAAAAAAAAAB1H9gK8fVMjoWlUKmF6wc44fkc9Y0MWTT-tpagSaSu6%2Fimg.png%3Fcredential%3DyqXZFxpELC7KVnFOS48ylbz2pIh7yKj8%26expires%3D1764514799%26allow_ip%3D%26allow_referer%3D%26signature%3DDvXSpP6C1VC1%252BEy1DSbs%252B05qGug%253D)

Collection Framework

Collection 인터페이스는 List, Set, Queue로 크게 3가지 상위 인터페이스로 분류할 수 있다.

그리고 여기에 Map의 경우 Collection 인터페이스를 상속받고 있지 않지만 Collection으로 분류된다.

#### List

List 인터페이스는 "순서 있는 저장 공간"으로

1. LinkedList
2. Stack
3. Vector
4. ArrayList

의 상위 인터페이스이다.

```java
// List 관련 메소드
        /*
        list 인터페이스는 LinkedList, Stack, Vector, ArrayList => 순서 있는 저장 공간의 상위 인터페이스다.
        업캐스팅
        */
        List<String> list = new ArrayList<>();
        List<String> list2 = new Stack<>();
        List<String> list3 = new Vector<>();
        List<String> list4 = new LinkedList<>();

        // 요소 삽입
        list.add("one");

        // 특정 인덱스에 요소 삽입
        list.add(0,"zero");

        // 리스트 병합 (추가되는 리스트가 뒤로 감)
        List<String> merge_list = new ArrayList<>();
        list.addAll(merge_list);

        // 특정 요소의 첫번째 인덱스 반환
        list.indexOf("zero"); // 0

        // 특정 요소의 마지막 인덱스 반환
        list.lastIndexOf("zero"); //0

        // 특정 인덱스 값 삭제 -> '값' 기준 아님!!
        list.remove(0);
        
        // 특정 '값' 삭제하려면? -> 객체 전달
        list.remove(Integer.valueOf(20)); 

        // 특정 요소의 첫번째 값 삭제
        list.remove("one");

        // 리스트 차집합
        list.removeAll(merge_list); // list에서 merge_list에 있는 값 삭제

        // 리스트 교집합
        list.retainAll(merge_list); // list에서 merge_list에 있는 값을 제외한 모든 값을 삭제

        // 리스트 비우기
        list.clear();

        // 리스트 비었는지 체크 -> String과 똑같음
        list.isEmpty();

        // 리스트 길이
        list.size();

        // 리스트 특정 요소 포함 여부 체크
        list.contains("one");

        // 리스트에 다른 리스트 요소가 전부 포함되어 있는지 여부 체크
        list.containsAll(merge_list);

        // 람다식 사용하여 요소 제거하기
        list.removeIf(x -> x.equals("one")); // 요소가 one이면 제거
        
        // list 출력하기 -> 배열은 바로 출력안되지만 list(+콜렉션 프레임워크)는 다른거 할 필요 없이 바로 출력해도 된다.
        System.out.println(list);
```

#### Array <-> List 변환

보통 Array와 List에서 둘 다 동일한 wrapper 타입을 담고 있다면 서로 변환을 할 때 쉽게 변환할 수 있다.

- Array -> List 변환
	- Arrays.asList(배열명) 를 사용한다.
- List -> Array 변환
	- 리스트명.toArray(); 를 사용한다.

그렇지만 list에는 primitive 타입이 담기지 않기 때문에 primitive타입 array -> list로 바꾸려면,
primitive -> wrapper로 변환하는 작업이 추가로 필요하다.
가장 많이 겪어본 예시는, int Array -> Integer List 로 변환하는 작업이다.
이렇게 변환 과정에서 primitive <-> wrapper 변환도 함께 해야하는 예시도 살펴보자.

- int Array -> Integer List 변환
	- List<Integer> list = Arrays.stream(변환할 배열).boxed().collect(Collectors.toList()); -> ArrayList에 담으면 에러남
	- 아래에서 바로 나오는 Collections 메소드도 있고, 위에서의 Collectors 메소드도 있으니 헷갈리지 말기.
	- Collectors: stream한 요소들을 어떤 식으로 도출할지 지정하는 함수.
- Integer List -> int Array 변환
	- int array\[\] = list.stream().mapToInt(x -> x).toArray();

```java
// Array <-> List 변환

        /*
         1. 문자열 타입 Array -> List로 변환
         Arrays.asList 사용하기. (비슷한 예시로 Arrays.toString() 이 있다.)
         */
        String[] str_arr = {"ah", "jip", "gago", "sipda"};
        List<String> atr_list = new ArrayList<>(Arrays.asList(str_arr));

        /*
         2. List -> 문자열 Array로 변환
         toArray 사용하기. ( list.toArray, Arrays 아님 !!)
         */
        List<String> str_list2 = new ArrayList<>();
        String[] str_arr2 = str_list2.toArray(new String[str_list2.size()]);

        /*
         3. 정수 int 배열 -> List<Integer> 변환
         List는 Integer를 가져야하는데 int -> Integer로 자동 형변환 안됨
         import java.util.*; 만 하면 Collectors가 import 안된다
         import java.util.stream.*; 도 같이 해줘야 함.. (왜지?)
         */
        int[] int_arr = {1,2,3,4};
        //List<Integer> int_list = new ArrayList<>(Arrays.asList(int_arr)); -> int, Integer 자동 캐스팅 x
        List<Integer> list1 = Arrays.stream(arr).boxed().collect(Collectors.toList()); // -> 이렇게 바꾸기 가능
        
        /*
         4. 정수 Integer list -> 정수 int array 변환
         */
        List<Integer> list = new ArrayList<>();
        int int_arr2[] = list.stream().mapToInt(x -> x).toArray();
```

#### Collection 메소드 모음

Collections.sort()와 같은 메서드들이 많은데, 어떤 메서드들이 있는지 알아보자.

그리고 Collection을 상속 받은 하위 인터페이스들은 해당 메서드를 사용할 수 있는데 실제로도 그런지 확인해보자.

**1\. Collection으로 최대, 최솟값 구하기**

List의 하위인터페이스 들에 Collections의 메소드를 적용했다. 당연히도 컴파일 에러가 발생하지 않는다.

```java
// 선언
        int[] array = {1,2,3,4,5};
        List<Integer> array_list = new ArrayList<>(Arrays.asList(1,2,3,4,5)); // arraylist
        List<Integer> list2 = new Vector<>(); //벡터
        List<Integer> list3 = new LinkedList<>(); //linkedList
        List<Integer> list4 = new Stack<>(); // stack

        // 1. 정수형 List 원소 중 최대, 최소값 구하기
        // list의 하위 인터페이스들은 다 collection 메소드를 사용한다.

        // arrayList
        Collections.max(array_list);
        Collections.min(array_list);

        // Vector
        Collections.max(list2);
        Collections.min(list2);

        // linkedList
        Collections.max(list3);
        Collections.min(list3);

        // stack
        Collections.max(list4);
        Collections.min(list4);
```

**2\. 정렬하기**

평소 Collection의 정렬과 Array의 정렬이 헷갈렸기에, 다시 정리해보았다.

알아두어야할 것은, Collection과 Array 모두 '오름차순 정렬'은 비슷하게 작동하지만 내림차순 정렬 시에는 차이가 있었다.

- Collection 자료형의 내림차순 정렬: Collections.sort(콜렉션 자료형, Collections.reverseOrder()); 로 쉽게 정렬 가능
- Array 자료형의 내림차순 정렬
	- 원시타입을 포함한 Array: 원시타입은 내림차순 정렬이 안되기 때문에 참조타입으로 박싱을 해주어야 한다.
		- 1\. 박싱하기: Arrays.stream(array).boxed().sorted(Collections.reverseOrder()).toArray(Integer\[\]::new);
		- 2\. 람다식이나 Collections.reverseOrder() 사용해서 내림차순 정렬하기
			- 2-1. 람다식: Arrays.sort(array, (a,b) -> b-a);
			- 2-2. reverseOrder 사용: Arrays.sort(array, Collections.reverseOrder());

```java
// 2. 정렬하기

        // 2-1. Collection 타입
        Collections.sort(array_list); // 오름차순
        Collections.sort(array_list, Collections.reverseOrder()); // 내림차순 -> Collections.reverseOrder()는 Wrapper 타입만 사용가능하기에, primitive에서 쓰려면 박싱하거나 람다식 사용하기.

        // 2-2. array 타입 오름차순 정렬
        Arrays.sort(array); // 오름차순
		Integer[] boxing_sorted_int = Arrays.stream(array).boxed().sorted(Collections.reverseOrder()).toArray(Integer[]::new);
        // 2-3-1 기존의 int array 타입 내림차순 정렬 -> int배열을 Integer배열로 박싱한다. -> 이 후 reverseOrder 사용하거나 / 람다식을 사용한다.
        Integer[] boxing_int = Arrays.stream(array).boxed().toArray(Integer[]::new); //배열 만드니까 배열 크기 지정해주기
        
        Arrays.sort(boxing_int, Collections.reverseOrder()); // reverseOrder 사용하기
        // Arrays.sort(array, Collections.reverseOrder()); // 박싱 안하면, 원시타입이기에 컴파일 에러남.
        Arrays.sort(boxing_int, (a,b) -> b-a); // null이 없고, 정수 overflow 위험이 없는 경우에만 안전, Comparator.comparingInt((Integer a) -> a).reversed() 권장

        // String 같이 참조타입을 가진 배열의 내림차순 정렬 방법
        String[] str_array = new String[]{"a", "b", "c"};
        Arrays.sort(str_array, Collections.reverseOrder()); //박싱 안해도 된다.
        
        
        // String에서 두 원소 합쳤을 때 큰가? 를 기준으로 내림차순 하는 예시 (머래..)
       Arrays.sort(str_arr, (o1,o2) -> (o2+o1).compareTo(o1+o2));
```

**3\. 기타 다른 Collection 메소드들**

```java
// collection 뒤집기
        Collections.reverse(array_list);
        Collections.reverse(list2); // 하위 인터페이스(이건 벡터)는 다 적용 가능

        // collection 내 원소 갯수 반환
        Collections.frequency(array_list,2); // 원소 2의 개수 몇개?
        System.out.println(Collections.frequency(array_list,2)); // 1 -> 한번 나온다

        // list 내 원소를 이진탐색 이용해 찾기
        Collections.binarySearch(array_list, 2); // 원소 2가 있는 위치(인덱스)? 없으면 (-(insertion point) - 1)
	    Collections.binarySearch(array_list, 2, Collections.reverseOrder());
        
        System.out.println( Collections.binarySearch(array_list, 2)); // 1 -> 1번 위치에 있다.
```

#### Stack

Stack도 list의 하위 인터페이스라서 업캐스팅으로 생성할 수도 있지만, 업캐스팅하면 push와 같이 stack에만 있는 메소드가 작동하지 않는다. 따라서 업캐스팅 하지 않는게 나을 거 같다.

```java
// Stack 관련 메소드
        Stack<Integer> stack = new ArrayDeque<>(); // stack -> 업캐스팅으로 하면 push같은 메서드 작동 안되니까 업캐스팅 하지 말기 (-> push는 stack만 가지고 있는 메서드다)

        // 요소 추가
        stack.push(1);

        // 요소 제거
        stack.pop();

        // 스택 비우기
        stack.clear();

        // 스택 크기 출력
        stack.size();

        // 스택 비어있는지 유무
        stack.empty();

        // 스택에 특정 요소 존재하는지 확인
        stack.contains(1);

        // 스택의 최상단 요소 확인하기 -> pop()은 삭제하는거고 이건 확인하는거임.
        stack.peek();
```

#### Queue

Queue는 LinkedList로 생성한다. 항상 Queue는 저렇게 선언했었고 문제된 적은 없었다. 걍 이해되지 않는다면 걍 외우자;

Queue에서는 요소 추가, 삭제할 때 문제가 발생하면 예외가 발생하거나 false를 리턴하도록 메서드를 다르게 사용할 수 있다.

```java
// Queue 관련 메소드
        Queue<Integer> queue = new LinkedList<>();

        //큐에 요소 추가
        queue.add(1); // 문제상황에서 예외 발생
        queue.offer(2); // 문제상황에서 false 리턴

        // 큐에서 요소 제거(dequeue)
        queue.remove(); // 문제상황에서 예외 발생
        queue.poll(); // 문제 상황에서 null 리턴

        // 큐 비우기
        queue.clear();
        
        // 큐 비었는지 확인하기
        queue.isEmpty();

        // 큐의 최전방 요소 확인
        queue.element(); // 문제 상황에서 예외 발생
        queue.peek(); // 문제 상황에서 null 리턴
        
        // 우선순위 큐
        PriorityQueue<Integer> pq = new PriorityQueue<>((a, b) -> b - a); // 이렇게도 내림차순가능
        PriorityQueue<Integer> pq = new PriorityQueue<>(Collections.reverseOrder()); //우선순위 큐를 내림차순 정렬로 설정한다.
```

#### HashSet

위에까지는 List와 관련된 자료구조들에 대한 메소드 정리였고, 이제는 Set과 관련된 메소드를 알아보자.

- HashSet: 중복 허용 x, 순서 x
- TreeSet: 중복 허용 x, 순서 o, 이진탐색트리 형태로 데이터 저장 -> 정렬 가능.
- LinkedHashSet: 중복 허용 x, (삽입순)
코테 풀 때 나도 주로 중복 없이 데이터를 저장하기 위해 HashSet만 사용했어서 일단 HashSet만 정리해보았다.

```java
// HashSet 관련 메소드

        HashSet<Integer> hs = new HashSet<>();
        HashSet<Integer> hs2 = new HashSet<>();
        Set<Integer> s3 = new HashSet<>(); //업캐스팅

        // 요소 추가
        hs.add(1);

        // 요소 삭제
        hs.remove(1);

        // 차집합
        hs.removeAll(hs2); //hs의 요소 중 hs2와 중복되는 요소 삭제

        // 교집합
        hs.retainAll(hs2); // hs의 요소 중 hs2와 중복된 요소만 남기고 삭제

        // 데이터 초기화
        hs.clear();

        // 사이즈 확인
        hs.size();

        // 특정 요소 포함 여부 확인
        hs.contains(1);

        // 요소 전체 출력
        for (Integer i:hs){ //for-each문
            System.out.println(i);
        }
```
#### TreeSet
```java
	import java.util.*;
	
	public class TreeSetExample {
	    public static void main(String[] args) {
	        TreeSet<Integer> ts = new TreeSet<>();
	        // 값 추가
	        ts.add(5);
	        ts.add(2);
	        ts.add(10);
	
	        // 자동 오름차순 정렬
	        System.out.println(ts); // [2, 5, 10]
	
	        // 중복값 추가 시 무시
	        ts.add(5);
	        System.out.println(ts); // [2, 5, 10]
	
	        // 가장 작은 값, 가장 큰 값
	        System.out.println(ts.first()); // 2
	        System.out.println(ts.last());  // 10
	
	        // 값 삭제
	        ts.remove(5);
	        System.out.println(ts); // [2, 10]
	
	        // 바로 위, 아래 값 찾기
	        ts.lower(5); // 2
	        ts.higher(2); // 10
	
	        // 이중 for문 없이 구간 처리에 용이 (e.g., 바로 앞/뒤 원소 찾기)
	        // 전체 출력
	        for (int value : ts) {
	            System.out.println(value); // 2, 10
	        }
	    }
	}

```
#### HashMap

map은 <key, value> 의 자료구조이다.

set과 비슷한 하위 인터페이스들이 있는데,

- HashMap: value의 중복 허용 o,
- TreeMap: key가 오름차순으로 정렬(기본, comparator를 통해 별도 기준 전달)된다.
- LinkedHashMap: value의 중복 허용 o, key 순서가 존재함. (삽입순)

이다.

마찬가지로 코테에서는 주로 HashMap을 사용했기에 HashMap에 대해 정리해보겠다.

```java
// Map -> key,value 저장
        HashMap<Integer, Integer> hm = new HashMap<>();
        
        // 요소 추가
        hm.put(0,0);
        hm.put(1,1);
        hm.put(2,2);
        
        // 요소 삭제
        hm.remove(1);
        
        // 전체 삭제
        hm.clear();
        
        // key 포함 여부 반환
        hm.containsKey(1);
        
        // value 포함 여부 반환
        hm.containsValue(1);
        
        // value 조회
        hm.get(1);
        
        // getOrDefault : key에 맞는 value 조회하되, 없으면 default값 반환
        hm.getOrDefault(1,0);
        
        // key-value 출력
        // 1. keySet() 메소드 사용
        for(Integer key: hm.keySet()){
            System.out.println(key + hm.get(key));
        }
        
        // 2. entrySet() 메소드 사용
        for(Map.Entry<Integer, Integer> entry : hm.entrySet()){
            System.out.println(entry.getKey() + entry.getValue());
        }
```
#### TreeMap
```java
	import java.util.*;
	
	public class TreeMapExample {
	    public static void main(String[] args) {
	        TreeMap<String, Integer> tm = new TreeMap<>();
	        // 값 추가
	        tm.put("b", 2);
	        tm.put("a", 1);
	        tm.put("c", 3);
	
	        // key 기준 오름차순 자동 정렬
	        System.out.println(tm); // {a=1, b=2, c=3}
	
	        // 특정 key의 value 조회
	        System.out.println(tm.get("b")); // 2
	
	        // 특정 key 삭제
	        tm.remove("a");
	        System.out.println(tm); // {b=2, c=3}
	
	        // key/value 쌍 전체 반복
	        for (Map.Entry<String, Integer> entry : tm.entrySet()) {
	            System.out.println(entry.getKey() + " : " + entry.getValue());
	        }
	
	        // 가장 작은/큰 key
	        System.out.println(tm.firstKey()); // b
	        System.out.println(tm.lastKey());  // c
	
	        // 범위 검색/부분 집합
	        tm.subMap("b", true, "c", true); // {b=2, c=3}
	
	        // 특정 key 바로 이전/다음 key
	        System.out.println(tm.lowerKey("c")); // b
	        System.out.println(tm.higherKey("b")); // c
	    }
	}

```

#### Math

자주쓰는 메소드만 정리.

```java
// abs -> 절댓값 반환
        System.out.println(Math.abs(-1)); // 1

        // 최소, 최댓값
        System.out.println(Math.min(-1,1)); // -1
        System.out.println(Math.max(-1,1)); // 1

        // 소수점 올림, 버림
        System.out.println(Math.round(2.4)); //2 -> round() 는 반올림, 유일하게 '정수' 반환
        System.out.println(Math.round(2.5)); //3

        System.out.println(Math.rint(2.4)); // 2.0 -> rint() 도 반올림, 'double' 반환
        System.out.println(Math.rint(-1.7)); // -2.0

        System.out.println(Math.ceil(-1.3)); // 1.0 -> ceil() 올림, 'double' 반환
        System.out.println(Math.ceil(1.2)); // 2.0

        System.out.println(Math.floor(3.9)); // 3.0 -> floor() 버림, 'double' 반환
        System.out.println(Math.floor(-3.6)); //-4.0

        // 제곱, 제곱근
        System.out.println(Math.sqrt(9)); //3.0 -> sqrt() 는 제곱근 구함
        System.out.println(Math.pow(2,3)); // 8.0 -> pow는 n제곱 구함
        
        // rount() 제외하고는 다 double을 반환하기 때문에 가끔 int로 변환해야할 때도 있다. 
        return (int)Math.pow(a,2); // 이렇게 그냥 캐스팅할 수도 있고,
        return Math.round(Math.pow(a,2)); // 이렇게, 유일하게 정수int 반환하는 round() 쓸 수도있다.
        
        // 정수와 실수끼리 계산하면 실수로 계산 된다. 
        // 소수점 둘째자리 까지 출력 예시
        // 1. Math.round() -> double 출력
        Math.round(value * 100.0) / 100.0; //26.67 - 45.0
        
        Math.round(value * 100.0; // 2667 - 4500 -> 위에서 처럼 나누어줘야한다. 
  
        
        // 2. String.format() 사용 -> String 출력 -> 항상 같은 포맷으로 출력하고 싶을 때
        String.format("%.2f",value); //45.00 -> 원래 같으면 45.0 출력이지만 포맷 유지된다.
```

#### Stream

유용하지만 너무 많아서... 자주 쓰는 것들 정리

+) 스트림으로 바꿔서 print 하는 것도 추가하기 (디버깅 용)

```java
// list <-> array 변환 
// 1. Integer List -> int Array
list.stream().mapToInt(x -> x).toArray(); 

// 2. int Array -> Integer List
Arrays.stream(list).boxed().collect(Collectors.toList()); // -> List를 return하기에 ArrayList로 받지 않기. 

// int array -> Integer Queue 변환
Queue<Integer> queue = Arrays.stream(progresses).boxed().collect(Collectors.toCollection(LinkedList::new)); // 걍 for문 돌리자..
```
