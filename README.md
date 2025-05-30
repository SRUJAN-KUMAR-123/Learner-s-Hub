# 📘 Learner's Hub

**Learner's Hub** is an online course learning portal designed to bridge the gap between learners and course providers. Built using Java (JSP) and MySQL, this project supports user registration, course management, and a simple interface for learning content.

---

## 🎯 Project Purpose

> ⚠️ **Note:** This is not a full-fledged production-ready learning platform.  
> Instead, it is a **conceptual prototype** built to demonstrate key components and workflows commonly found in course-based web applications.

---

## 🚀 Features (Prototype-Level)

- 👨‍🎓 Student and Admin login

- 📚 Course enrollment and tracking

- 🧑‍🏫 Instructor/course provider module

- 🔐 Secure registration and authentication

- 📊 Admin dashboard for course and user management

- 🔎 Search and view available courses

- 📄 JSP-based dynamic pages connected to a MySQL database
  
---

## 🛠️ Tech Stack

| Technology      | Description                         |
|------------------|-------------------------------------|
| **Frontend**     | HTML, CSS, Bootstrap                |
| **Backend**      | Java (JSP, Servlets)                |
| **Database**     | MySQL                               |
| **Server**       | Apache Tomcat                       |

---

## 📁 Project Structure

<code>
LearnersHub/
├── .settings/           # IDE-specific configuration files (Eclipse)
├── .vscode/             # VS Code editor settings
├── build/               # Compiled Java classes and build outputs
│   └── classes/         
├── java/                # Java source code files (servlets, models, DAO)
├── login/               # Login-related JSP pages and logic
├── profile/             # User profile management files
├── register/            # Registration pages and related logic
├── src/                 
│   └── main/            # Main source directory (if using Maven/standard layout)
├── vendor/              # External libraries and dependencies
├── webapp/              # Web application root folder
│   ├── META-INF/        # Metadata configuration files
│   └── WEB-INF/         # Web deployment descriptor and configs
├── assets/              # Static resources like CSS, JS, and images
</code>


---

▶️ [Watch Demo Video on Google Drive](https://drive.google.com/file/d/1iDiP3nQJHQNb8ylnNb1WTMrE1iL4Kptt/view?usp=sharing)

---

## 📦 Installation Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/learners-hub.git
   
2. Import into Eclipse/NetBeans as a dynamic web project.
   
3. Set up the MySQL database:
    - Create a database learnershub

4. Import the provided database.sql file

5. Configure your database connection inside DBConnection.java.

6. Deploy the project on Apache Tomcat server.

7. Run the server and go to: http://localhost:8080/learners-hub/


---

## 📄 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).  
Feel free to explore, learn, and build upon it!

---

## 🙋‍♂️ Credits

This project was developed as part of an academic assignment to understand the fundamentals of building a learning management portal using Java and JSP technologies.


----

## 🚀 Project Overview

**Learner's Hub** is an online web learning portal built using **JSP**, **Java**, and **MySQL**. It features a responsive design with a beautiful homepage and supports two types of users: **Students** and **Instructors**. Each user type has a dedicated dashboard tailored to their specific functionalities.

### User Roles & Functionality

- **Student**
  - Registers on the platform and accesses the **Student Dashboard**.
  - Views **Available Courses** — courses that at least one instructor has enrolled to teach.
  - Can enroll in courses and see their **Registered Courses**.

- **Instructor**
  - Registers on the platform and accesses the **Instructor Dashboard**.
  - Views **Available Courses** to choose from.
  - Manages the courses they have enrolled in through **Registered Courses**.

- **Admin**
  - Manages the platform through the **Admin Dashboard**.
  - Adds, modifies, or deletes courses available on the platform.

### Key Points

- Separate database tables store student and instructor details.
- Courses appear in the student dashboard only if at least one instructor is available to teach them.
- Students can select from multiple instructors if more than one is teaching the same course.
- This project serves as a basic workflow and outline of a learning management system similar to platforms like Coursera or Udemy.
- It provides a clean and attractive UI designed to demonstrate core functionalities of an educational portal.

---

This project is ideal for anyone interested in understanding or building a simple online learning platform using Java web technologies.

