# Hands-On Exercise 3: Eliminating Transitive Dependencies (3NF)

**Focus:** Achieving 3NF and understanding the trade-offs.

## Scenario
A hospital patient appointment system records everything in a single table with a single primary key (`AppointmentID`). However, doctor details (name, specialty, department) depend on `DoctorID`, not directly on `AppointmentID`. This is a transitive dependency that violates 3NF.

## Tasks
1. Create and populate with 15 appointments across 5 doctors.
2. Draw a dependency diagram showing the transitive path.
3. Write an UPDATE statement showing the anomaly (updating doctor specialty).
4. Normalize to 3NF: `Patient`, `Department`, `Doctor`, `Appointment`.
5. Compare storage: Calculate redundant data bytes in 0NF vs 3NF.
6. Write 3 business queries using JOINs:
   - All appointments for a specific doctor.
   - Patient count per department.
   - Doctors with no appointments scheduled.
