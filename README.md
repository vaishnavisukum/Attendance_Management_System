# Attendance Management System

A comprehensive web-based attendance management system for educational institutions with role-based access for students, faculty, and administrators.

## Project Structure

```
AMS/
├── index.html                          # Landing Page
├── login.html                          # Login Page
├── error.html                          # Error Page/Modal
├── css/
│   └── style.css                       # Main Stylesheet
├── js/
│   └── (JavaScript files to be added)
├── pages/
│   ├── student/                        # Student Dashboard & Pages
│   │   ├── dashboard.html              # Student Dashboard
│   │   ├── campus-attendance.html      # Campus Attendance with QR Scanner
│   │   ├── subject-attendance.html     # Subject-specific Attendance
│   │   ├── attendance-status.html      # View Attendance Records
│   │   ├── notifications.html          # Student Notifications
│   │   └── profile.html                # Student Profile
│   │
│   ├── faculty/                        # Faculty Dashboard & Pages
│   │   ├── dashboard.html              # Faculty Dashboard
│   │   ├── start-session.html          # Start Attendance Session
│   │   ├── live-qr.html                # Live QR Code Display
│   │   ├── live-monitor.html           # Live Attendance Monitor
│   │   ├── manual-attendance.html      # Manual Attendance Marking
│   │   ├── session-summary.html        # Session Summary & Stats
│   │   ├── notifications.html          # Faculty Notifications
│   │   └── profile.html                # Faculty Profile
│   │
│   └── admin/                          # Admin Dashboard & Pages
│       ├── dashboard.html              # Admin Dashboard
│       ├── attendance-reports.html     # Comprehensive Reports
│       ├── skipped-classes.html        # Skipped Classes Report
│       ├── override-analytics.html     # Manual Override Logs
│       ├── user-management.html        # Manage Users & Departments
│       ├── notifications.html          # Admin Notifications
│       └── profile.html                # Admin Profile
│
└── components/                         # (Reusable components - for future use)
```

## Features

### Landing Page
- Professional introduction to the system
- Quick access to login

### Authentication
- Role-based login (Student, Faculty, Admin)
- Separate dashboards for each role

### Student Portal
- **Campus Attendance**: Scan QR codes to mark campus arrival
- **Subject Attendance**: Mark subject-specific attendance
- **Attendance Status**: View personal attendance records and statistics
- **Notifications**: Receive attendance alerts and updates
- **Profile**: Manage personal information and security settings

### Faculty Portal
- **Start Session**: Create new attendance sessions with QR codes
- **Live QR Display**: Display auto-refreshing QR codes for students
- **Live Monitor**: Real-time monitoring of attendance scans
- **Manual Attendance**: Mark attendance manually for students
- **Session Summary**: View detailed session statistics
- **Notifications**: Receive attendance mismatch alerts
- **Profile**: Manage account information

### Admin Portal
- **Attendance Reports**: 
  - Date-wise reports
  - Subject-wise reports
  - Department-wise reports
- **Skipped Classes Report**: Students who attended campus but skipped classes
- **Override Analytics**: Faculty manual override logs and analysis
- **User Management**: 
  - Manage students
  - Manage faculty
  - Manage departments
- **Notifications**: System alerts and administrative updates
- **Profile**: Administrator account settings

### Common Features (All Roles)
- Responsive Navigation Bar
- Sidebar Menu with Active State
- Dashboard with Statistics
- Profile Management
- Logout Functionality

## Design Features

### Responsive Design
- Mobile-friendly layout
- Tablet and desktop optimized
- Flexible grid system for cards and tables

### User Interface
- Modern gradient color scheme (Purple to Blue)
- Consistent button styling
- Status badges (Present, Absent, Pending)
- Interactive cards and modals
- Data tables with sorting capabilities

### Color Scheme
- Primary: #667eea (Blue-Purple)
- Secondary: #764ba2 (Dark Purple)
- Success: #2ecc71 (Green)
- Danger: #e74c3c (Red)
- Info: #3498db (Light Blue)

## How to Use

1. **Open the landing page**: Open `index.html` in a web browser
2. **Navigate to login**: Click the "Login" button
3. **Select a role**: Choose between Student, Faculty, or Admin
4. **Access the dashboard**: You'll be redirected to the appropriate role-based dashboard

### Test Credentials
You can use any email/password combination for testing as the authentication is frontend-only.

**Test Users:**
- Student role: Access student dashboard
- Faculty role: Access faculty dashboard
- Admin role: Access admin dashboard

## File Descriptions

### Pages

#### Student Pages
- `dashboard.html` - Overview of student features with quick access cards
- `campus-attendance.html` - QR scanner for campus arrival
- `subject-attendance.html` - Subject-specific attendance marking
- `attendance-status.html` - Detailed attendance records and statistics
- `notifications.html` - Alerts and announcements
- `profile.html` - Personal information and security settings

#### Faculty Pages
- `dashboard.html` - Overview of faculty features
- `start-session.html` - Create new attendance sessions
- `live-qr.html` - Display QR code with live statistics
- `live-monitor.html` - Monitor real-time attendance
- `manual-attendance.html` - Mark attendance manually
- `session-summary.html` - Session statistics and reports
- `notifications.html` - System alerts and warnings
- `profile.html` - Faculty information and settings

#### Admin Pages
- `dashboard.html` - System overview with key metrics
- `attendance-reports.html` - Generate and view reports
- `skipped-classes.html` - Analyze skipped class patterns
- `override-analytics.html` - Monitor faculty overrides
- `user-management.html` - Manage all users
- `notifications.html` - System notifications
- `profile.html` - Admin settings

### Styling
- `css/style.css` - Comprehensive stylesheet with:
  - Global styles
  - Layout components (navbar, sidebar, dashboard)
  - Card and table styles
  - Form styles
  - Button variants
  - Status badges
  - Modal styles
  - Responsive breakpoints

## Responsive Breakpoints

- **Desktop**: Full layout (1200px+)
- **Tablet**: Adjusted grid and spacing (768px - 1200px)
- **Mobile**: Single column layout, smaller fonts (max 480px)

## Browser Compatibility

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Future Enhancements

1. **Backend Integration**
   - Connect to REST API
   - Implement actual authentication
   - Database integration

2. **JavaScript Functionality**
   - QR code generation library
   - Real-time data updates
   - Chart library for analytics
   - Calendar components

3. **Additional Features**
   - Dark mode toggle
   - PDF report generation
   - Email notifications
   - SMS alerts
   - Biometric integration
   - Mobile app (React Native/Flutter)

## Notes

- All pages are fully styled and responsive
- Login redirects based on selected role
- Navigation between pages works within each role's section
- Tables and cards are ready for data integration
- Modals can be activated with JavaScript
- Forms are prepared for backend integration

## Getting Started

1. Extract the project files
2. Open `index.html` in your web browser
3. Navigate through the system using the login and dashboard pages
4. Explore each role's features and functionalities

---

**Created**: January 15, 2025
**Version**: 1.0
