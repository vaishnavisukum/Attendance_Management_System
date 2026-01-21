# Database Schema Documentation

## Overview

The Attendance Management System uses a MySQL database to store and manage attendance data for students, faculty, and administrative users. The schema supports multiple roles, departments, subjects, and comprehensive attendance tracking with reporting capabilities.

## Entity-Relationship Diagram (ERD)

### Entities

- **Users**: Core user accounts with authentication details
- **Roles**: User role definitions (Admin, Faculty, Student, Dept Head)
- **Departments**: Academic departments
- **Courses**: Course/class groupings
- **Subjects**: Individual subjects taught
- **Students**: Student-specific information linked to users
- **Faculty**: Faculty-specific information linked to users
- **Attendance**: Daily attendance records
- **Attendance Logs**: Audit trail for attendance changes
- **Attendance Summary**: Computed attendance percentages (optional cache)

### Relationships

- Users belong to Roles (many-to-one)
- Departments contain Courses and Subjects (one-to-many)
- Students and Faculty are Users (one-to-one)
- Attendance links Students, Subjects, and dates (many-to-many via attendance table)
- Attendance Logs reference Attendance and Users

## Table Descriptions

### roles
- `role_id`: Primary key
- `role_name`: Role name (Admin, Faculty, Student, Dept Head)

### users
- `user_id`: Primary key
- `name`: Full name
- `email`: Unique email for login
- `password_hash`: Hashed password
- `role_id`: Foreign key to roles
- `status`: Active/inactive flag

### departments
- `dept_id`: Primary key
- `dept_name`: Department name

### courses
- `course_id`: Primary key
- `course_name`: Course name
- `dept_id`: Foreign key to departments

### subjects
- `subject_id`: Primary key
- `subject_name`: Subject name
- `code`: Unique subject code
- `dept_id`: Foreign key to departments
- `faculty_id`: Foreign key to faculty (nullable)

### students
- `student_id`: Primary key
- `user_id`: Foreign key to users (unique)
- `course_id`: Foreign key to courses (nullable)
- `dept_id`: Foreign key to departments (nullable)
- `enrollment_number`: Unique student ID number

### faculty
- `faculty_id`: Primary key
- `user_id`: Foreign key to users (unique)
- `dept_id`: Foreign key to departments (nullable)
- `employee_id`: Unique employee ID

### attendance
- `attendance_id`: Primary key
- `student_id`: Foreign key to students
- `subject_id`: Foreign key to subjects
- `date`: Attendance date
- `status`: Present/Late/Absent
- `reason`: Optional reason for late/absent

### attendance_logs
- `log_id`: Primary key
- `attendance_id`: Foreign key to attendance (nullable)
- `user_id`: Foreign key to users (who made change)
- `action`: Description of action
- `details`: JSON details

### attendance_summary
- `id`: Primary key
- `student_id`: Foreign key to students
- `subject_id`: Foreign key to subjects
- `total_classes`: Total classes held
- `attended_classes`: Classes attended
- `percentage`: Calculated percentage

## Stored Procedures

### GetStudentAttendanceReport
- **Input**: `student_id` (INT)
- **Output**: Subject-wise attendance percentages
- **Purpose**: Generate individual student reports

### GetDepartmentAttendanceSummary
- **Input**: `dept_id` (INT)
- **Output**: Average attendance per subject in department
- **Purpose**: Department-level analytics

### GetLowAttendanceAlerts
- **Input**: `threshold` (DECIMAL 5,2)
- **Output**: Students with attendance below threshold
- **Purpose**: Identify students needing intervention

## Database Indexes and Optimization

### Indexes Added

1. **attendance.idx_attendance_student_id**
   - **Columns**: `student_id`
   - **Purpose**: Speeds up queries filtering by student (e.g., student dashboard, reports)

2. **attendance.idx_attendance_subject_id**
   - **Columns**: `subject_id`
   - **Purpose**: Improves subject-wise attendance queries

3. **attendance.idx_attendance_date**
   - **Columns**: `date`
   - **Purpose**: Enhances date-based filtering (monthly/yearly reports)

4. **users.idx_users_role_id**
   - **Columns**: `role_id`
   - **Purpose**: Improves queries listing users by role (e.g., all faculty)

### Unique Constraints

- `roles.role_name`: Ensures unique role names
- `users.email`: Unique email addresses
- `subjects.code`: Unique subject codes
- `students.user_id`, `students.enrollment_number`: Unique links
- `faculty.user_id`, `faculty.employee_id`: Unique links
- `attendance(student_id, subject_id, date)`: Prevents duplicate entries

### Foreign Key Rules

- **ON DELETE CASCADE**: For core relationships (users→roles, etc.)
- **ON DELETE SET NULL**: For optional relationships (subjects→faculty)
- **ON UPDATE CASCADE**: Not used; prefer application-level handling

## Performance Considerations

- Indexes optimized for common query patterns
- Unique constraints prevent data integrity issues
- Stored procedures reduce network overhead for complex queries
- Attendance summary table can cache computed values if needed

## Data Seeding

Sample data includes:
- 4 roles
- 10 users (mix of roles)
- 3 departments
- 3 courses
- 4 subjects
- 7 students
- 1 faculty
- Sample attendance records

## Backup and Restore

See `scripts/backup.sql` for detailed procedures using mysqldump, phpMyAdmin, or CLI tools.

## Testing Results

*(Note: Performance testing conducted on development environment)*

- Schema imports successfully in phpMyAdmin
- Stored procedures execute without errors
- Sample queries show proper index usage in EXPLAIN plans
- Execution times: < 100ms for typical report queries with sample data