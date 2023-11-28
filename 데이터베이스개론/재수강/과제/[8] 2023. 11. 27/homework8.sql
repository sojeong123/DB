--����
--1.
--1���� X������ ���� ���� ����ϴ� ���� ���ν����� �����, �̸� �����Ͻÿ�.

--��� ����
--1���� 100������ �� = 5050
--100�� X(�Է�)�����κ��� ����ϰ�,
--5050�� ���� ��� ������ ��µȴ�.

--����
--Loop ���� ����ؾ��Ѵ�.
--�Ʒ� �ڵ带 ���� (N�� 6�� �Ǹ� loop �� Ż��)
/*
N := 1;
LOOP
    N := N + 1;
    EXIT WHEN N >5;
END LOOP;
*/

/*
--�ؼ�
--1~X������ ���� ����ϰ� ����ϴ� cacalculate_sum ���� ���ν��� ����
CREATE OR REPLACE PROCEDURE calculate_sum (X IN NUMBER) IS
  total_sum NUMBER := 0;        --���� ������ ���� �ʱ�ȭ
BEGIN
  --1���� X������ ���ڸ� �����ϸ� ���� ���
  FOR i IN 1..X LOOP
    total_sum := total_sum + i;     --�� ����
  END LOOP;

  --������
  DBMS_OUTPUT.PUT_LINE('1���� ' || X || '������ �� = ' || total_sum);
END calculate_sum;
/

--���� ���ν��� ȣ���� ���� ������
DECLARE
  X NUMBER := 100;          --�Է°� ����
BEGIN
  calculate_sum(X);         --���� ���ν��� ȣ��
END;
/
*/

--����

--1~X������ ���� ����ϰ� ����ϴ� cacalculate_sum ���� ���ν��� ����
CREATE OR REPLACE PROCEDURE calculate_sum (X IN NUMBER) IS
  total_sum NUMBER := 0;
BEGIN
  FOR i IN 1..X LOOP
    total_sum := total_sum + i;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('1���� ' || X || '������ �� = ' || total_sum);
END calculate_sum;
/

--���� ���ν��� ȣ���� ���� ������
DECLARE
  X NUMBER := 100;
BEGIN
  calculate_sum(X);
END;
/


2.
--�ּҰ��� �Ű������� �Ͽ�,
--�ش� �ּҸ� ���� �л����� year�� 1�� ������Ű��
--���� ���ν����� �ڵ��ϰ� �����Ѵ�.

--���࿹��
--execute add_year('�λ�')

--�ؼ�
/*
CREATE OR REPLACE PROCEDURE add_year(p_address IN VARCHAR2) IS
BEGIN
  -- �ּҰ� �Ű������� ��ġ�ϴ� �л����� year�� 1�� ����
  FOR rec IN (SELECT * FROM student WHERE address = p_address) LOOP
    UPDATE student SET year = rec.year + 1 WHERE stu_id = rec.stu_id;
  END LOOP;

  -- ����� ������ Ŀ��
  COMMIT;

  -- ��� ���
  DBMS_OUTPUT.PUT_LINE(p_address || ' �ּҸ� ���� �л����� year�� 1�� �������׽��ϴ�.');
END add_year;
/

-- ���� ��� '�λ�' �ּҸ� ���� �л����� year�� 1�� ������Ű�� ���
EXECUTE add_year('�λ�');
*/

--����
/*
--�ּҰ��� �Ű������� �Ͽ�, �ش� �ּҸ� ���� �л����� year�� 1�� ������Ű�� ���� ���ν����� �ڵ��ϰ� �����Ѵ�.
CREATE OR REPLACE PROCEDURE add_year(p_address IN VARCHAR2) IS
BEGIN
  FOR rec IN (SELECT * FROM student WHERE address = p_address) LOOP
    UPDATE student SET year = rec.year + 1 WHERE stu_id = rec.stu_id;
  END LOOP;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE(p_address || ' �ּҸ� ���� �л����� year�� 1�� �������׽��ϴ�.');
END add_year;
/

EXECUTE add_year('�λ�');
*/

3.
--���� id�� �Ű������� �Ͽ�,
--�ش� id�� ���� ������ �̸��� �Ҽ� �а��� ����ϴ�
--���� ���ν����� �ڵ��Ͽ� �����Ѵ�.
--���࿹��
--execute prof_name('92001')

--�ؼ�
/*
CREATE OR REPLACE PROCEDURE prof_name (prof_id_param IN VARCHAR2) IS
  v_prof_name VARCHAR2(10);
  v_dept_name VARCHAR2(20);
BEGIN
  -- ���� �̸��� �Ҽ� �а� ��ȸ
  SELECT name, dept_name
  INTO v_prof_name, v_dept_name
  FROM professor p
  JOIN department d ON p.dept_id = d.dept_id
  WHERE p.prof_id = prof_id_param;

  -- ��� ���
  DBMS_OUTPUT.PUT_LINE('���� ID: ' || prof_id_param || ', ���� �̸�: ' || v_prof_name || ', �Ҽ� �а�: ' || v_dept_name);
END prof_name;
/
-- ���� ID�� '92001'�� ������ �̸��� �Ҽ� �а� ���
EXECUTE prof_name('92001');
*/

--����
/*
--���� id�� �Ű������� �Ͽ�, �ش� id�� ���� ������ �̸��� �Ҽ� �а��� ����ϴ� ���� ���ν����� �ڵ��Ͽ� �����Ѵ�.
CREATE OR REPLACE PROCEDURE prof_name (prof_id_param IN VARCHAR2) IS
  v_prof_name VARCHAR2(10);
  v_dept_name VARCHAR2(20);
BEGIN

  SELECT name, dept_name
  INTO v_prof_name, v_dept_name
  FROM professor p
  JOIN department d ON p.dept_id = d.dept_id
  WHERE p.prof_id = prof_id_param;

  DBMS_OUTPUT.PUT_LINE('���� ID: ' || prof_id_param || ', ���� �̸�: ' || v_prof_name || ', �Ҽ� �а�: ' || v_dept_name);
END prof_name;
/
-- ���� ID�� '92001'�� ������ �̸��� �Ҽ� �а� ���
EXECUTE prof_name('92001');
*/