--수강한 강의에서 B학점을 2개 이상 받은 학생의 stu_id를 출력해보자
SELECT DISTINCT s.stu_id
FROM student s
JOIN takes t ON s.stu_id = t.stu_id
WHERE t.grade >= 'B'
GROUP BY s.stu_id
HAVING COUNT(t.grade) >= 2;

--수강한 강의에서 B학점을 2개 이상 받은 학생의 이름을 출력해보자(동명이인 없음)
SELECT DISTINCT s.name
FROM student s
JOIN takes t ON s.stu_id = t.stu_id
WHERE t.grade >= 'B'
GROUP BY s.stu_id, s.name
HAVING COUNT(t.grade) >= 2;

--2012년도에 수업을 2개 이상 맡았던 교수명을 출력해보자(교수도 동명이인 없음)
SELECT DISTINCT P.name AS professor_name
FROM professor P
JOIN class C ON P.prof_id = C.prof_id
WHERE C.year = 2012
GROUP BY P.prof_id, P.name
HAVING COUNT(C.class_id) > 1;

SELECT DISTINCT t.stu_id
FROM takes t
WHERE t.grade = 'B'
GROUP BY t.stu_id
HAVING COUNT(t.grade) >= 2;

SELECT DISTINCT s.stu_id
FROM student s
JOIN takes t ON s.stu_id = t.stu_id
WHERE t.grade >= 'B'
GROUP BY s.stu_id
HAVING COUNT(t.grade) >= 2;


SELECT DISTINCT t.stu_id
FROM takes t
WHERE t.grade = 'B'
GROUP BY t.stu_id
HAVING COUNT(t.stu_id) >= 2;