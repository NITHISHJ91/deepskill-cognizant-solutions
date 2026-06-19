-- ===========================================
-- HANDS-ON 2 - TASK 4
-- PostgreSQL
-- ===========================================

-- Step 30:
-- Calculate the total number of enrollments per course.
-- Display course_name and enrollment_count.

SELECT
    c.course_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY c.course_id;

------------------------------------------------------------

-- Step 31:
-- Find the average salary of professors per department.
-- Round to 2 decimal places.

SELECT
    d.dept_name,
    ROUND(AVG(p.salary), 2) AS average_salary
FROM departments d
LEFT JOIN professors p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.dept_name
ORDER BY d.department_id;

------------------------------------------------------------

-- Step 32:
-- Find all departments where the total budget exceeds 600000.

SELECT
    dept_name,
    budget
FROM departments
WHERE budget > 600000;

------------------------------------------------------------

-- Step 33:
-- Show the grade distribution for course CS101.

SELECT
    e.grade,
    COUNT(*) AS grade_count
FROM enrollments e
JOIN courses c
ON e.course_id = c.course_id
WHERE c.course_code = 'CS101'
GROUP BY e.grade
ORDER BY e.grade;

------------------------------------------------------------

-- Step 34:
-- Using HAVING, list departments where more than
-- 2 students are enrolled across all courses in that department.

SELECT
    d.dept_name,
    COUNT(DISTINCT e.student_id) AS total_students
FROM departments d
JOIN courses c
ON d.department_id = c.department_id
JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY d.department_id, d.dept_name
HAVING COUNT(DISTINCT e.student_id) > 2
ORDER BY d.department_id;