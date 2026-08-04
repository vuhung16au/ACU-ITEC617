# Schema Overview: Eliminating Transitive Dependencies (3NF)

This exercise demonstrates the normalization process from a 2NF table (with a single-column primary key but containing transitive dependencies) to Third Normal Form (3NF).

## Unnormalized Schema (2NF with Transitive Dependencies)
*   **AppointmentFlat**: The original table containing transitive dependencies. The primary key is `AppointmentID`.
    *   `AppointmentID` (INT, PK)
    *   `PatientID` (INT)
    *   `PatientName` (VARCHAR) - *Transitive dependency on PatientID*
    *   `DoctorID` (INT)
    *   `DoctorName` (VARCHAR) - *Transitive dependency (AppointmentID -> DoctorID -> DoctorName)*
    *   `DoctorSpecialty` (VARCHAR) - *Transitive dependency (AppointmentID -> DoctorID -> DoctorSpecialty)*
    *   `DepartmentName` (VARCHAR) - *Transitive dependency (AppointmentID -> DoctorID -> DepartmentName)*
    *   `AppointmentDate` (TIMESTAMP)

## Normalized Schema (3NF)
To eliminate transitive dependencies and adhere to 3NF, the data is separated into related tables so that non-key attributes depend *only* on the primary key:
*   **Patient**: Stores patient details.
    *   `PatientID` (INT, PK)
    *   `PatientName` (VARCHAR)
*   **Department**: Stores department details.
    *   `DepartmentID` (INT, PK)
    *   `DepartmentName` (VARCHAR)
*   **Doctor**: Stores doctor details and their department.
    *   `DoctorID` (INT, PK)
    *   `DoctorName` (VARCHAR)
    *   `DoctorSpecialty` (VARCHAR)
    *   `DepartmentID` (INT, FK)
*   **Appointment**: Stores the core appointment transaction.
    *   `AppointmentID` (INT, PK)
    *   `PatientID` (INT, FK)
    *   `DoctorID` (INT, FK)
    *   `AppointmentDate` (TIMESTAMP)
