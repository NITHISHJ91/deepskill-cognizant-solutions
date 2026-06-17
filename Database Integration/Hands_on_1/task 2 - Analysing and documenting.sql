-- 1NF:
-- All tables satisfy First Normal Form because every column contains atomic values.
-- No column stores multiple values such as multiple phone numbers in a single field.

-- 2NF:
-- All tables satisfy Second Normal Form because every non-key attribute is fully
-- dependent on the primary key.
-- In the enrollments table, student_id and course_id together form a candidate key,
-- while enrollment_date and grade depend on the complete enrollment.

-- 3NF:
-- All tables satisfy Third Normal Form because there are no transitive dependencies.
-- Department details are stored only in the departments table.
-- The students table stores only department_id instead of dept_name,
-- eliminating redundancy and maintaining normalization.

-- Enrollments Table 3NF Analysis:
-- The enrollments table contains only enrollment-specific attributes.
-- Student and course information are referenced using foreign keys.
-- Therefore, the table satisfies Third Normal Form (3NF).