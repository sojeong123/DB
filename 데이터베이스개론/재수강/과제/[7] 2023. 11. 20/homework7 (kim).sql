--과제
--role이 잘 부여되었는지 확인
--(select문과 delete문 사용하여 확인. c##kim이 수행해야함.)
-- c##sel_class에 대한 select 권한 확인
select * from class;
--c##del_student에 대한 delete 권한 확인
delete from c##kim.takes where stu_id = '1292002';
delete from c##kim.student where stu_id = '1292002';

--취소 후 실제 select문과 delete문이 수행되지 않음을 확인한다.
-- c##sel_class에 대한 select 권한 확인
select * from class;