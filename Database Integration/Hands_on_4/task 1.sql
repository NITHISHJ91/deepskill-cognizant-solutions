-- ===========================================
-- HANDS-ON 4 - TASK 1
-- PostgreSQL
-- ===========================================

-- Step 48: Display the execution plan

EXPLAIN
SELECT
    s.first_name,
    s.last_name,
    c.course_name
FROM students s
INNER JOIN enrollments e
ON s.student_id = e.student_id
INNER JOIN courses c
ON e.course_id = c.course_id
WHERE s.enrollment_year = 2022;

------------------------------------------------------------

-- Step 49: Display the actual execution plan

EXPLAIN ANALYZE
SELECT
    s.first_name,
    s.last_name,
    c.course_name
FROM students s
INNER JOIN enrollments e
ON s.student_id = e.student_id
INNER JOIN courses c
ON e.course_id = c.course_id
WHERE s.enrollment_year = 2022;

------------------------------------------------------------

-- Step 50: Verify whether indexes are being used

EXPLAIN ANALYZE
SELECT *
FROM students
WHERE email = 'arjun.mehta@college.edu';

EXPLAIN ANALYZE
SELECT *
FROM courses
WHERE course_code = 'CS101';