---
title: "🧪 [Java] Collection toArray 와 Stream toArray 사용법 및 성능 비교"
source: "https://velog.io/@dev_lee/Collection-toArray-%EC%99%80-Stream-toArray-%EC%82%AC%EC%9A%A9%EB%B2%95-%EB%B0%8F-%EC%84%B1%EB%8A%A5-%EB%B9%84%EA%B5%90"
author: []
published:
created: 2025-11-16
description: "Java의 Collection.toArray()와 Stream.toArray() 메서드의 동작 방식을 비교하고, 성능 및 메모리 효율성 측면에서 Collection 방식이 더 유리함을 설명합니다."
tags:
  - Java/Collection
  - Java/Stream
  - Java/Array_Conversion
  - Performance
  - Memory_Efficiency
cover: "https://velog.velcdn.com/images/dev_lee/post/0bcaf5dc-a43f-466c-9354-6cc68760cce4/image.png"
---
[코드레이서](https://velog.io/@dev_lee/posts)

안녕하세요 이서입니다. `Collection` 의 `toArray` 메서드와 `Stream` 의 `toArray` 메서드의 차이에 대해서 알아보고자 해요.🧐

Collection 인터페이스는 toArray 메서드를 구현하도록 하고 있으며, Stream 인터페이스 또한 toArray 메서드를 구현하도록 하고 있어요.

### Collection의 toArray 메서드

Collection 인터페이스는 배열로 변환하는데 사용할 수 있는 toArray 메서드를 제공해요.

1. **`Object[] toArray()`**: 컬렉션의 요소를 **Object** 타입의 배열로 반환해요.
2. **`<T> T[] toArray(T[] a)`**: 기본적으로 매개변수로 들어온 a배열에 Collection에 들어있는 요소를 담아서 a객체를 반환해줘요. 하지만 매개변수로 들어온 *a배열의 길이가 Collection에 들어있는 요소의 개수(size)보다 작다면 새로운 배열에 요소를 반환해요.*
	```java
	List<Integer> list = Arrays.asList(1, 2, 3, 4, 5);
	Integer[] myIntegers1 = new Integer[0]; // list의 size보다 작아요.
	Integer[] myIntegers2 = new Integer[list.size()];
	Integer[] integers1 = list.toArray(myIntegers1);
	Integer[] integers2 = list.toArray(myIntegers2);
	System.out.println(myIntegers1 == integers1); // false
	System.out.println(myIntegers2 == integers2); // true
	```

Collection의 toArray는 내부적으로 `System.arraycopy` 를 사용해요. System.arraycopy는 native 코드를 사용하여 성능적으로 우수해요. 뿐만아니라, 내부적으로 `Arrays.copyOf` 사용되어지는데, Arrays.copyOf 또한 내부적으로 System.arraycopy를 사용해서 비슷한 성능을 가져요. 아래의 System.arraycopy와 Arrays.copyOf의 밴치마크 결과에서 확인할 수 있어요.

*Baeldung에서 진행한 System.arraycopy와 Arrays.copyOf의 밴치마크 결과*

```bash
Benchmark                                          (SIZE)  Mode  Cnt        Score       Error  Units
ObjectsCopyBenchmark.arraysCopyOfBenchmark             10  avgt  100        8.535 ±     0.006  ns/op
ObjectsCopyBenchmark.arraysCopyOfBenchmark        1000000  avgt  100  2831316.981 ± 15956.082  ns/op
ObjectsCopyBenchmark.systemArrayCopyBenchmark          10  avgt  100        9.278 ±     0.005  ns/op
ObjectsCopyBenchmark.systemArrayCopyBenchmark     1000000  avgt  100  2826917.513 ± 15585.400  ns/op
PrimitivesCopyBenchmark.arraysCopyOfBenchmark          10  avgt  100        9.172 ±     0.008  ns/op
PrimitivesCopyBenchmark.arraysCopyOfBenchmark     1000000  avgt  100   476395.127 ±   310.189  ns/op
PrimitivesCopyBenchmark.systemArrayCopyBenchmark       10  avgt  100        8.952 ±     0.004  ns/op
PrimitivesCopyBenchmark.systemArrayCopyBenchmark  1000000  avgt  100   475088.291 ±   726.416  ns/op
```

[Performance of System.arraycopy() vs. Arrays.copyOf() | Baeldung](https://www.baeldung.com/java-system-arraycopy-arrays-copyof-performance#4-results)

🚨 *종종 다른 블로그 글에서 Arrays.copyOf의 성능이 System.arraycopy보다 우수하다고(많게는 2배 이상) 작성해 놓은 글이 보이는데 이는 틀린 내용이에요! Arrays.copyOf는 내부적으로 System.arraycopy를 사용하기 때문에 System.arraycopy 보다 성능적으로 크게 우수할 수 없어요.*

### Stream의 toArray 메서드

**Stream** 인터페이스는 스트림의 요소를 배열로 변환하는 **`toArray`** 메서드를 제공해요.

1. `Object[] toArray()`: 컬렉션의 요소를 Object 타입의 배열로 반환해요.
2. `<A> A[] toArray(IntFunction<A[]> generator)`: generator 매개변수를 이용하여 A\[\] 배열을 반환해요.
	```java
	List<Integer> list = Arrays.asList(1, 2, 3, 4, 5);
	Integer[] integers = list.stream().toArray(Integer[]::new);
	```

`list.stream().toArray(Integer[]::new)` 를 수행할 때 해당 메서드는 컬렉션 요소의 개수를 알 수 없어요. 따라서 Stream의 toArray 메서드는 컬렉션의 모든 값을 수집한 다음 배열을 새롭게 생성하여 해당 배열에 복사해요.

따라서 `Stream` 의 `toArray` 메서드는 `Collection` 의 `toArray` 보다 훨씬 느리고 더 많은 메모리를 소비해요. Stream의 `Object[] toArray()` 메서드도 마찬가지예요. 아래의 코드는 Stream의 `Object[] toArray()` 의 구현 코드에요.

```java
// Stream의 Object[] 배열을 반환하는 toArray() 메서드 구현
@Override
public final Object[] toArray() {
    return toArray(Object[]::new);
}
```

## 결론

따라서 단순하게 Collection을 배열로 반환하려 한다면 Stream의 toArray를 사용하기보다, Collection의 toArray를 사용하는 것이 더 효율적이에요.

![](https://velog.velcdn.com/images/dev_lee/post/0bcaf5dc-a43f-466c-9354-6cc68760cce4/image.png)

[![Powered by GraphCDN, the GraphQL CDN](https://i.imgur.com/BMhDSUt.png)](https://graphcdn.io/?ref=powered-by)
