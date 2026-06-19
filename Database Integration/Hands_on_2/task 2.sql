-- ===========================================
-- HANDS-ON 2 - TASK 2
-- PostgreSQL
-- ===========================================

-- Step 20:
-- Retrieve all students enrolled in 2022, ordered by last_name alphabetically.

SELECT *
FROM students
WHERE enrollment_year = 2022
ORDER BY last_name ASC;

------------------------------------------------------------

-- Step 21:
-- Find all courses with more than 3 credits,
-- sorted by credits in descending order.

SELECT *
FROM courses
WHERE credits > 3
ORDER BY credits DESC;

------------------------------------------------------------

-- Step 22:
-- List all professors whose salary is between
-- 80,000 and 95,000.

SELECT *
FROM professors
WHERE salary BETWEEN 80000 AND 95000;

------------------------------------------------------------

-- Step 23:
-- Find all students whose email ends with '@college.edu'.

SELECT *
FROM students
WHERE email LIKE '%@college.edu';

------------------------------------------------------------

-- Step 24:
-- Count the total number of students per enrollment year.

SELECT
    enrollment_year,
    COUNT(*) AS total_students
FROM students
GROUP BY enrollment_year
ORDER BY enrollment_year;