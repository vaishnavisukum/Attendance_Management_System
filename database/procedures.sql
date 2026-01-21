-- Stored Procedures for Attendance Management System

DELIMITER $$

-- Procedure to get student attendance report
-- Input: student_id
-- Output: subject-wise attendance percentage
CREATE PROCEDURE GetStudentAttendanceReport(IN p_student_id INT)
BEGIN
    SELECT
        s.subject_name AS subject,
        COUNT(a.attendance_id) AS total_classes,
        SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS attended_classes,
        ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) / COUNT(a.attendance_id)) * 100, 2) AS percentage
    FROM
        attendance a
    JOIN
        subjects s ON a.subject_id = s.subject_id
    WHERE
        a.student_id = p_student_id
    GROUP BY
        s.subject_id, s.subject_name;
END$$

-- Procedure for department-wise attendance summary
-- Input: dept_id
-- Output: average attendance per subject
CREATE PROCEDURE GetDepartmentAttendanceSummary(IN p_dept_id INT)
BEGIN
    SELECT
        s.subject_name AS subject,
        COUNT(DISTINCT a.student_id) AS total_students,
        COUNT(a.attendance_id) AS total_records,
        ROUND(AVG(CASE WHEN a.status = 'Present' THEN 100 ELSE 0 END), 2) AS avg_attendance_percentage
    FROM
        subjects s
    LEFT JOIN
        attendance a ON s.subject_id = a.subject_id
    WHERE
        s.dept_id = p_dept_id
    GROUP BY
        s.subject_id, s.subject_name;
END$$

-- Procedure for low attendance alert list
-- Input: threshold (e.g., 75.00)
-- Output: list of students with attendance below threshold
CREATE PROCEDURE GetLowAttendanceAlerts(IN p_threshold DECIMAL(5,2))
BEGIN
    SELECT
        st.enrollment_number,
        u.name,
        s.subject_name,
        COUNT(a.attendance_id) AS total_classes,
        SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS attended_classes,
        ROUND((SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) / COUNT(a.attendance_id)) * 100, 2) AS percentage
    FROM
        students st
    JOIN
        users u ON st.user_id = u.user_id
    JOIN
        attendance a ON st.student_id = a.student_id
    JOIN
        subjects s ON a.subject_id = s.subject_id
    GROUP BY
        st.student_id, st.enrollment_number, u.name, s.subject_id, s.subject_name
    HAVING
        percentage < p_threshold;
END$$

DELIMITER ;