# StudyRoom Reservation System 📚

**스터디룸의 효율적 관리와 실시간 예약을 지원하는 웹 플랫폼**

## 🎯 Key Goals
* **효율적 관리**: 온라인 예약 시스템을 통해 스터디룸 자원 관리를 자동화하고 효율성 증대
* **접근성 강화**: 학생들은 언제 어디서나 쉽게 스터디룸을 예약
* **실시간 모니터링**: 관리자는 예약 현황을 실시간으로 확인하고 데이터를 시각화하여 분석


## 🛠 Tech Stack

| Category | Stack |
| :--- | :--- |
| **Language** | Java (JSP), JavaScript, HTML5, CSS3 |
| **Environment** | Eclipse IDE, Apache Tomcat 9.0 |
| **Architecture** | MVC2 (Model-View-Controller) |
| **Database** | MySQL 8.0 |
| **Libraries** | Servlet/JSP, Chart.js |


## 💡 Key Features

### 1. 예약 등록
* **유효성 검증**: JavaScript와 서버(Controller/DB)의 이중 검증을 통해 입력 데이터의 무결성 확보
* **중복 방지**: 예약 신청 시 날짜와 시간대를 체크하여 기존 예약과 겹칠 경우 등록을 차단하고 에러 메시지 표시
* **입력 유지**: 에러 발생 시 사용자가 입력한 데이터를 초기화하지 않고 유지하여 편의성 제공

### 2. 조회 및 검색
* **실시간 조회**: 예약 성공 시 목록이 즉시 갱신되며, 최신순 및 시간순으로 자동 정렬
* **검색 기능**: 예약자 이름 또는 학번을 키워드로 하여 부분 일치(`LIKE`) 검색 지원

### 3. 예약 관리
* **일괄 삭제**: 체크박스를 통해 여러 건의 예약을 선택하고 한 번에 삭제(`DELETE WHERE ID IN (...)`) 가능
* **오작동 방지**: 삭제 버튼 클릭 시 확인(Confirm) 창을 띄워 실수로 인한 데이터 손실 예방

### 4. 통계 시각화
* **Chart.js 연동**: 날짜별 예약 추이(Line Chart)와 시간대별 선호도(Doughnut Chart) 시각화
* **자동 분석**: 최빈값 알고리즘을 통해 "가장 선호하는 요일과 시간대"를 텍스트로 자동 추천


## 🏗 Architecture & DB

### MVC2 Architecture
* **Model**: 데이터 처리 및 비즈니스 로직 담당 (`Reservation`, `ReservationDAO`, `DBUtil`)
* **View**: UI 렌더링 담당 (`JSP`, `CSS`, `JS`)
* **Controller**: 요청 흐름 제어 및 분기 처리 (`ReservationController`)

### Database Design (MySQL)
* **Security**: `PreparedStatement`를 사용하여 SQL Injection 공격 차단
* **Schema**: `reservation` 테이블을 사용하여 예약자 정보, 날짜, 시간, 인원, 목적 등을 관리
    * **Constraints**: 인원 수(2~8명) 제한을 위한 `CHECK` 제약 조건 설정


## 📂 Project Structure

```bash
src/main/
├── java/studyroom/
│   ├── controller/   # Servlet (ReservationController)
│   ├── model/        # DTO (Reservation), DAO (ReservationDAO)
│   └── util/         # DB Connection (DBUtil)
└── webapp/
    ├── css/          # Stylesheets
    ├── js/           # Validation Scripts
    ├── database/     # SQL Scripts (create_table.sql)
    └── WEB-INF/      # Configuration
    ├── main.jsp      # Main Layout
    ├── reserveForm.jsp
    ├── listReserve.jsp
    └── chartReserve.jsp
