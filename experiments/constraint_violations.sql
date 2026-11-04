
-- Constraint violation experiments
-- Run each experiment separately.

-- 1. NULL in a required column
INSERT INTO courses (id, title, description, credits)
VALUES ('x-test', NULL, 'Test', 3);

-- 2. Zero credits
INSERT INTO courses (id, title, description, credits)
VALUES ('x-test', 'Test', 'Test', 0);

-- 3. Negative likes
UPDATE courses
SET likes = -1
WHERE id = 'api-design';

-- 4. Student name that is too short
INSERT INTO students (name, email)
VALUES ('A', 'a@example.com');

-- 5. Duplicate email
INSERT INTO students (name, email)
VALUES ('Dup Student', 'aigerim@example.com');

-- 6. Duplicate course ID
INSERT INTO courses (id, title, description, credits)
VALUES ('api-design', 'x', 'y', 1);

-- 7. Duplicate enrollment
INSERT INTO enrollments (course_id, student_id)
VALUES ('modern-frontend', 1);

-- 8. Nonexistent course
INSERT INTO enrollments (course_id, student_id)
VALUES ('no-such-course', 1);

-- 9. Nonexistent student
INSERT INTO enrollments (course_id, student_id)
VALUES ('web-security', 999);

-- 10. Delete a course with enrollments
DELETE FROM courses
WHERE id = 'modern-frontend';
