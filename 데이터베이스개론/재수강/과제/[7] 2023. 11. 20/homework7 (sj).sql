r--����
--���� �غ�
--STUDENT���̺��� NAME = '������'�� 2���̹Ƿ�, �� ���� '������2'�� ����
UPDATE STUDENT
SET NAME = '������'
WHERE STU_ID = '1292301';
--����
select *from student;

--Student ���̺��� name �ʵ忡�� �ߺ��� �̸��� ������ �ʵ���,
--s_name_unique��� ������ �����غ���.
alter table student
add constraint s_name_unique
unique (name);

--������ constraint�� Ȯ���غ���.
select constraint_name, table_name from user_constraints
where table_name = 'STUDENT';

--���� ���� ��, ���� �̸��� �л� ���ڵ带 �ϳ� �����غ���
--(constraint ���� �޽��� Ȯ���Ѵ�)
insert into student
values('1299999', '990101-1234567', '������', 3, '����', '920');

--������ s_name_unique ������ �����غ���
alter table student
drop constraint s_name_unique;

--������ �̸��� �л� ���ڵ带 �ٽ� �����غ���
insert into student
values('1299999', '990101-1234567', '������', 3, '����', '920');

--�ٽ� s_name_unique ������ �����غ���
--(constraint ���� �߻�. ��?)
alter table student
add constraint s_name_unique
unique (name);

--�ٽ� s_name_unique ������ �����ϸ�,
--�̹� ���̺� '������'�̶�� �̸��� ���� ���ڵ尡 �ֱ� ������
--���� ������ �߻��մϴ�.

--�̴� ������ �߰��� '������' ���ڵ� �����Դϴ�.
--��, ������ ���� ��,
--���� �����͸� Ȯ���Ͽ� ���� ������ �������� ������
--������ ������ �� �����ϴ�.