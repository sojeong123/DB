/*
DROP TABLE �а� CASCADE CONSTRAINT;
DROP TABLE �л� CASCADE CONSTRAINT;
--�����ڷ� 9 : SQL-DML
--TEST
--36
--�а� ���̺� ����
CREATE TABLE �а� (
�а��ڵ� CHAR(5) NOT NULL,
�а��� VARCHAR2(40) NOT NULL,
CONSTRAINT �а�_PK PRIMARY KEY (�а��ڵ�)
);

--�л� ���̺� ����
CREATE TABLE �л� (
�̸� VARCHAR2(10),
�й� CHAR(8) NOT NULL,
���� CHAR(5),
������� DATE,
CONSTRAINT �л�_PK PRIMARY KEY (�й�),
CONSTRAINT �л�_FK FOREIGN KEY (����) REFERENCES �а�(�а��ڵ�) ON DELETE SET NULL,
CONSTRAINT ����������� CHECK (�������>TO_DATE('1980-01-01','YYYY-MM-DD'))
);

DESC �а�;
DESC �л�;

SELECT * FROM �а�;
SELECT * FROM �л�;

--37
INSERT ALL
INTO �а� VALUES ('A','�濵����')
INTO �а� VALUES ('B','�����ͻ��̾�')
INTO �а� VALUES ('C','AI')
INTO �а� VALUES ('D','����')
SELECT * FROM DUAL;

INSERT ALL
INTO �л� VALUES ('�ѳ���','K901','A', TO_DATE('2000-10-09', 'YYYY-MM-DD'))
INTO �л� VALUES ('ȫ���','K902','B', TO_DATE('2000-06-01', 'YYYY-MM-DD'))
INTO �л� VALUES ('�̸���','K903','C', TO_DATE('2001-11-02', 'YYYY-MM-DD'))
INTO �л� VALUES ('������','K904','A', TO_DATE('2001-01-03', 'YYYY-MM-DD'))
INTO �л� VALUES ('�ٽ���','K905','B', TO_DATE('2000-02-25', 'YYYY-MM-DD'))
INTO �л� VALUES ('�̷縮','K906','C', TO_DATE('2002-03-04', 'YYYY-MM-DD'))
INTO �л� VALUES ('������','K907','D', TO_DATE('2000-07-06', 'YYYY-MM-DD'))
SELECT * FROM DUAL;

--38
DELETE FROM �а� WHERE �а��ڵ�='D';

UPDATE �а� SET �а���='AI����'
WHERE �а���='AI';
SELECT * FROM �а�;

--39
ALTER TABLE �л� ADD (���� NUMBER(3));

UPDATE �л� SET ���� = 90 WHERE �й� = 'K901';
UPDATE �л� SET ���� = 80 WHERE �й� = 'K902';
UPDATE �л� SET ���� = 95 WHERE �й� = 'K903';
UPDATE �л� SET ���� = 85 WHERE �й� = 'K904';
UPDATE �л� SET ���� = 66 WHERE �й� = 'K905';
UPDATE �л� SET ���� = 55 WHERE �й� = 'K906';
UPDATE �л� SET ���� = 77 WHERE �й� = 'K907';
SELECT * FROM �л�

--40
--<�л�>���̺��� ������ ���ǿ� �����ϴ� ������ ǥ���Ͻÿ�.
--?�̸��� ���̡����� ȸ���� ǥ���Ͻÿ�.
SELECT * FROM �л� WHERE �̸� LIKE '��%';
--������ null�� ȸ���� ǥ���Ͻÿ�.
SELECT * FROM �л� WHERE ���� IS NULL;
--������ 90�� �̻��� ȸ���� �̸�, �й�, ������ ǥ���Ͻÿ�.
SELECT �̸�, �й�, ���� FROM �л� WHERE ���� >= 90;
--������ A, B�� ȸ���� ǥ���Ͻÿ�.
SELECT * FROM �л� WHERE ���� IN ('A', 'B');
--������ �������� �߰��Ͽ� ����ǥ�� �� ǥ�õǰ� �Ͻÿ�. (��. 90->90��)
SELECT �̸�, �й�, ���� || '��' AS ����ǥ�� FROM �л�

--TISSOT WELCOMEEEEEE!!!
*/
/*
--�����ڷ� 10
--STUDENT.SQL���� ���� ��
DESC STUDENT;
DESC DEPT;
--4
SELECT S_NAME, LENGTH(S_NAME) AS ����
FROM STUDENT;

SELECT S_NAME,CONCAT(S_SCORE, '��') AS ����
FROM STUDENT;

--5
--���� �ҹ��ڷ� ���
SELECT LOWER('KorEA') FROM DUAL;
SELECT S_ENGNAME, LOWER(S_ENGNAME) FROM STUDENT;
--���� �빮�ڷ� ���
SELECT UPPER('KorEA') FROM DUAL;
SELECT S_ENGNAME, UPPER(S_ENGNAME) FROM STUDENT;
--ASCII
SELECT ASCII('A'), ASCII('Z')
FROM DUAL;

SELECT CONCAT('KOR','EA��),'KOR' || 'EA' FROM DUAL;
SELECT SUBSTR('internet', 5) FROM DUAL;
SELECT SUBSTR('internet', 5,2) FROM DUAL;

SELECT LENGTH('korea') FROM DUAL;
*/
/*
--10
SELECT LENGTH(' Hello World ') FROM dual;
SELECT LENGTH(LTRIM(' Hello World ')) FROM dual;
SELECT LENGTH(RTRIM(' Hello World ')) FROM dual;
SELECT LENGTH(TRIM(' Hello World ')) FROM dual;
SELECT ' Hello World ' || 'TEST' FROM dual;
SELECT LTRIM('xxxYYZZxYZ') FROM DUAL;
SELECT LTRIM('xxxYYZZxYZ', 'x') FROM DUAL;
SELECT RTRIM('zXXYYzzXYzz','z') FROM DUAL;
*/

--11
SELECT S_NAME,
CONCAT(SUBSTR(S_NAME, 1, LENGTH(S_NAME)-2),'**')
AS RESULT4
FROM STUDENT;

--12
SELECT ABS(-7) FROM DUAL;
SELECT SIGN(-20), SIGN(0), SIGN(10) FROM DUAL;
SELECT MOD(17, 3) FROM DUAL;
SELECT CEIL(18.123), CEIL(-18.123) FROM DUAL;
SELECT FLOOR(18.123), FLOOR(-18.123) FROM DUAL;
SELECT ROUND(18.5235, 3), ROUND(18.5235), ROUND(18.5235, -1) FROM DUAL;
SELECT TRUNC(18.5235, 3), TRUNC(18.5235) FROM DUAL;

--13���� ����.