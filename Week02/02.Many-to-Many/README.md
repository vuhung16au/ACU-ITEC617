# Week 2 - Topic 2: Fixing the "Many-to-Many" Mess

## Overview
This activity focuses on Understanding Connectivity and Cardinality (M:N) and Building ERDs. Students confront a flawed university enrollment design, then resolve it with a bridge (associative) entity.

## The Setup
We are modeling a university enrollment system with two tables: **Students** and **Courses**.

**Business rule:**

> "A student can take many courses, and a course can have many students."

That is a classic **many-to-many (M:N)** relationship.

### The Naive (Incorrect) Attempts
A common mistake is to "solve" M:N by stuffing foreign keys into one of the two tables:

1. **Add a `CourseID` column to `Students`** — a student can only be linked to one course. Tracking multiple enrollments would require a new column for every course (`CourseID1`, `CourseID2`, …), which does not scale and breaks relational design.
2. **Add a `StudentID` column to `Courses`** — a course can only be linked to one student. The same problem appears in reverse.

Neither approach correctly models "many students ↔ many courses."

## The Hands-on Task
Students are required to complete the following:

1. **Diagramming:** Using Lucidchart, draw.io, or Mermaid.js, draw the initial M:N relationship between `Student` and `Course`.

2. **Resolution:** Resolve the M:N relationship by drawing a new ERD that includes a **Bridge / Associative Entity** (e.g., `Enrollment`).

3. **SQL Translation:** Write the SQL to create the three tables. The crucial part is the `CREATE TABLE Enrollment` statement, which must include:
   - Two Foreign Keys (`StudentID` → `Students`, `CourseID` → `Courses`)
   - A Composite Primary Key made up of (`StudentID`, `CourseID`)

The provided `init-scripts/01-init.sql` file contains a reference implementation for this challenge.
