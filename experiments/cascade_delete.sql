BEGIN;

-- Проверяем количество записей до удаления
SELECT COUNT(*) AS enrollments_before
FROM enrollments;

-- Удаляем студента Daniyar Bekov
DELETE FROM students
WHERE email = 'daniyar@example.com';

-- Проверяем количество записей после удаления
SELECT COUNT(*) AS enrollments_after
FROM enrollments;

-- Отменяем изменения
ROLLBACK;

-- Проверяем, что записи восстановились
SELECT COUNT(*) AS enrollments_after_rollback
FROM enrollments;