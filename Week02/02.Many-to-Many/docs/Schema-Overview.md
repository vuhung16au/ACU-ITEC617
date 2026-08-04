# Schema Overview

Reference schema for the resolved university enrollment design (three tables).

## `students`
| Column | Type | Notes |
|---|---|---|
| `student_id` | `SERIAL` | Primary Key (surrogate) |
| `first_name` | `VARCHAR(100)` | Required |
| `last_name` | `VARCHAR(100)` | Required |
| `email` | `VARCHAR(255)` | Required, unique |

## `courses`
| Column | Type | Notes |
|---|---|---|
| `course_id` | `SERIAL` | Primary Key (surrogate) |
| `course_code` | `VARCHAR(20)` | Required, unique (e.g. `ITEC617`) |
| `course_name` | `VARCHAR(200)` | Required |
| `credits` | `INT` | Required |

## `enrollment` (bridge / associative entity)
| Column | Type | Notes |
|---|---|---|
| `student_id` | `INT` | Part of composite PK; FK → `students(student_id)` |
| `course_id` | `INT` | Part of composite PK; FK → `courses(course_id)` |
| `enrolled_on` | `DATE` | Relationship attribute |
| `grade` | `VARCHAR(2)` | Optional relationship attribute (e.g. `HD`, `D`, `C`) |

**Composite Primary Key:** `(student_id, course_id)`
