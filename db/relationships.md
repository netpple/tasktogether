# Database Relationships and Table Roles

## 1. 핵심 흐름

### 사용자 → 도메인
- `TIMECLOUD_DOMAIN_USER.N_USER_IDX -> TIMECLOUD_USER.N_IDX`
- `TIMECLOUD_DOMAIN_USER.N_DOMAIN_IDX -> TIMECLOUD_DOMAIN.N_IDX`

사용자는 하나 이상의 도메인에 속할 수 있는 구조입니다.

### 사용자 → 태스크
- `TIMECLOUD_TASK.N_OWNER_IDX -> TIMECLOUD_USER.N_IDX`

태스크의 담당자/소유자를 의미합니다.

### 태스크 → 태스크(계층)
- `TIMECLOUD_TASK.N_PARENT_IDX -> TIMECLOUD_TASK.N_IDX`
- `TIMECLOUD_TASK.N_LIST -> 최상위 루트 태스크 N_IDX`

즉, 단일 태스크가 아니라 **트리 구조**입니다.

### 태스크 → 액티비티/피드백/파일/참조자
- `TIMECLOUD_ACTIVITY.N_TASK_IDX -> TIMECLOUD_TASK.N_IDX`
- `TIMECLOUD_FEEDBACK.N_TASK_IDX -> TIMECLOUD_TASK.N_IDX`
- `TIMECLOUD_FILE.N_TASK_IDX -> TIMECLOUD_TASK.N_IDX`
- `TIMECLOUD_OBSERVER.N_TASK_IDX -> TIMECLOUD_TASK.N_IDX`

태스크를 중심으로 협업 데이터가 붙습니다.

### 태스크 → 프로젝트
- `TIMECLOUD_PROJECT.N_TASK_IDX -> TIMECLOUD_TASK.N_IDX`

실제 사용 쿼리상 프로젝트는 보통 **최상위 태스크**에 연결됩니다.

## 2. 협업 테이블 역할

### TIMECLOUD_ACTIVITY
- 일정성 데이터
- 시작/종료 일시 포함
- 캘린더 화면의 주 데이터 소스

### TIMECLOUD_FEEDBACK
- 댓글/대화 로그
- 태스크 상세/피드백 화면의 주 데이터 소스

### TIMECLOUD_FILE
- 첨부파일 메타데이터
- 파일명, 저장명, 확장자, 크기, 다운로드 수
- 실제 바이너리 파일은 `repos/*/files` 아래 저장되는 구조였음

### TIMECLOUD_OBSERVER
- 참조자(CC) 목록
- 태스크에 참여/열람해야 하는 사용자 관계

## 3. 즐겨찾기/알림의 참조 방식

### TIMECLOUD_FAVORITE
주요 컬럼:
- `V_TBL_NM`
- `N_TBL_IDX`
- `N_TASK_IDX`

정규 FK 대신, 어떤 종류의 객체를 즐겨찾기했는지 `V_TBL_NM`으로 구분합니다.

### TIMECLOUD_NOTIFICATION
주요 컬럼:
- `N_CREATOR_IDX`
- `N_OWNER_IDX`
- `V_TBL_NM`
- `N_TBL_IDX`
- `N_TASK_IDX`

알림 역시 특정 테이블/행을 가리키는 폴리모픽 구조입니다.

## 4. 사용자 부가 테이블

### TIMECLOUD_USER_IMAGE
- 사용자 프로필 이미지 메타데이터
- 현재 백업에는 실제 프로필 파일이 `repos/<domain>/profile/<user>.jpg` 형태로 일부 존재

### TIMECLOUD_USER_PARTNER
- 함께 일하는 사용자 관계
- `OWNER -> PARTNER` 구조

### TIMECLOUD_USER_SNSMAP
- SNS/외부 계정 연결 정보

## 5. 팀 구조

### TIMECLOUD_TEAM
- 도메인 내부 팀 정보

### TIMECLOUD_TEAM_USER
- 팀과 사용자 연결 테이블

## 6. 로그

### TIMECLOUD_ACCESSLOG
- 사용자가 어떤 URL에 접근했는지 기록
- 감사/사용 패턴 추적용 로그 테이블

## 7. 기본키 참고

Oracle에서 확인된 주요 PK:
- `TIMECLOUD_USER(N_IDX)`
- `TIMECLOUD_TASK(N_IDX)`
- `TIMECLOUD_PROJECT(N_IDX)`
- `TIMECLOUD_ACTIVITY(N_IDX)`
- `TIMECLOUD_FILE(N_IDX)`
- `TIMECLOUD_USER_IMAGE(N_IDX)`
- `TIMECLOUD_DOMAIN(N_IDX)`
- `TIMECLOUD_TEAM(N_IDX)`
- 복합 PK:
  - `TIMECLOUD_DOMAIN_USER(N_DOMAIN_IDX, N_USER_IDX)`
  - `TIMECLOUD_TEAM_USER(N_USER_IDX, N_TEAM_IDX)`
  - `TIMECLOUD_USER_PARTNER(N_OWNER_IDX, N_PARTNER_IDX)`
  - `TIMECLOUD_USER_SNSMAP(N_OWNER_IDX, C_SNS_TYPE)`
  - `TIMECLOUD_OBSERVER(N_OWNER_IDX, N_TASK_IDX)`
  - `TIMECLOUD_FAVORITE(N_OWNER_IDX, V_TBL_NM, N_TBL_IDX)`

## 8. 주의사항
- 실제 FK 제약이 약하므로, 관계는 앱 쿼리와 컬럼 의미를 통해 해석해야 합니다.
- 레거시 DDL(`legacy-schema.sql`)과 현재 import된 스키마(`schema-summary.md`) 사이에 컬럼 차이가 존재합니다.
