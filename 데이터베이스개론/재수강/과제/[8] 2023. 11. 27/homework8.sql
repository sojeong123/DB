--과제
--1.
--1부터 X까지의 합을 구해 출력하는 저장 프로시저를 만들고, 이를 수행하시오.

--출력 예시
--1부터 100까지의 합 = 5050
--100은 X(입력)값으로부터 출력하고,
--5050은 합의 결과 값으로 출력된다.

--참고
--Loop 문을 사용해야한다.
--아래 코드를 참조 (N이 6이 되면 loop 문 탈출)
/*
N := 1;
LOOP
    N := N + 1;
    EXIT WHEN N >5;
END LOOP;
*/

/*
--해석
--1~X까지의 합을 계산하고 출력하는 cacalculate_sum 저장 프로시저 생성
CREATE OR REPLACE PROCEDURE calculate_sum (X IN NUMBER) IS
  total_sum NUMBER := 0;        --합을 저장할 변수 초기화
BEGIN
  --1부터 X까지의 숫자를 루프하며 합을 계산
  FOR i IN 1..X LOOP
    total_sum := total_sum + i;     --합 누적
  END LOOP;

  --결과출력
  DBMS_OUTPUT.PUT_LINE('1부터 ' || X || '까지의 합 = ' || total_sum);
END calculate_sum;
/

--저장 프로시저 호출을 통한 결과출력
DECLARE
  X NUMBER := 100;          --입력값 설정
BEGIN
  calculate_sum(X);         --저장 프로시저 호출
END;
/
*/

--제출

--1~X까지의 합을 계산하고 출력하는 cacalculate_sum 저장 프로시저 생성
CREATE OR REPLACE PROCEDURE calculate_sum (X IN NUMBER) IS
  total_sum NUMBER := 0;
BEGIN
  FOR i IN 1..X LOOP
    total_sum := total_sum + i;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('1부터 ' || X || '까지의 합 = ' || total_sum);
END calculate_sum;
/

--저장 프로시저 호출을 통한 결과출력
DECLARE
  X NUMBER := 100;
BEGIN
  calculate_sum(X);
END;
/


2.
--주소값을 매개변수로 하여,
--해당 주소를 가진 학생들의 year를 1씩 증가시키는
--저장 프로시저를 코딩하고 수행한다.

--수행예시
--execute add_year('부산')

--해석
/*
CREATE OR REPLACE PROCEDURE add_year(p_address IN VARCHAR2) IS
BEGIN
  -- 주소가 매개변수와 일치하는 학생들의 year를 1씩 증가
  FOR rec IN (SELECT * FROM student WHERE address = p_address) LOOP
    UPDATE student SET year = rec.year + 1 WHERE stu_id = rec.stu_id;
  END LOOP;

  -- 변경된 내용을 커밋
  COMMIT;

  -- 결과 출력
  DBMS_OUTPUT.PUT_LINE(p_address || ' 주소를 가진 학생들의 year를 1씩 증가시켰습니다.');
END add_year;
/

-- 예를 들어 '부산' 주소를 가진 학생들의 year를 1씩 증가시키는 경우
EXECUTE add_year('부산');
*/

--제출
/*
--주소값을 매개변수로 하여, 해당 주소를 가진 학생들의 year를 1씩 증가시키는 저장 프로시저를 코딩하고 수행한다.
CREATE OR REPLACE PROCEDURE add_year(p_address IN VARCHAR2) IS
BEGIN
  FOR rec IN (SELECT * FROM student WHERE address = p_address) LOOP
    UPDATE student SET year = rec.year + 1 WHERE stu_id = rec.stu_id;
  END LOOP;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE(p_address || ' 주소를 가진 학생들의 year를 1씩 증가시켰습니다.');
END add_year;
/

EXECUTE add_year('부산');
*/

3.
--교수 id를 매개변수로 하여,
--해당 id를 가진 교수의 이름과 소속 학과를 출력하는
--저장 프로시저를 코딩하여 수행한다.
--수행예시
--execute prof_name('92001')

--해석
/*
CREATE OR REPLACE PROCEDURE prof_name (prof_id_param IN VARCHAR2) IS
  v_prof_name VARCHAR2(10);
  v_dept_name VARCHAR2(20);
BEGIN
  -- 교수 이름과 소속 학과 조회
  SELECT name, dept_name
  INTO v_prof_name, v_dept_name
  FROM professor p
  JOIN department d ON p.dept_id = d.dept_id
  WHERE p.prof_id = prof_id_param;

  -- 결과 출력
  DBMS_OUTPUT.PUT_LINE('교수 ID: ' || prof_id_param || ', 교수 이름: ' || v_prof_name || ', 소속 학과: ' || v_dept_name);
END prof_name;
/
-- 교수 ID가 '92001'인 교수의 이름과 소속 학과 출력
EXECUTE prof_name('92001');
*/

--제출
/*
--교수 id를 매개변수로 하여, 해당 id를 가진 교수의 이름과 소속 학과를 출력하는 저장 프로시저를 코딩하여 수행한다.
CREATE OR REPLACE PROCEDURE prof_name (prof_id_param IN VARCHAR2) IS
  v_prof_name VARCHAR2(10);
  v_dept_name VARCHAR2(20);
BEGIN

  SELECT name, dept_name
  INTO v_prof_name, v_dept_name
  FROM professor p
  JOIN department d ON p.dept_id = d.dept_id
  WHERE p.prof_id = prof_id_param;

  DBMS_OUTPUT.PUT_LINE('교수 ID: ' || prof_id_param || ', 교수 이름: ' || v_prof_name || ', 소속 학과: ' || v_dept_name);
END prof_name;
/
-- 교수 ID가 '92001'인 교수의 이름과 소속 학과 출력
EXECUTE prof_name('92001');
*/