-- 2023. 10. 30(��)
-- �����ͺ��̽����� �ǽ��ð�

-- ���Ͽ� : 119
select name from student union select name from professor;
select dept_id from student union select dept_id from department;
select distinct dept_id from student union all select dept_id from department;

-- 122
select title, credit, year, semester
from course, class
where course.course_id = class.course_id;

-- 124
select title, credit, year, semester from course left outer join class using(course_id);

-- 126
select title, credit, year, semester
from course right outer join class
using (course_id)

-- �����Լ� : 129
-- �������� ��� ���������� �� ���ΰ�?
select avg(year_emp) from professor;
-- �������� : �����Լ� �ڿ� �ʵ��
select avg(year_emp), name from professor;
-- �����Լ� �ڿ� �����Լ�
select avg(year_emp), max(name) from professor;
--> ��, �����Լ� �ڿ� �ʵ���� ���� ���� �ȵ�����,
--       �����Լ� �ڿ� �����Լ��� ���� ���� �����ϴ�.

-- 130 : �Ʒ��� select���� ��� ����.
select count(*) from student;
select count(dept_id)from student;
select count(stu_id)from student;
--> *�� ����ϴ� ���� ���� ���ϴ�.
-- �ߺ� ����
select count(distinct dept_id) from student;

-- 138 : ��ǻ�Ͱ��а� ���� �� ���� �ֱ� �ӿ� �⵵��?
-- �ڵ� �´°� ������ �� ��� ��������....
select max(year_emp)
from department d, professor p
where d.dept_id = p.dept_id and d.dept_name='��ǻ�Ͱ��а�':

select max(year_emp), min(year_emp)
from department d, professor p
where d.dept_id = p.dept_id and d.dept_name='��ǻ�Ͱ��а�':

select * from department;
select * from professor;

-- Group By : 140
-- Group By �����Ų �׷캰�� �����Լ��� �����Ŵ.
-- �ƴϸ� Table�� �ϳ��� �׷��̴�.
select dept_id, count(*) from student group by dept_id;

select title, credit, year, semester
from course left outer join class
using (course_id) ;

select title, credit, year, semester
from course right outer join class
using (course_id);

-- ���� : 142
-- ���� �����Ҷ� create���� �ʿ����.
-- ������ ���� ���̺� A, B�� ����� ���ڵ带 ����
-- (name_a, name_b �ʵ�� varchar2(20) �ڷ���, id�� int �ڷ������� �����Ѵ�)
create table A
(name_a varchar2(20),
id int
);

create table B
(name_b varchar2(20),
id int
);

insert into A (name_a,id) values ('James', 300);
insert into A (name_a,id) values ('John', 400);
insert into A (name_a,id) values ('Joon', 500);
insert into A (name_a,id) values ('Jungsu', 600);

insert into B (name_b,id) values ('Duck', 100);
insert into B (name_b,id) values ('Dongho', 200);
insert into B (name_b,id) values ('Duksu', 300);
insert into B (name_b,id) values ('Dooli', 500);


-- ������ ���� ���̺� A, B�� ���ؼ�
-- left outer join, right outer join, full outer join�� ������ ���� (id �ʵ� �̿�).
-- ��� �ʵ�� name_a, name_b, id������ �ϰ�, ���� ���� outer join ����� �̸� �����Ͽ� �����(��!!)
-- ���� ����� outer join �˻���� ����� ĸó (���̺� ���� �� ���ڵ� ���Թ��� ���� �ʿ� ����).

-- Left outer join
SELECT A.name_a, B.name_b, A.id
FROM A
LEFT OUTER JOIN B ON A.id = B.id;

-- Right outer join
SELECT A.name_a, B.name_b, B.id
FROM A
RIGHT OUTER JOIN B ON A.id = B.id;

-- Full outer join
SELECT A.name_a, B.name_b, B.id
FROM A
FULL OUTER JOIN B ON A.id = B.id;


-- ���� : 143
-- ���� ���̺��� ���α������� ���ڸ� ����غ���
select count(*)
from professor
where position = '�α���';

-- Course ���̺��� ����Ͽ� ��ü ���� ���� ����غ���
select count(*)
from Course;

-- 2023���� ��������, �α��� ���� �׵��� ��� �ٹ������ ����غ���
--(��½� �÷� ���� ����ձٹ������, ���α���������� �Ѵ�)
select avg(2023 - year_emp) ��ձٹ����, count(*) �α������
from professor
where position = '�α���';

-- 2012�� ������ class �߿��� �ִ� ����л����� �ּ� ����л����� ����� ����
select max(enroll), min(enroll)
from class
where year = 2012;

-- ���� ����(position)�� �� ������ ���ϴ� ���� ���� ����� ����
--(group by ���) - ���� 58����
select position, count(*)
from professor
group by position;

commit;

-- �񰳼� 2
select count(distinct c1, course_id) - count(distinct c2, course_id) �񰳼� from course c1, class c2;