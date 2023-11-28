--����
--���� �غ�
--c##kim �����
create user c##kim identified by 1;
grant connect, resource to c##kim;
connect c##kim;
show user;

--������ ���� ������(system ��������)
--class�� ���� select
create role c##sel_class;
--student�� ���� delete
create role c##del_student;

--������ �ѿ� ������ �ο��غ���.
grant select on c##kim.class to c##sel_class;
grant delete on c##kim.student to c##del_student;

--������ 2���� role�� ����Ͽ� kim���� ������ �ο��غ���(���� c##kim�̴�)
--���� 72�� �����Ͽ� �տ��� ������ 2���� role�� kim���� �ο�
grant c##sel_class to c##kim;
grant c##del_student to c##kim;

--role�� ���� �ο��� ������ �ٽ� ����غ���.
--System�������� kim���κ��� role�� ����Ѵ�.
revoke c##sel_class from c##kim;
revoke c##del_student from c##kim;
revoke resource from c##kim;

show user;