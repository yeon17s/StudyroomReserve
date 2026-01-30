CREATE DATABASE IF NOT EXISTS studyroomdb 
DEFAULT CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE studyroomdb;

DROP TABLE IF EXISTS reservation;

CREATE TABLE reservation (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	student_id VARCHAR(20) NOT NULL,
	date DATE NOT NULL,
	time_slot VARCHAR(20) NOT NULL,
	people INT NOT NULL CHECK (people BETWEEN 2 AND 8),
	purpose TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='스터디룸 예약 정보';

-- 기본 데이터 입력
INSERT INTO reservation (name, student_id, date, time_slot, people, purpose) VALUES 
('박서연', '202202152', '2025-12-05', '11:00-13:00', 5, '팀 프로젝트'),
('안유진', '202209876', '2025-12-07', '15:00-17:00', 6, '웹 프로그래밍 스터디'),
('강나현', '202136475', '2025-12-05', '09:00-11:00', 4, '인공지능 스터디'),
('이원희', '202312345', '2025-12-10', '11:00-13:00', 5, '기말고사 대비');

SELECT * FROM reservation;