--<실습 6>
--170
--최소 1개의 B학점을 받은 학생의 stu_id
select stu_id
from student
where stu_id
in (select stu_id from takes where grade = 'B');

--최소 1개의 B학점을 받은 학생의 이름
select name
from student
where stu_id
in (select stu_id from takes where grade = 'B');

--최소 1개의 C학점을 받은 학생의 이름
select name
from student
where stu_id
in (select stu_id from takes where grade = 'B');

--최소 1개의 B,C학점을 받은 학생의 이름 (중복없이)
select name
from student
where stu_id
in (select distinct stu_id from takes where grade = 'B' and grade = 'C');



--과제
--교재 194 페이지 (질의 72) 수행
create or replace view v_takes
as select stu_id, class_id
from takes ;

--“select * from v_takes;”를 수행해본다
select * from v_takes;

--Insert 문을 사용하여, v_takes에 레코드를 하나 삽입해 보자
--(학생 id와 class id는 자신이 적절히 새로 선택)
insert into v_takes values('1292502', 'C101-01');
DELETE FROM takes WHERE stu_id = '1292502' AND class_id = 'C101-01';
select * from takes where grade = null;     --(x)
select * from takes where grade is null;    --(o)

--레코드 삽입 후 “select * from v_takes; “를 수행해본다
select * from v_takes;

--서울에 주소를 둔 ‘전자공학과’ 학생 레코드를 삭제

--학생수가 가장 많은 학과의 dept_id 출력 (join 불필요)
select dept_id
from student
group by dept_id
having count(*) >= all (select count(*) from student group by dept_id);