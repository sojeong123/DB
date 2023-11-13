select * from student;
select * from course;
select * from class;
select * from takes;
select * from professor;

--151 : ����
--������ ������ �л� ���� ����� ����.
select grade, count(*) from takes group by grade;
select grade, count(stu_id) from takes group by grade;
--A�� 2�� ���� �л� ���� ���ܵ�. A�� ���� �л���.
select grade, count(distinct stu_id) from takes group by grade;
--������� �ش� ������ ������ ��ü ������ ����غ���.
select professor.name, sum(credit)
from course, class, professor
where course.course_id = class.course_id
and class.prof_id = professor.prof_id
group by professor.prof_name;

--���� ���
select professor.name, sum(course.credit)
from professor, class, course
where professor.prof_id = class.prof_id
and class.course_id = course.course_id
group by professor.name
order by professor.name;

--153
--Having�� �����Լ��� �����ϴ�.
select d.dept_name, count(*) �л���
from department d, student s
where s.dept_id = d.dept_id
group by d.dept_name
having count(*) >= 3;

--156
--����
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
--(�߿�) �����Ǵ� �ܺ������� from���̳� where���� ��ġ

--161
--163
--���� ���� �б��� ������ ������ �̸��� ���ӳ⵵�� ���
-- <=all ���
select professor.name, professor.year_emp
from professor
where year_emp <= all(select year_emp from professor);
-- in ���
select name
from professor
where year_emp
in (select min(year_emp) from professor);

--�ǽ�6 : exist�� ���迡 �� ����.

--164
commit;
select name, year from student;
update student s set s.year = s.year+1 where s.dept_id in
(select dept_id from department where dept_name = '��ǻ�Ͱ��а�');
select name, year from student;
rollback;
select name, year from student;


