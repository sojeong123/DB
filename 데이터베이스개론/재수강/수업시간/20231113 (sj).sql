--<�ǽ� 6>
--170
--�ּ� 1���� B������ ���� �л��� stu_id
select stu_id
from student
where stu_id
in (select stu_id from takes where grade = 'B');

--�ּ� 1���� B������ ���� �л��� �̸�
select name
from student
where stu_id
in (select stu_id from takes where grade = 'B');

--�ּ� 1���� C������ ���� �л��� �̸�
select name
from student
where stu_id
in (select stu_id from takes where grade = 'B');

--�ּ� 1���� B,C������ ���� �л��� �̸� (�ߺ�����)
select name
from student
where stu_id
in (select distinct stu_id from takes where grade = 'B' and grade = 'C');



--����
--���� 194 ������ (���� 72) ����
create or replace view v_takes
as select stu_id, class_id
from takes ;

--��select * from v_takes;���� �����غ���
select * from v_takes;

--Insert ���� ����Ͽ�, v_takes�� ���ڵ带 �ϳ� ������ ����
--(�л� id�� class id�� �ڽ��� ������ ���� ����)
insert into v_takes values('1292502', 'C101-01');
DELETE FROM takes WHERE stu_id = '1292502' AND class_id = 'C101-01';
select * from takes where grade = null;     --(x)
select * from takes where grade is null;    --(o)

--���ڵ� ���� �� ��select * from v_takes; ���� �����غ���
select * from v_takes;

--���￡ �ּҸ� �� �����ڰ��а��� �л� ���ڵ带 ����

--�л����� ���� ���� �а��� dept_id ��� (join ���ʿ�)
select dept_id
from student
group by dept_id
having count(*) >= all (select count(*) from student group by dept_id);