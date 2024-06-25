# Placement Management System

<p align="center">
    <img src="assets/pi.png" width="90%" />
</p>

## Introduction
This project is a Placement Management System designed to streamline the placement process for a college. It involves creating a comprehensive database to manage student information, skills, company requirements, interviews, and placements.

## Problem Statement
A college needs an efficient system to manage the placement process, including tracking students, their skills, company requirements, interviews, and final placements. The goal is to streamline operations and ensure students are matched to companies based on their skillsets.

## Database Schema
The database consists of the following tables:
- **Students**: Stores student details.
- **Skills**: Lists available skills.
- **Companies**: Contains company details.
- **StudentSkills**: Maps students to their skills.
- **CompanyReqSkills**: Maps companies to required skills.
- **Interviews**: Records interview details.
- **Placements**: Tracks placement information.

## Key Relationships
- **Students-Skills**: Many-to-many (StudentSkills).
- **Companies-Skills**: Many-to-many (CompanyReqSkills).
- **Students-Interviews**: Many-to-many with additional details.
- **Interviews-Placements**: One-to-one.

## Normalization
The database is normalized up to the third normal form (3NF) to reduce redundancy and ensure data integrity.

## Triggers
A trigger `MatchAndPlace` is used to automatically place students in the Placements table if their skills match the company's requirements during an interview.

## Working
The Placement Management System organizes and manages data through a structured database. Key entities such as Students, Skills, Companies, Interviews, and Placements are represented in tables. Relationships between these entities are defined to ensure accurate data linkage. For example, the `StudentSkills` and `CompanyReqSkills` tables manage the many-to-many relationships between students and skills, and companies and required skills. When interviews are conducted, a trigger automatically places students if their skills match the company’s requirements. The system includes various SQL queries to interact with the database, such as retrieving student details, counting records, and obtaining placement data. This approach ensures efficient data management and helps in making informed placement decisions.

## SQL Queries
Includes 25 queries for various operations such as selecting students based on criteria, counting records, and retrieving placement data.

## Usage
To use this system:
1. Set up the MySQL database using the provided schema.
2. Populate the tables with sample data.
3. Execute the provided SQL queries to interact with the database.

## Conclusion
This Placement Management System enhances the efficiency of managing student placements by maintaining accurate and consistent data, and automating placement processes based on skill matching.


## Contact
<p align="left">
<a href="https://www.linkedin.com/in/pathakdarshan12/" target="blank">
    <img align="center" src="https://github.com/tandpfun/skill-icons/blob/main/icons/LinkedIn.svg" alt="linkedin" height="30" width="40" />
</a>
<a href="https://x.com/_Pathak_Darshan" target="blank">
    <img align="center" src="https://github.com/tandpfun/skill-icons/blob/main/icons/Twitter.svg" alt="twitter" height="30" width="40" />
</a>
<a href="https://www.instagram.com/pathakdarshan12/" target="blank">
    <img align="center" src="https://github.com/tandpfun/skill-icons/blob/main/icons/Instagram.svg" alt="instagram" height="30" width="40" />
</a>
<a href="mailto:pathakdarshan12@gmail.com" target="blank">
    <img align="center" src="https://github.com/tandpfun/skill-icons/blob/main/icons/Gmail-Dark.svg" alt="gmail" height="30" width="40" />
</a>
</p>

![](https://komarev.com/ghpvc/?username=Pathakdarshan12&style=plastic)

