# TaskTogether Recovery

레거시 **TaskTogether / Timecloud** 백업을 기준으로, 로컬에서 다시 실행할 수 있게 복구한 프로젝트입니다.

## 포함 내용
- `workdir/timecloud/` : 복원된 JSP/Servlet 애플리케이션 소스 및 정적 자산
- `docker/` : Tomcat/Oracle XE 컨테이너 실행 설정
- `docker-compose.yml` : 앱/DB 통합 기동 설정
- `tasktogether_dtd` : 스키마 DDL 참고 파일

## 제외 내용
저장소 용량과 민감한 백업 데이터를 고려해 아래 파일들은 Git에 포함하지 않았습니다.
- `tasktogether.sql`
- `timecloud.dmp`
- `timecloud_fullbackup_20140713.zip`
- `*.pdf`
- `.omx/`

## 실행 방법
### 1. 백업 파일 준비
아래 파일이 프로젝트 루트에 있어야 합니다.
- `timecloud.dmp`
- `timecloud_fullbackup_20140713.zip`

압축 백업은 이미 `workdir/timecloud/`로 풀어 사용 중이며, Oracle import는 `timecloud.dmp`를 사용합니다.

### 2. 컨테이너 실행
```bash
docker compose up --build -d
```

### 3. 접속
- App: http://127.0.0.1:18080/
- Oracle XE: `127.0.0.1:11521` / SID `XE`

### 4. 중지
```bash
docker compose down
```

데이터 볼륨까지 삭제하려면:
```bash
docker compose down -v
```

## 복구/수정 내용
복구 과정에서 아래 문제들을 수정했습니다.
- 구형 Lombok 의존 제거 및 컴파일 가능 상태로 정리
- `task.jsp` 관련 JSP 컴파일 오류 수정
- `calendarAll.jsp` 및 캘린더 계열 문자열 이스케이프 문제 수정
- 공통 알림 패널 렌더링 오류 수정
- `project.jsp` include 누락 및 오타 수정
- 프로필 이미지 경로를 실제 백업 파일명 규칙에 맞게 수정

## 현재 확인된 상태
정상 응답 확인 완료:
- `main.jsp`
- `calendarAll.jsp`
- `feedbackAll.jsp`
- `fileAll.jsp`
- `taskList.jsp`
- `task.jsp`
- `feedback.jsp`
- `file.jsp`
- `project.jsp`
- `observer.jsp`
- `userList.jsp`

## 알려진 제한사항
### 1. 첨부파일 원본 누락
DB에는 첨부파일 메타데이터가 남아 있지만, 백업에 실제 원본 파일(`repos/*/files`)은 거의 포함되지 않았습니다.

즉:
- 첨부파일 목록은 보일 수 있음
- 일부 썸네일은 보일 수 있음
- 실제 원본 다운로드는 실패할 수 있음

### 2. 구형 Oracle/Tomcat 환경
- Oracle XE 11g 기반
- 레거시 JSP/Servlet 구조
- 일부 외부 연동 기능(메일/알림/기타 외부 서비스)은 현재 환경에서 완전 보장되지 않음

## 저장소 목적
이 저장소는 **원본 서비스의 현대화된 재개발본이 아니라**, 백업 기반의 **복구/분석/실행 가능한 보존본**입니다.

## 참고
프로필 이미지는 현재 백업에 포함된 파일 기준으로 복구되어 표시됩니다.
반면 첨부파일 원본은 백업 누락으로 인해 일부 기능 제한이 있습니다.
