CREATE SCHEMA compliance;

CREATE TABLE compliance.medical_records (
    record_id SERIAL PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255)
);

INSERT INTO compliance.medical_records (patient_name, diagnosis, treatment) VALUES
('John Doe', 'Hypertension', 'Lisinopril'),
('Jane Smith', 'Asthma', 'Albuterol Inhaler');

-- Create roles
CREATE ROLE Auditor;
CREATE ROLE Nurse;

-- Create users
CREATE USER alice_auditor WITH PASSWORD 'password';
CREATE USER bob_nurse WITH PASSWORD 'password';

-- Assign roles
GRANT Auditor TO alice_auditor;
GRANT Nurse TO bob_nurse;

-- Grant usage
GRANT USAGE ON SCHEMA compliance TO Auditor;
GRANT USAGE ON SCHEMA compliance TO Nurse;

-- Grant specific permissions
GRANT SELECT ON compliance.medical_records TO Auditor;
GRANT SELECT, INSERT ON compliance.medical_records TO Nurse;

-- ==========================================
-- Configure PostgreSQL for strict auditing
-- ==========================================
-- Log all connections (failed and successful)
ALTER SYSTEM SET log_connections = 'on';
ALTER SYSTEM SET log_disconnections = 'on';

-- Log all statements (DDL, DML, etc.)
ALTER SYSTEM SET log_statement = 'all';

-- Apply configuration changes
SELECT pg_reload_conf();
