--����
--���� 194 ������ (���� 72) ����
create or replace view v_takes
as select stu_id, class_id
from takes ;

--"select * from v_takes;"�� �����غ���
select * from v_takes;

--Insert ���� ����Ͽ�, v_takes�� ���ڵ带 �ϳ� �����غ���
--(�л� id�� class id�� �ڽ��� ������ ���� ����)
insert into v_takes values('1292502', 'C101-01');

--���ڵ� ���� �� "select * from v_takes;"�� �����غ���
select * from v_takes;

--"select * from takes where grade is null;"�� ������Ѻ���(�ǹ̸� ������ ����)
select * from takes where grade is null;

--grade�� null���� �л��� �̸��� stu_id�� ���
select s.name, t.stu_id
from student s
join takes t ON s.stu_id = t.stu_id
where t.grade is null;

--�̶�, ��with read only�� �ɼ��� ��� (197 ������ ����)
--v2_takes�� ��with read only�� �ɼ��� �ο��Ͽ� �����Ѵ�.
create or replace view v2_takes
as select stu_id, class_id
from takes
with read only;

--�տ��� �����ߴ� ���ڵ���Թ��� �ٽ� ������ ���� (������ Ȯ��)
insert into v2_takes values('1292502', 'C101-01');

--������ �� ���� view�� �����Ѵ�
drop view v_takes;
drop view v2_takes;


