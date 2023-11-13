--������ ���ǿ��� B������ 2�� �̻� ���� �л��� stu_id�� ����غ���
SELECT DISTINCT s.stu_id
FROM student s
JOIN takes t ON s.stu_id = t.stu_id
WHERE t.grade >= 'B'
GROUP BY s.stu_id
HAVING COUNT(t.grade) >= 2;

--������ ���ǿ��� B������ 2�� �̻� ���� �л��� �̸��� ����غ���(�������� ����)
SELECT DISTINCT s.name
FROM student s
JOIN takes t ON s.stu_id = t.stu_id
WHERE t.grade >= 'B'
GROUP BY s.stu_id, s.name
HAVING COUNT(t.grade) >= 2;

--2012�⵵�� ������ 2�� �̻� �þҴ� �������� ����غ���(������ �������� ����)
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