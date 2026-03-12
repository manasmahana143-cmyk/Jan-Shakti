-- 1. Create Table for Workers
Create database JAN_SHAKTI;
use JAN_SHAKTI;
CREATE TABLE Workers (
    worker_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    work_type VARCHAR(50),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    city_preference VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE
);

-- 2. Create Table for Job Postings
CREATE TABLE JobPostings (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    job_title VARCHAR(100) NOT NULL,
    category VARCHAR(50), -- e.g., Construction, Cleaning
    location VARCHAR(100),
    salary_info VARCHAR(50), -- e.g., ₹600/Day
    job_type VARCHAR(20), -- e.g., Daily, Full-Time
    contact_number VARCHAR(15),
    posted_on DATE
);