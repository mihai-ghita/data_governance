-- Private Hospital Database Schema

-- 1. Patients Table
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(15),
    insurance_provider VARCHAR(100),
    insurance_policy_number VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Doctors Table
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    hire_date DATE NOT NULL,
    consultation_fee DECIMAL(10,2),
    department_id INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Departments Table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    head_doctor_id INTEGER,
    location VARCHAR(100),
    phone VARCHAR(15),
    budget DECIMAL(15,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Appointments Table
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    duration_minutes INTEGER DEFAULT 30,
    appointment_type VARCHAR(50) DEFAULT 'Consultation',
    status VARCHAR(20) DEFAULT 'Scheduled' CHECK (status IN ('Scheduled', 'Completed', 'Cancelled', 'No-Show')),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- 5. Medical Records Table
CREATE TABLE medical_records (
    record_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    appointment_id INTEGER,
    visit_date DATE NOT NULL,
    chief_complaint TEXT,
    diagnosis TEXT,
    treatment_plan TEXT,
    prescribed_medications TEXT,
    follow_up_required BOOLEAN DEFAULT FALSE,
    follow_up_date DATE,
    vital_signs JSONB, -- Store blood pressure, temperature, pulse, etc.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- 6. Hospital Rooms Table
CREATE TABLE hospital_rooms (
    room_id SERIAL PRIMARY KEY,
    room_number VARCHAR(20) NOT NULL UNIQUE,
    room_type VARCHAR(50) NOT NULL CHECK (room_type IN ('Private', 'Semi-Private', 'Ward', 'ICU', 'Emergency', 'Operating')),
    floor_number INTEGER,
    capacity INTEGER DEFAULT 1,
    current_occupancy INTEGER DEFAULT 0,
    daily_rate DECIMAL(10,2),
    amenities TEXT[],
    is_available BOOLEAN DEFAULT TRUE,
    last_cleaned TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 7. Admissions Table
CREATE TABLE admissions (
    admission_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    room_id INTEGER,
    admission_date TIMESTAMP NOT NULL,
    discharge_date TIMESTAMP,
    admission_type VARCHAR(50) DEFAULT 'Elective' CHECK (admission_type IN ('Emergency', 'Elective', 'Transfer')),
    reason_for_admission TEXT NOT NULL,
    discharge_summary TEXT,
    total_cost DECIMAL(15,2),
    insurance_covered DECIMAL(15,2),
    patient_balance DECIMAL(15,2),
    status VARCHAR(20) DEFAULT 'Active' CHECK (status IN ('Active', 'Discharged', 'Transferred')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (room_id) REFERENCES hospital_rooms(room_id)
);

-- 8. Staff Table
CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    employee_id VARCHAR(20) UNIQUE NOT NULL,
    position VARCHAR(100) NOT NULL,
    department_id INTEGER,
    hire_date DATE NOT NULL,
    salary DECIMAL(12,2),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    shift_schedule VARCHAR(50), -- e.g., "Day", "Night", "Rotating"
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 9. Billing Table
CREATE TABLE billing (
    bill_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    admission_id INTEGER,
    appointment_id INTEGER,
    bill_date DATE NOT NULL,
    due_date DATE,
    total_amount DECIMAL(15,2) NOT NULL,
    insurance_amount DECIMAL(15,2) DEFAULT 0,
    patient_amount DECIMAL(15,2) NOT NULL,
    paid_amount DECIMAL(15,2) DEFAULT 0,
    outstanding_amount DECIMAL(15,2) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Pending' CHECK (payment_status IN ('Pending', 'Partial', 'Paid', 'Overdue')),
    payment_method VARCHAR(50),
    payment_date DATE,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (admission_id) REFERENCES admissions(admission_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- 10. Inventory Table
CREATE TABLE inventory (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(200) NOT NULL,
    item_code VARCHAR(50) UNIQUE NOT NULL,
    category VARCHAR(100) NOT NULL, -- e.g., "Medication", "Medical Equipment", "Supplies"
    description TEXT,
    unit_of_measure VARCHAR(20), -- e.g., "pieces", "ml", "kg"
    current_stock INTEGER NOT NULL DEFAULT 0,
    minimum_stock INTEGER DEFAULT 10,
    maximum_stock INTEGER,
    unit_cost DECIMAL(10,2),
    supplier VARCHAR(100),
    expiry_date DATE,
    location VARCHAR(100), -- Storage location
    last_restocked DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add Foreign Key Constraints
ALTER TABLE doctors ADD CONSTRAINT fk_doctors_department 
    FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE departments ADD CONSTRAINT fk_departments_head_doctor 
    FOREIGN KEY (head_doctor_id) REFERENCES doctors(doctor_id);

-- Create Indexes for better performance
CREATE INDEX idx_patients_name ON patients(last_name, first_name);
CREATE INDEX idx_appointments_date ON appointments(appointment_date);
CREATE INDEX idx_appointments_patient ON appointments(patient_id);
CREATE INDEX idx_appointments_doctor ON appointments(doctor_id);
CREATE INDEX idx_medical_records_patient ON medical_records(patient_id);
CREATE INDEX idx_medical_records_date ON medical_records(visit_date);
CREATE INDEX idx_admissions_patient ON admissions(patient_id);
CREATE INDEX idx_admissions_date ON admissions(admission_date);
CREATE INDEX idx_billing_patient ON billing(patient_id);
CREATE INDEX idx_billing_status ON billing(payment_status);
CREATE INDEX idx_inventory_category ON inventory(category);
CREATE INDEX idx_inventory_stock ON inventory(current_stock);

-- Create Views for common queries
CREATE VIEW active_patients AS
SELECT p.*, COUNT(a.appointment_id) as total_appointments
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
WHERE a.appointment_date >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY p.patient_id;

CREATE VIEW doctor_schedule AS
SELECT 
    d.doctor_id,
    d.first_name || ' ' || d.last_name as doctor_name,
    d.specialization,
    a.appointment_date,
    a.appointment_time,
    p.first_name || ' ' || p.last_name as patient_name,
    a.status
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
JOIN patients p ON a.patient_id = p.patient_id
WHERE a.appointment_date >= CURRENT_DATE
ORDER BY a.appointment_date, a.appointment_time;

CREATE VIEW room_occupancy AS
SELECT 
    r.room_number,
    r.room_type,
    r.capacity,
    r.current_occupancy,
    CASE 
        WHEN r.current_occupancy >= r.capacity THEN 'Full'
        WHEN r.current_occupancy > 0 THEN 'Partial'
        ELSE 'Available'
    END as occupancy_status,
    r.daily_rate
FROM hospital_rooms r
ORDER BY r.room_number;
