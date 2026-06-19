-- ===========================================
-- HANDS-ON 2 - TASK 3
-- PostgreSQL
-- ===========================================

-- Step 25:
-- List each student's full name alongside the name of their department.

SELECT
    s.first_name || ' ' || s.last_name AS full_name,
    d.dept_name
FROM students s
INNER JOIN departments d
ON s.department_id = d.department_id;

------------------------------------------------------------

-- Step 26:
-- Show each enrollment along with the student's name and the course name.

SELECT
    e.enrollment_id,
    s.first_name || ' ' || s.last_name AS student_name,
    c.course_name,
    e.enrollment_date,
    e.grade
FROM enrollments e
INNER JOIN students s
ON e.student_id = s.student_id
INNER JOIN courses c
ON e.course_id = c.course_id;

------------------------------------------------------------

-- Step 27:
-- Find all students who are NOT enrolled in any course.

SELECT
    s.student_id,
    s.first_name,
    s.last_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

------------------------------------------------------------

-- Step 28:
-- Display every course along with the number of students enrolled in it.
-- Courses with zero enrollments must also appear.

SELECT
    c.course_name,
    COUNT(e.student_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY c.course_id;

------------------------------------------------------------

-- Step 29:
-- List each department along with its professors and their salaries.
-- Include departments that have no professors.

SELECT
    d.dept_name,
    p.prof_name,
    p.salary
FROM departments d
LEFT JOIN professors p
ON d.department_id = p.department_id
ORDER BY d.department_id;