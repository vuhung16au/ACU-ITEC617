# Connectivity and Cardinality (M:N)

## Connectivity
**Connectivity** describes *how* entities participate in a relationship — typically **one-to-one (1:1)**, **one-to-many (1:M)**, or **many-to-many (M:N)**.

In a university enrollment system:

> A student can take many courses, and a course can have many students.

That rule is **M:N**: each student relates to many courses, and each course relates to many students.

## Cardinality
**Cardinality** is the more precise count of how many instances of one entity may be associated with instances of another (e.g., "one or more", "exactly one", "zero or more"). Connectivity is the high-level pattern (1:1 / 1:M / M:N); cardinality fills in the participation details.

## Why You Cannot Store M:N Directly in Two Tables
Relational databases implement relationships with foreign keys. A foreign key column in Table A pointing to Table B naturally models **1:M** (many rows in A can reference one row in B).

Trying to force M:N into only `Students` and `Courses` fails:

| Naive approach | Problem |
|---|---|
| Put `CourseID` on `Students` | Each student can only enroll in **one** course |
| Put `StudentID` on `Courses` | Each course can only have **one** student |
| Add `CourseID1`, `CourseID2`, … columns | Schema must grow for every new course; queries become painful |

M:N relationships must be **decomposed** into two 1:M relationships using a bridge (associative) entity.
