-- ===========================================
-- HANDS-ON 3 - TASK 1
-- PostgreSQL
-- ===========================================

-- Step 35:
-- Create a view showing student names, department names,
-- and enrollment year.

CREATE OR REPLACE VIEW student_department_view AS
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    d.dept_name,
    s.enrollment_year
FROM students s
JOIN departments d
ON s.department_id = d.department_id;

------------------------------------------------------------

-- Step 36:
-- Display all records from the view.

SELECT *
FROM student_department_view;

------------------------------------------------------------

-- Step 37:
-- Create an index on students(email).

CREATE INDEX idx_students_email
ON students(email);

------------------------------------------------------------

-- Step 38:
-- Create an index on courses(course_code).

CREATE INDEX idx_courses_course_code
ON courses(course_code);

------------------------------------------------------------

-- Step 39:
-- Verify that the indexes exist.

SELECT
    schemaname,
    tablename,
    indexname
FROM pg_indexes
WHERE tablename IN ('students', 'courses');