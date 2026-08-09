---

type: Note
created: 2025-09-07
published:
author: []
tags:
  - Database/MySQL
  - Database
  - DBMS
source: []
total_page:
description: MySQL 서버의 설치·가동·업그레이드 방법과 시스템 변수 설정, 그리고 엔진 아키텍처 및 스레딩 구조 등 내부 동작 원리를 상세히 정리한 노트입니다.
---

### 날짜 : 2025-09-07

### 태그 : 

### 메모 (한줄평)
>

### (독서) 노트
#### MySQL 설정
- MySQL 서버 디렉토리
	- bin: MYSQL 서버와 클라이언트 프로그램, 그리고 유틸리티를 위한 디렉
	- include:C/C 헤더 파일들이 저장된 디렉터리
	- lib: 라이브러리 파일들이 저장된 디렉터리
	- share: 다양한 지원 파일들이 저장돼 있으며, 에러 메시지나 샘플 설정 파일(my.ini)이 있는 디렉터리
- 기본 설정 파일(etc/my.cnf)을 사용하여 설치
	```linux
	linux> mysqld --defaults-file=/etc/my.cnf --initialize-insecure(비밀번호 없는 root 계정 생성)
	linux> tail -n 4 /var/log/mysqld.log (생성된 계정, 비밀번호 기록된 파일)
	```
- MySQL 서버 가동 및 종료
	```linux
	linux> systemctl start mysqld
	linux> SET GLOBAL innodb_fast_shutdown=0; (클릿 셧다운:커밋된 데이터를 데이터 파일에 적용하고 종료)
	```
	- 백업: 버퍼 풀에 적재 된 데이터 파일의 데이터 페이지 메타 정보를 백업
	- 서버 재시작 시 디스크에서 데이터 파일을 모두 읽어 적재
- MySQL 업그레이드
	- 인플레이스 업그레이드: MySQL 서버의 데이터 파일을 그대로 업그레이드
		- 인접한 메이저 버전간의 업그레이드만 가능(직전 메이저 버전의 데이터 파일과 로그 포맷만 인식하도록 구현)
	- 논리적 업그레이드: mysqldump 도구 등을 이용해 MySQL 서버의 데이터를 SQL 문장이나 텍스트 파일로 덤프 후 새로 업그레이드된 버전의 MySQL 서버에서 덤프된 데이터를 적재
- MySQL 시스템 변수
	- 글로벌 변수: MySQL 서버 인스턴스에서 전체적으로 영향을 미치는 변수(MySQL 서버 자체 관련 설정) ex.) innoDB 버퍼풀 크기, MyISAM 키 캐시 크기
	- 세션 변수:MySQL 클라이언트가 서버에 접하는 옵션의 기본값 제어
	- Both: 세션 변수 가운데 설정 파일에 기본값을 명시해 초기화할 수 있는 변수
	- 정적/동적 변수: 서버 가동 중인 상태에서 변경 가능 여부
		- Both 범위의 시스템변수는 글로벌 시스템 변수 값을 변경해도 커넥션의 세션 변수값 반영 안됨
		- PERSIST 명령은 세션 변수 적용 안됨
		```mysql
			mysql> SET GLOBAL system_var = 500;(현재 동작하는 서버 인스턴스에만 반영)
			mysql> SET PERSIST system_var = 500; (별도의 설정파일에도 변경사항 기록)
			mysql> RESET PERSIST systemvar;
			
		```

### [[Real MySQL 8.0 (1권)#^130c27|아키텍처]]
##### MySQL 엔진 아키텍처
![](https://velog.velcdn.com/images/klm03025/post/483e71e1-7df5-411c-aec8-33d16fee9958/image.png)
- MySQL 엔진: 클라이언트로부터 접속 및 쿼리 요칭 및 SQL 분석 최적화
- Storage 엔진: 데이터를 디스크 스토리지에 저장 및 조회
- 핸들리 API: 쿼리 실행기에서 데이터 조회 변경 시 요청(작업 횟수 조회: SHOW GLOBAL STATUS LIKE '%Handler%')
##### MySQL 스레딩 구조
![](https://infoqoch.github.io/assets/image/2024-05-11-mysql%20engine%20architecture/2024-05-11-22-02-20.png)

- 포그라운드 스레드: 
	- 접속된 클라이언트 수만큼 할당, 클라이언트 요청 쿼리 처리
	- 커넥션 종료 시 스레드 캐시 혹은 종료
	- 버퍼, 캐시(InnoDB) 혹은 디스크, 인덱스 파일(MyISAM)로부터 데이터 읽기/쓰기 처리
- 백그라운드 스레드
	- 5.5버전 부터 데이터 쓰기/읽기 쓰레드 2개 이상 지정 가능(시스템 변수)
	- 쓰기 작업: 버퍼링 후 일괄 처리 가능(InnoDB)/포그라운드 스레드가 담당(MyISAM)
```mysql
SELECT thread_id, nme, type, processlist_user, processlist_host
FROM performance_schema.threads ORDER BY type, thread_id;//실행 중인 스레드 조회
```
##### 메모리 할당 및 사용구조
![](https://velog.velcdn.com/images/black2code/post/b68efee4-47a2-4f3b-92a8-7b0f95962eeb/image.png)

- 글로벌 메모리 영역: 모든 스레드에 의해 공유되는 메모리  영역
- 로컬 메모리 영역: 클라이언트 스레드가 쿼리를 처리하는데 사용하는 메모리 영역
##### 플러그인 스토리지 엔진 모델
- 핸들러(인터페이스)를 구현하는 엔진들을 플러그인하여 다양한 기능으로 확장 가능
- 활용: 플러그인 형태로 빌드된 스토리지 엔진 라이브러리를 다운로드해서 끼워넣기
- 플러그인 단점(컴포넌트로 개선)
	- 오직 MySQL 서버와 인터페이스할 수 있고, 플러그인끼리는 통신할 수 없음
	- 플러그인은 MySQL 서버의 변수나 함수를 직접 호출하기 때문에 불안전
	- 상호 의존관계를 설정할 수 없어 초기화 어려움
##### 쿼리 실행 구조
![](https://velog.velcdn.com/images%2Frime%2Fpost%2F4ebd860f-7787-4f78-a0aa-0b789f156fc4%2F154495992-9093bdc4-a539-4dc0-9ee1-e6d35a726d60.png)
- 쿼리 파서: 쿼리를 토큰으로 분리해 트리 형태의 구조로 변환 작업(기본 문법 오류 감지)
- 전처리기: 생성된 트리 기반 쿼리에 구조적인 문제점 확인, 토큰을 테이블명, 칼럼명, 내장 함수와 같은 개체 매핑(존재 여부, 접근 권한 확인)
- 옵티마이저: 쿼리를 저렴한 비용으로 빠르게 처리하는 방식 결정
- 실행 엔진: 

### 생각 (질문)
- 

### 출처 (인물)
- 

### 연결 (이유)
- 
created:: 2026-04-10T00:00:00+09:00
