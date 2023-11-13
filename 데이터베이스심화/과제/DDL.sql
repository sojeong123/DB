-- 고객 테이블 생성
CREATE TABLE 고객 (
    고객아이디 INT PRIMARY KEY,
    고객이름 VARCHAR(50) NOT NULL,
    나이 INT,
    등급 VARCHAR(10) NOT NULL,
    직업 VARCHAR(50),
    적립금 INT DEFAULT 0
);

-- 제품 테이블 생성
CREATE TABLE 제품 (
    제품번호 INT PRIMARY KEY,
    제품명 VARCHAR(50),
    재고량 INT CHECK (재고량 >= 0 AND 재고량 <= 10000),
    단가 INT,
    제조업체 VARCHAR(50)
);

-- 주문 테이블 생성
CREATE TABLE 주문 (
    주문번호 INT PRIMARY KEY,
    주문고객 INT,
    주문제품 INT,
    수량 INT,
    배송지 VARCHAR(100),
    주문일자 DATE,
    FOREIGN KEY (주문고객) REFERENCES 고객(고객아이디),
    FOREIGN KEY (주문제품) REFERENCES 제품(제품번호)
);

SELECT table_name
FROM user_tables;

DROP TABLE 고객;
DROP TABLE 제품;

SELECT table_name, column_name, data_type
FROM user_tab_columns;

desc 고객
desc 제품
desc 주문

SELECT 
    a.table_name AS 테이블,
    a.constraint_name AS 제약조건,
    b.column_name AS 속성,
    a.constraint_type AS 유형,
    c.table_name AS 참조테이블,
    d.column_name AS 참조컬럼
FROM 
    user_constraints a
JOIN 
    user_cons_columns b 
    ON a.constraint_name = b.constraint_name 
    AND a.owner = b.owner
LEFT JOIN 
    user_constraints c 
    ON a.r_constraint_name = c.constraint_name 
    AND a.r_owner = c.owner
LEFT JOIN 
    user_cons_columns d 
    ON c.constraint_name = d.constraint_name 
    AND c.owner = d.owner
WHERE 
    a.constraint_type IN ('P', 'R');

