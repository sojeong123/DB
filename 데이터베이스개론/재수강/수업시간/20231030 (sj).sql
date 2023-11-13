-- 2023. 10. 30(월)
-- 데이터베이스개론 실습시간

-- 유니온 : 119
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

-- 집계함수 : 129
-- 교수들의 평균 재직연수는 몇 년인가?
select avg(year_emp) from professor;
-- 오류예시 : 집계함수 뒤에 필드명
select avg(year_emp), name from professor;
-- 집계함수 뒤에 집계함수
select avg(year_emp), max(name) from professor;
--> 즉, 집계함수 뒤에 필드명이 오는 것은 안되지만,
--       집계함수 뒤에 집계함수가 오는 것은 가능하다.

-- 130 : 아래의 select문은 모두 같다.
select count(*) from student;
select count(dept_id)from student;
select count(stu_id)from student;
--> *을 사용하는 것이 가장 편리하다.
-- 중복 제거
select count(distinct dept_id) from student;

-- 138 : 컴퓨터공학과 교수 중 가장 최근 임용 년도는?
-- 코드 맞는거 같은데 왜 계속 오류나지....
select max(year_emp)
from department d, professor p
where d.dept_id = p.dept_id and d.dept_name='컴퓨터공학과':

select max(year_emp), min(year_emp)
from department d, professor p
where d.dept_id = p.dept_id and d.dept_name='컴퓨터공학과':

select * from department;
select * from professor;

-- Group By : 140
-- Group By 적용시킨 그룹별로 집계함수를 적용시킴.
-- 아니면 Table이 하나의 그룹이다.
select dept_id, count(*) from student group by dept_id;

select title, credit, year, semester
from course left outer join class
using (course_id) ;

select title, credit, year, semester
from course right outer join class
using (course_id);

-- 과제 : 142
-- 과제 제출할때 create문은 필요없음.
-- 다음과 같은 테이블 A, B를 만들고 레코드를 삽입
-- (name_a, name_b 필드는 varchar2(20) 자료형, id는 int 자료형으로 정의한다)
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


-- 위에서 만든 테이블 A, B에 대해서
-- left outer join, right outer join, full outer join을 수행해 본다 (id 필드 이용).
-- 출력 필드는 name_a, name_b, id순으로 하고, 수행 전에 outer join 결과를 미리 예상하여 적어본다(꼭!!)
-- 과제 제출시 outer join 검색어와 결과만 캡처 (테이블 생성 및 레코드 삽입문은 제출 필요 없음).

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


-- 과제 : 143
-- 교수 테이블에서 “부교수”의 숫자를 출력해보자
select count(*)
from professor
where position = '부교수';

-- Course 테이블을 사용하여 전체 과목 수를 출력해보자
select count(*)
from Course;

-- 2023년을 기준으로, 부교수 수와 그들의 평균 근무년수를 출력해보자
--(출력시 컬럼 명을 “평균근무년수”, “부교수명수”로 한다)
select avg(2023 - year_emp) 평균근무년수, count(*) 부교수명수
from professor
where position = '부교수';

-- 2012년 개설된 class 중에서 최대 등록학생수와 최소 등록학생수를 출력해 보자
select max(enroll), min(enroll)
from class
where year = 2012;

-- 교수 직위(position)와 각 직위에 속하는 교수 수를 출력해 보자
--(group by 사용) - 교재 58참조
select position, count(*)
from professor
group by position;

commit;

-- 비개설 2
select count(distinct c1, course_id) - count(distinct c2, course_id) 비개설 from course c1, class c2;