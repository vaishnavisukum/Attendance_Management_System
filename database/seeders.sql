-- Data Seeding for Attendance Management System

USE `attendance_management_system`;

-- Insert sample roles
INSERT INTO `roles` (`role_name`) VALUES
('Admin'),
('Faculty'),
('Student'),
('Dept Head');

-- Insert sample users
-- Passwords hashed with PASSWORD_DEFAULT (placeholder 'password')
INSERT INTO `users` (`name`, `email`, `password_hash`, `role_id`, `status`) VALUES
('Admin User', 'admin@example.com', '$2y$10$hashedpassword', 1, 1),
('John Faculty', 'faculty1@example.com', '$2y$10$hashedpassword', 2, 1),
('Jane Dept Head', 'depthead@example.com', '$2y$10$hashedpassword', 4, 1),
('Alice Student', 'student1@example.com', '$2y$10$hashedpassword', 3, 1),
('Bob Student', 'student2@example.com', '$2y$10$hashedpassword', 3, 1),
('Charlie Student', 'student3@example.com', '$2y$10$hashedpassword', 3, 1),
('David Student', 'student4@example.com', '$2y$10$hashedpassword', 3, 1),
('Eve Student', 'student5@example.com', '$2y$10$hashedpassword', 3, 1),
('Frank Student', 'student6@example.com', '$2y$10$hashedpassword', 3, 1),
('Grace Student', 'student7@example.com', '$2y$10$hashedpassword', 3, 1);

-- Insert sample departments
INSERT INTO `departments` (`dept_name`) VALUES
('Computer Science'),
('Electronics'),
('Mechanical');

-- Insert sample courses
INSERT INTO `courses` (`course_name`, `dept_id`) VALUES
('B.Tech CS', 1),
('B.Tech ECE', 2),
('B.Tech ME', 3);

-- Insert sample subjects
INSERT INTO `subjects` (`subject_name`, `code`, `dept_id`, `faculty_id`) VALUES
('Data Structures', 'CS101', 1, NULL),
('Algorithms', 'CS102', 1, NULL),
('Digital Electronics', 'EC101', 2, NULL),
('Thermodynamics', 'ME101', 3, NULL);

-- Insert sample students
INSERT INTO `students` (`user_id`, `course_id`, `dept_id`, `enrollment_number`) VALUES
(4, 1, 1, 'STU001'),
(5, 1, 1, 'STU002'),
(6, 1, 1, 'STU003'),
(7, 1, 1, 'STU004'),
(8, 1, 1, 'STU005'),
(9, 2, 2, 'STU006'),
(10, 3, 3, 'STU007');

-- Insert sample faculty
INSERT INTO `faculty` (`user_id`, `dept_id`, `employee_id`) VALUES
(2, 1, 'FAC001');

-- Insert sample attendance records
INSERT INTO `attendance` (`student_id`, `subject_id`, `date`, `status`, `reason`) VALUES
(1, 1, '2026-01-01', 'Present', NULL),
(1, 1, '2026-01-02', 'Present', NULL),
(1, 1, '2026-01-03', 'Late', 'Traffic'),
(1, 2, '2026-01-01', 'Present', NULL),
(1, 2, '2026-01-02', 'Absent', 'Sick'),
(2, 1, '2026-01-01', 'Present', NULL),
(2, 1, '2026-01-02', 'Present', NULL),
(2, 2, '2026-01-01', 'Late', 'Late arrival'),
(3, 1, '2026-01-01', 'Absent', 'Medical leave'),
(4, 2, '2026-01-01', 'Present', NULL),
(5, 1, '2026-01-01', 'Present', NULL);