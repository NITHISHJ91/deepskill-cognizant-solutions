-- ===========================================
-- HANDS-ON 4 - TASK 2
-- PostgreSQL
-- ===========================================

------------------------------------------------------------
-- Step 51
-- Create a B-Tree index on students.enrollment_year
------------------------------------------------------------

CREATE INDEX idx_students_enrollment_year
ON students (enrollment_year);

------------------------------------------------------------
-- Step 52
-- Create a composite UNIQUE index on
-- enrollments(student_id, course_id)
------------------------------------------------------------

CREATE UNIQUE INDEX idx_enrollments_student_course
ON enrollments (student_id, course_id);

------------------------------------------------------------

------------------------------------------------------------
-- Step 54
-- Re-run EXPLAIN ANALYZE to compare the plan
------------------------------------------------------------

EXPLAIN ANALYZE
SELECT
    s.first_name,
    s.last_name,
    c.course_name
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
JOIN courses c
ON c.course_id = e.course_id
WHERE s.enrollment_year = 2022;

------------------------------------------------------------
-- Step 55
-- Create a partial index for rows where grade IS NULL
------------------------------------------------------------

CREATE INDEX idx_enrollments_null_grade
ON enrollments (student_id)
WHERE grade IS NULL;