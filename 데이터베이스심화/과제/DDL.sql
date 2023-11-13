-- �� ���̺� ����
CREATE TABLE �� (
    �����̵� INT PRIMARY KEY,
    ���̸� VARCHAR(50) NOT NULL,
    ���� INT,
    ��� VARCHAR(10) NOT NULL,
    ���� VARCHAR(50),
    ������ INT DEFAULT 0
);

-- ��ǰ ���̺� ����
CREATE TABLE ��ǰ (
    ��ǰ��ȣ INT PRIMARY KEY,
    ��ǰ�� VARCHAR(50),
    ��� INT CHECK (��� >= 0 AND ��� <= 10000),
    �ܰ� INT,
    ������ü VARCHAR(50)
);

-- �ֹ� ���̺� ����
CREATE TABLE �ֹ� (
    �ֹ���ȣ INT PRIMARY KEY,
    �ֹ��� INT,
    �ֹ���ǰ INT,
    ���� INT,
    ����� VARCHAR(100),
    �ֹ����� DATE,
    FOREIGN KEY (�ֹ���) REFERENCES ��(�����̵�),
    FOREIGN KEY (�ֹ���ǰ) REFERENCES ��ǰ(��ǰ��ȣ)
);

SELECT table_name
FROM user_tables;

DROP TABLE ��;
DROP TABLE ��ǰ;

SELECT table_name, column_name, data_type
FROM user_tab_columns;

desc ��
desc ��ǰ
desc �ֹ�

SELECT 
    a.table_name AS ���̺�,
    a.constraint_name AS ��������,
    b.column_name AS �Ӽ�,
    a.constraint_type AS ����,
    c.table_name AS �������̺�,
    d.column_name AS �����÷�
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

