-- ===========================================
-- HANDS-ON 3 - TASK 3
-- PostgreSQL
-- ===========================================

------------------------------------------------------------
-- Step 44: Create a function to enroll a student
------------------------------------------------------------

CREATE OR REPLACE FUNCTION enroll_student(
    p_student_id INT,
    p_course_id INT
)
RETURNS VOID
LANGUAGE plpgsql
AS
$$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM enrollments
        WHERE student_id = p_student_id
          AND course_id = p_course_id
    ) THEN
        RAISE NOTICE 'Student is already enrolled in this course.';
    ELSE
        INSERT INTO enrollments
        (student_id, course_id, enrollment_date, grade)
        VALUES
        (p_student_id, p_course_id, CURRENT_DATE, NULL);

        RAISE NOTICE 'Enrollment completed successfully.';
    END IF;
END;
$$;

-- Execute the function
SELECT enroll_student(2, 4);

------------------------------------------------------------
-- Step 45: Transaction with COMMIT
------------------------------------------------------------

BEGIN;

UPDATE professors
SET salary = salary + 5000
WHERE department_id = 1;

COMMIT;

------------------------------------------------------------
-- Step 46: Transaction with ROLLBACK
------------------------------------------------------------

BEGIN;

UPDATE professors
SET salary = salary - 3000
WHERE department_id = 1;

ROLLBACK;

------------------------------------------------------------
-- Step 47: Transaction using SAVEPOINT
------------------------------------------------------------

BEGIN;

UPDATE professors
SET salary = salary + 2000
WHERE professor_id = 1;

SAVEPOINT salary_update;

UPDATE professors
SET salary = salary + 1000
WHERE professor_id = 2;

ROLLBACK TO SAVEPOINT salary_update;

COMMIT;