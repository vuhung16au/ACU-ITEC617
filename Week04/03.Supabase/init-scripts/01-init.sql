-- Schema provided for Supabase Lab

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Create tables with proper constraints
CREATE TABLE departments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE,
    location TEXT,
    budget DECIMAL(12,2),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE employees (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    department_id UUID REFERENCES departments(id) ON DELETE SET NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL CHECK (salary > 0),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    department_id UUID REFERENCES departments(id),
    start_date DATE,
    end_date DATE,
    status TEXT CHECK (status IN ('planning', 'active', 'completed', 'cancelled')),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE employee_projects (
    employee_id UUID REFERENCES employees(id) ON DELETE CASCADE,
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    role TEXT NOT NULL,
    hours_allocated INTEGER,
    PRIMARY KEY (employee_id, project_id)
);

-- Insert sample data
INSERT INTO departments (name, location, budget) VALUES
('Engineering', 'Sydney', 500000),
('Marketing', 'Melbourne', 250000),
('Finance', 'Brisbane', 300000),
('HR', 'Perth', 150000);

-- Insert sample employees
INSERT INTO employees (first_name, last_name, email, department_id, hire_date, salary)
SELECT 'Alice', 'Chen', 'alice.chen@company.com', id, '2023-01-15', 95000
FROM departments WHERE name = 'Engineering';
