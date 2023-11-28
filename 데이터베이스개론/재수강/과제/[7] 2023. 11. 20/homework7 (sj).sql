r--과제
--사전 준비
--STUDENT테이블의 NAME = '김현정'이 2명이므로, 한 명은 '김현정2'로 수정
UPDATE STUDENT
SET NAME = '김현정'
WHERE STU_ID = '1292301';
--시작
select *from student;

--Student 테이블의 name 필드에는 중복된 이름이 생기지 않도록,
--s_name_unique라는 제약을 생성해보자.
alter table student
add constraint s_name_unique
unique (name);

--생성된 constraint을 확인해본다.
select constraint_name, table_name from user_constraints
where table_name = 'STUDENT';

--제약 생성 후, 같은 이름의 학생 레코드를 하나 삽입해보자
--(constraint 위반 메시지 확인한다)
insert into student
values('1299999', '990101-1234567', '김현정', 3, '서울', '920');

--생성한 s_name_unique 제약을 삭제해보자
alter table student
drop constraint s_name_unique;

--동일한 이름의 학생 레코드를 다시 삽입해본다
insert into student
values('1299999', '990101-1234567', '김현정', 3, '서울', '920');

--다시 s_name_unique 제약을 생성해보자
--(constraint 위반 발생. 왜?)
alter table student
add constraint s_name_unique
unique (name);

--다시 s_name_unique 제약을 생성하면,
--이미 테이블에 '김현정'이라는 이름을 가진 레코드가 있기 때문에
--제약 위반이 발생합니다.

--이는 기존에 추가한 '김현정' 레코드 때문입니다.
--즉, 제약을 만들 때,
--기존 데이터를 확인하여 제약 조건을 만족하지 않으면
--제약을 생성할 수 없습니다.