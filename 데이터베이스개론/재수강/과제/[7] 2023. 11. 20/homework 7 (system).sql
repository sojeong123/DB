--과제
--사전 준비
--c##kim 만들기
create user c##kim identified by 1;
grant connect, resource to c##kim;
connect c##kim;
show user;

--다음의 롤을 만들어보자(system 계정에서)
--class에 대한 select
create role c##sel_class;
--student에 대한 delete
create role c##del_student;

--생성한 롤에 권한을 부여해보자.
grant select on c##kim.class to c##sel_class;
grant delete on c##kim.student to c##del_student;

--생성한 2개의 role을 사용하여 kim에게 권한을 부여해보자(물론 c##kim이다)
--질의 72를 참조하여 앞에서 생성한 2개의 role을 kim에게 부여
grant c##sel_class to c##kim;
grant c##del_student to c##kim;

--role을 통해 부여한 권한을 다시 취소해보자.
--System계정에서 kim으로부터 role을 취소한다.
revoke c##sel_class from c##kim;
revoke c##del_student from c##kim;
revoke resource from c##kim;

show user;