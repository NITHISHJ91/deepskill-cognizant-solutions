ALTER TABLE students
ADD COLUMN IF NOT EXISTS phone_number VARCHAR(15);

ALTER TABLE courses
ADD COLUMN IF NOT EXISTS max_seats INT DEFAULT 60;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'chk_grade'
    ) THEN
        ALTER TABLE enrollments
        ADD CONSTRAINT chk_grade
        CHECK (grade IN ('A','B','C','D','F') OR grade IS NULL);
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_name = 'departments'
        AND column_name = 'hod_name'
    ) THEN
        ALTER TABLE departments
        RENAME COLUMN hod_name TO head_of_dept;
    END IF;
END $$;

ALTER TABLE students
DROP COLUMN IF EXISTS phone_number;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'students';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'courses';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'departments';