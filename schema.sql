
-- schema.sql: the course catalog database schema
-- Drop old tables so the file can be executed repeatedly.
DROP TABLE IF EXISTS enrollments, students, courses;

-- Courses table
CREATE TABLE courses (
    id text PRIMARY KEY,
    title text NOT NULL,
    description text NOT NULL,
    credits integer NOT NULL CHECK (credits > 0),
    is_elective boolean NOT NULL DEFAULT false,
    likes integer NOT NULL DEFAULT 0 CHECK (likes >= 0)
);

-- Students table
CREATE TABLE students (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL CHECK (char_length(name) >= 2),
    email text NOT NULL UNIQUE
);

-- Enrollments table
CREATE TABLE enrollments (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_id text NOT NULL
        REFERENCES courses(id) ON DELETE RESTRICT,
    student_id bigint NOT NULL
        REFERENCES students(id) ON DELETE CASCADE,
    enrolled_at timestamptz NOT NULL DEFAULT now(),
    UNIQUE (course_id, student_id)
);
