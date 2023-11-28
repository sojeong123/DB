--과제
--교재 194 페이지 (질의 72) 수행
create or replace view v_takes
as select stu_id, class_id
from takes ;

--"select * from v_takes;"를 수행해본다
select * from v_takes;

--Insert 문을 사용하여, v_takes에 레코드를 하나 삽입해보자
--(학생 id와 class id는 자신이 적절히 새로 선택)
insert into v_takes values('1292502', 'C101-01');

--레코드 삽입 후 "select * from v_takes;"를 수행해본다
select * from v_takes;

--"select * from takes where grade is null;"를 수행시켜본다(의미를 생각해 보길)
select * from takes where grade is null;

--grade가 null값인 학생의 이름과 stu_id를 출력
select s.name, t.stu_id
from student s
join takes t ON s.stu_id = t.stu_id
where t.grade is null;

--이때, “with read only” 옵션을 사용 (197 페이지 참조)
--v2_takes를 “with read only” 옵션을 부여하여 생성한다.
create or replace view v2_takes
as select stu_id, class_id
from takes
with read only;

--앞에서 수행했던 레코드삽입문을 다시 수행해 보자 (오류를 확인)
insert into v2_takes values('1292502', 'C101-01');

--생성된 두 개의 view를 삭제한다
drop view v_takes;
drop view v2_takes;


