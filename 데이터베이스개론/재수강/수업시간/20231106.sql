select * from student;
select * from course;
select * from class;
select * from takes;
select * from professor;

--151 : 연습
--학점과 학점별 학생 수를 출력해 보자.
select grade, count(*) from takes group by grade;
select grade, count(stu_id) from takes group by grade;
--A를 2번 맞은 학생 수는 제외됨. A를 맞은 학생수.
select grade, count(distinct stu_id) from takes group by grade;
--교수명과 해당 교수가 강의한 전체 학점을 출력해보자.
select professor.name, sum(credit)
from course, class, professor
where course.course_id = class.course_id
and class.prof_id = professor.prof_id
group by professor.prof_name;

--교수 답안
select professor.name, sum(course.credit)
from professor, class, course
where professor.prof_id = class.prof_id
and class.course_id = course.course_id
group by professor.name
order by professor.name;

--153
--Having은 집계함수가 가능하다.
select d.dept_name, count(*) 학생수
from department d, student s
where s.dept_id = d.dept_id
group by d.dept_name
having count(*) >= 3;

--156
--과제
--1
select distinct student.stu_id, student.name, takes.grade
from student, takes
where takes.grade = 'B'
--group by student.stu_id
having count(*) >= 2;

select student.stu_id
from student, takes
where takes.grade = 'B'
group by student.stu_id
having count(*) >= 2;

select student.name, takes.grade
from student, takes
where takes.grade = 'B'
group by student.stu_id
having count(*) >= 2;

select student.name, takes.grade
from student, takes
where takes.grade = 'B'
order by name;
--2
select student.name
from student, takes
where takes.grade = 'B'
group by student.name
having count(*) >= 2;
--3

--157
--(중요) 부질의는 외부질의의 from절이나 where절에 위치

--161
--163
--가장 빨리 학교에 부임한 교수의 이름과 부임년도를 출력
-- <=all 사용
select professor.name, professor.year_emp
from professor
where year_emp <= all(select year_emp from professor);
-- in 사용
select name
from professor
where year_emp
in (select min(year_emp) from professor);

--실습6 : exist는 시험에 안 나옴.

--164
commit;
select name, year from student;
update student s set s.year = s.year+1 where s.dept_id in
(select dept_id from department where dept_name = '컴퓨터공학과');
select name, year from student;
rollback;
select name, year from student;


