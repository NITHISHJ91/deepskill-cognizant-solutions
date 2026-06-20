-- ===========================================
-- HANDS-ON 3 - TASK 2
-- PostgreSQL (Corrected)
-- ===========================================

-- Step 39: Create Student Enrollment Summary View

CREATE OR REPLACE VIEW vw_student_enrollment_summary AS
SELECT
    s.student_id,
    s.first_name || ' ' || s.last_name AS full_name,
    d.dept_name,
    COUNT(e.enrollment_id) AS total_courses,
    ROUND(
        AVG(
            CASE
                WHEN e.grade = 'A' THEN 4
                WHEN e.grade = 'B' THEN 3
                WHEN e.grade = 'C' THEN 2
                WHEN e.grade = 'D' THEN 1
                WHEN e.grade = 'F' THEN 0
            END
        ),
        2
    ) AS gpa
FROM students s
JOIN departments d
ON s.department_id = d.department_id
LEFT JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY
    s.student_id,
    s.first_name,
    s.last_name,
    d.dept_name;

------------------------------------------------------------

-- Step 40: Create Course Statistics View

CREATE OR REPLACE VIEW vw_course_stats AS
SELECT
    c.course_name,
    c.course_code,
    COUNT(e.enrollment_id) AS total_enrollments,
    ROUND(
        AVG(
            CASE
                WHEN e.grade = 'A' THEN 4
                WHEN e.grade = 'B' THEN 3
                WHEN e.grade = 'C' THEN 2
                WHEN e.grade = 'D' THEN 1
                WHEN e.grade = 'F' THEN 0
            END
        ),
        2
    ) AS average_gpa
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY
    c.course_id,
    c.course_name,
    c.course_code;

------------------------------------------------------------

-- Step 41: Display students with GPA greater than 3.0

SELECT *
FROM vw_student_enrollment_summary
WHERE gpa > 3.0;

------------------------------------------------------------

-- Step 42: PostgreSQL Correct Method
-- Update the base table instead of the view

UPDATE students
SET
    first_name = 'Test',
    last_name = 'User'
WHERE student_id = 1;

-- Verify through the view

SELECT *
FROM vw_student_enrollment_summary
WHERE student_id = 1;

------------------------------------------------------------

-- Step 43: Drop the views

DROP VIEW IF EXISTS vw_course_stats;

DROP VIEW IF EXISTS vw_student_enrollment_summary;