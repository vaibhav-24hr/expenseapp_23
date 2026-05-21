# Expense Manager

A full-stack **personal finance and expense tracking** web application built with **Spring Boot, JSP, and MySQL**.
The app enables users to record daily expenses and income, organize transactions by category/sub-category/vendor/payment mode, upload bill receipts, and analyze spending through interactive dashboards. A separate **Admin panel** provides platform-wide analytics and user management.

> Developed as an internship project at **Unnati** during the 8th semester (Final Year) of B.E. at **Gujarat Technological University (GTU)**.

---

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Screens & Modules](#screens--modules)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Clone the Repository](#1-clone-the-repository)
  - [Set up the Database](#2-set-up-the-database)
  - [Configure the Application](#3-configure-the-application)
  - [Run the Application](#4-run-the-application)
- [Default Roles](#default-roles)
- [REST/MVC Endpoints (Selected)](#restmvc-endpoints-selected)
- [Author](#author)
- [License](#license)

---

## Features

### User Module
- **Authentication**
  - Sign up with first name, last name, email, gender, DOB, contact, etc.
  - Login with email & password (session + cookie based).
  - Forgot Password with **OTP sent via email** (Gmail SMTP).
  - Update Password using the received OTP.
  - Logout with session invalidation.
- **Dashboard**
  - Monthly transactions, monthly expense, monthly income, daily expense.
  - Growth ratios vs previous day / month.
  - Bar chart: monthly expense trend.
  - Bar chart: monthly income trend.
  - Pie chart: status of transactions (Paid / Unpaid / Partial Paid).
  - Category-wise and vendor-wise spend (count & amount).
- **Expenses**
  - Add a new expense with title, category, sub-category, vendor, account type, status, amount, date, description, and **bill image upload**.
  - List, view, edit, and update existing expenses.
- **Income**
  - Add a new income with title, account type, status, date, amount, description.
  - List and view income entries.
- **Profile**
  - Update personal details.
  - Upload profile picture.

### Admin Module
- **Admin Dashboard**
  - Total registered users.
  - Total expense count, monthly expense and daily expense totals.
  - Growth ratios (users monthly, transactions monthly, expense daily/monthly).
  - Line, bar, pie and donut charts for platform-wide analytics.
  - Category & vendor stats (counts and amounts) for the platform.
- **Master Data Management** (CRUD)
  - Categories
  - Sub-categories
  - Vendors
  - Account Types (Cash / Credit Card / Debit Card / Cheque)
  - Statuses (Paid / Unpaid / Partial Paid / ...)
- **User Management**
  - View list of all users.
  - View individual user details.
- **All Expenses**
  - View every expense raised on the platform with full context.

### Security
- Custom `LoginCheckFilter` that intercepts every request and forces users to authenticate before accessing any internal page (whitelist of public URLs: `/login`, `/signup`, `/forgetpassword`, `/assets/**`, `/authentication`, OTP endpoints, etc.).
- Role-based redirection (1 → Admin, 2 → User).
- Server-side session with a 5-minute inactivity timeout.

---

## Tech Stack

| Layer        | Technology |
|--------------|------------|
| Language     | Java 8 |
| Framework    | Spring Boot 2.7.8 (Web MVC, JDBC, DevTools) |
| View         | JSP + JSTL (Jasper / Tomcat Embed Jasper) |
| Build Tool   | Maven (packaging: **WAR**) |
| Database     | MySQL 8 (via `spring-boot-starter-data-jdbc` + `spring-jdbc`) |
| Email        | JavaMail (`com.sun.mail:javax.mail`) over Gmail SMTP |
| File Upload  | Apache Commons IO + Commons FileUpload |
| UI Template  | Star Admin-style Bootstrap dashboard (custom SCSS, Chart.js, Flot, C3, Morris, etc.) |
| Server       | Embedded Tomcat (port `9999`) |

---

## Architecture

A classic **layered Spring MVC** architecture:

```
Browser (JSP)
   │
   ▼
Controller (com.expenses.project.controller)
   │
   ▼
DAO  (com.expenses.project.dao)  ── uses JdbcTemplate
   │
   ▼
MySQL (expenseapp)
```

Cross-cutting components:
- `LoginCheckFilter` — global servlet filter that gates protected routes.
- `EmailService` — sends OTP emails for password reset.
- `OtpGenerator` — utility to generate N-digit OTPs.
- `HelperData` — common helper methods.

---

## Screens & Modules

| Module        | Key JSP pages |
|---------------|---------------|
| Auth          | `Login.jsp`, `Signup.jsp`, `ForgetPassword.jsp`, `UpdatePassword.jsp` |
| Layout        | `Navbar.jsp`, `LeftSlideBar.jsp`, `LeftsideUserdashboard.jsp`, `MainContent.jsp`, `AllCss.jsp`, `AllJavascript.jsp` |
| Expense       | `ListExpense.jsp`, `ViewExpense.jsp`, `EditExpense.jsp`, `AllExpenses.jsp`, `ViewAllExpense.jsp` |
| Income        | `ListIncome.jsp`, `ViewIncome.jsp` |
| Category      | `NewCategory.jsp`, `ListCategory.jsp`, `ViewCategory.jsp`, `EditCategory.jsp` |
| Sub-Category  | `NewSubCategory.jsp`, `ListSubCategory.jsp`, `ViewSubCategory.jsp`, `EditSubCategory.jsp` |
| Vendor        | `NewVendor.jsp`, `ListVendor.jsp`, `EditVendor.jsp` |
| Account/Status| `NewAccount.jsp`, `ListAccount.jsp`, `NewStatus.jsp`, `ListStatus.jsp` |
| Users (Admin) | `ListUsers.jsp`, `ViewUser.jsp` |

---

## Project Structure

```
expenseapp_23/
├── pom.xml
├── ExpenseManager_v1.sql          # Full DB dump (schema + seed data)
├── db.txt                         # Notes & SQL queries used during development
├── IntialJSP.txt                  # JSP layout boilerplate
├── Final_Report_Vaibhav_8th_SEM.pdf
├── Presentation.pptx
└── src/
    ├── main/
    │   ├── java/com/expenses/project/
    │   │   ├── ExpenseManager23FinalApplication.java   # Spring Boot entry point
    │   │   ├── ServletInitializer.java
    │   │   ├── LoginCheckFilter/
    │   │   │   └── LoginCheckFilter.java
    │   │   ├── controller/        # SessionController, UserController, AdminController,
    │   │   │                      # ExpenseController, IncomeController, CategoryController,
    │   │   │                      # SubCategoryController, VendorController,
    │   │   │                      # AccountController, StatusController
    │   │   ├── dao/               # UserDao, AdminDao, HomeDao, ExpenseDao, IncomeDao,
    │   │   │                      # CategoryDao, SubCategoryDao, VendorDao,
    │   │   │                      # AccountDao, StatusDao
    │   │   ├── bean/              # UserBean, LoginBean, ExpenseBean, IncomeBean,
    │   │   │                      # CategoryBean, SubCategoryBean, VendorBean,
    │   │   │                      # AccountBean, StatusBean, ProfileBean,
    │   │   │                      # ChartExpenseBean, ForgetPasswordBean,
    │   │   │                      # UpdatePasswordBean
    │   │   ├── service/
    │   │   │   └── EmailService.java
    │   │   └── util/
    │   │       ├── OtpGenerator.java
    │   │       └── HelperData.java
    │   ├── resources/
    │   │   ├── application.properties
    │   │   └── static/assets/     # CSS, JS, vendor libs, profile & bill images
    │   └── webapp/WEB-INF/views/  # All JSP views
    └── test/
```

---

## Database Schema

Database: **`expenseapp`** (MySQL 8).

Tables created by `ExpenseManager_v1.sql`:

- `users` — `userId`, `firstName`, `lastName`, `email`, `password`, `role` (1=admin, 2=user), `gender`, `dob`, `joindate`, `contactNum`, `imageUrl`, `otp`
- `category` — `categoryId`, `categoryName`, `deleted`
- `subcategory` — `subCategoryId`, `subCategoryName`, `categoryId` *(FK)*
- `vendor` — `vendorId`, `vendorName`, `deleted`
- `accounttype` — `accountTypeId`, `accountType`, `deleted` (seeded with cash / credit card / debit card / cheque)
- `status` — `statusId`, `statusShow`, `deleted` (paid / unpaid / partial paid)
- `expense` — `expenseId`, `title`, `categoryId`, `subCategoryId`, `vendorId`, `accountTypeId`, `statusId`, `ammount`, `date`, `description`, `userId`, `billURL`
- `income` — `incomeId`, `title`, `date`, `userId`, `accountTypeId`, `description`, `statusId`, `ammount`

> The full schema **and seed data** (sample users, categories, vendors, expenses, incomes) are available in [`ExpenseManager_v1.sql`](./ExpenseManager_v1.sql).

---

## Getting Started

### Prerequisites

Make sure the following are installed on your machine:

- **JDK 8** (or higher — the project targets Java 8)
- **Maven 3.6+**
- **MySQL 8.0+**
- A modern browser (Chrome / Edge / Firefox)
- *(Optional)* Spring Tool Suite / IntelliJ IDEA / Eclipse

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/expenseapp_23.git
cd expenseapp_23
```

### 2. Set up the Database

Open the MySQL CLI (or MySQL Workbench) and import the provided SQL dump:

```bash
mysql -u root -p < ExpenseManager_v1.sql
```

This will:

1. Create the `expenseapp` database.
2. Create all required tables (`users`, `category`, `subcategory`, `vendor`, `accounttype`, `status`, `expense`, `income`).
3. Seed initial reference data (account types, statuses, sample categories, sample users, etc.).

### 3. Configure the Application

The actual `application.properties` is **ignored from version control** to keep credentials private.
Copy the provided example file and fill in your own values:

```bash
# Windows (PowerShell)
copy src\main\resources\application.properties.example src\main\resources\application.properties

# Linux / macOS
cp src/main/resources/application.properties.example src/main/resources/application.properties
```

Then open `src/main/resources/application.properties` and replace the placeholders:

```properties
# MySQL connection
spring.datasource.username=YOUR_MYSQL_USERNAME
spring.datasource.password=YOUR_MYSQL_PASSWORD

# Gmail SMTP (used for Forgot-Password OTP)
app.mail.from=your-email@gmail.com
app.mail.app-password=your-16-character-app-password
```

> Create a Gmail App Password from your Google Account → *Security* → *2-Step Verification* → *App passwords*.

### 4. Run the Application

```bash
mvn spring-boot:run
```

Or, build and run the WAR directly:

```bash
mvn clean package
java -jar target/expenseManager-23_Final-0.0.1-SNAPSHOT.war
```

Then open your browser:

```
http://localhost:9999/
```

You should land on the Login page.

---

## Default Roles

| Role value | Meaning |
|------------|---------|
| `1`        | Admin — redirected to `/admindashboard` after login |
| `2`        | User  — redirected to `/home` after login |

You can promote any user to admin directly in MySQL:

```sql
UPDATE users SET role = 1 WHERE email = 'someone@example.com';
```

Sample users are included in `ExpenseManager_v1.sql`.

---

## REST/MVC Endpoints (Selected)

| Endpoint                          | Method | Purpose |
|-----------------------------------|--------|---------|
| `/` , `/login`                    | GET    | Login page |
| `/signup`                         | GET    | Signup page |
| `/saveuser`                       | POST   | Register a new user |
| `/authentication`                 | POST   | Authenticate user (sets cookies + session) |
| `/forgetpassword`                 | GET    | Forgot-password page |
| `/sendotpforforgetpassword`       | POST   | Send OTP to email |
| `/updatepasswordjspopen`          | GET    | Update-password page |
| `/updatemypassword`               | POST   | Verify OTP and update password |
| `/logout`                         | GET    | Invalidate session |
| `/home`                           | GET    | User dashboard |
| `/admindashboard`                 | GET    | Admin dashboard |
| `/newexpense`, `/saveexpense`     | GET/POST | Add expense (with bill image) |
| `/listexpense`, `/viewexpense`    | GET    | List / view user expenses |
| `/editexpense`, `/updateexpense`  | GET/POST | Edit expense |
| `/allexpenses`, `/viewallexpense` | GET    | Admin: all platform expenses |
| `/newincome`, `/saveincome`       | GET/POST | Add income |
| `/listincome`, `/viewincome`      | GET    | List / view incomes |
| `/listusers`, `/viewuser`         | GET    | Admin: manage users |
| `/myprofile`, `/saveprofilepic`   | GET/POST | Update profile + upload picture |

Plus full CRUD endpoints for categories, sub-categories, vendors, accounts, and statuses.

---

## Author

**Vaibhav** &nbsp;·&nbsp; B.E. Final Year (8th Semester), Gujarat Technological University (GTU)
Internship project @ **Unnati**.

- Mentors & Guide: *Unnati Internship Team*
- Project documents: [`Final_Report_Vaibhav_8th_SEM.pdf`](./Final_Report_Vaibhav_8th_SEM.pdf), [`Presentation.pptx`](./Presentation.pptx)

---

## License

This project is shared for **educational and academic** purposes as part of the GTU final-year internship program. It can be used as a reference for learning Spring Boot + JSP + MySQL development.
