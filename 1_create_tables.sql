-- TAXI Table
CREATE TABLE TAXI (
    Taxi_id INTEGER NOT NULL,
    Registration_no VARCHAR(20),
    Taxi_model VARCHAR(20),
    Purchase_date DATE,
    Taxi_type VARCHAR(20),
    Status VARCHAR(20) CHECK (Status IN ('Available', 'Booked', 'Maintenance')),
    Driver_id INTEGER,
    PRIMARY KEY (Taxi_id),
    UNIQUE (Registration_no)
);

-- DRIVER Table
CREATE TABLE DRIVER (
    Driver_id INTEGER NOT NULL,
    F_name VARCHAR(10),
    L_name VARCHAR(20),
    Gender VARCHAR(10),
    Contact_no VARCHAR(15),
    Rating INTEGER CHECK (Rating BETWEEN 0 AND 5),
    Age INTEGER,
    License_no VARCHAR(20),
    Hire_date DATE DEFAULT SYSDATE,
    PRIMARY KEY (Driver_id)
);

-- USER_TBL Table
CREATE TABLE USER_TBL (
    Usr_id INTEGER NOT NULL,
    F_name VARCHAR(20),
    L_name VARCHAR(20),
    Contact_no VARCHAR(15),
    Gender VARCHAR(10),
    Address VARCHAR(50),
    Email VARCHAR(50),
    Reg_date DATE DEFAULT SYSDATE,
    Taxi_id INTEGER,
    PRIMARY KEY (Usr_id)
);

-- TRIP_DETAILS Table
CREATE TABLE TRIP_DETAILS (
    Trip_id INTEGER NOT NULL,
    Trip_date DATE,
    Trip_amt DECIMAL(10,2),
    Driver_id INTEGER,
    Usr_id INTEGER,
    Taxi_id INTEGER,
    Strt_time TIMESTAMP,
    End_time TIMESTAMP,
    PRIMARY KEY (Trip_id)
);

-- BILL_DETAILS Table
CREATE TABLE BILL_DETAILS (
    Bill_no INTEGER NOT NULL,
    Bill_date DATE,
    Advance_amt DECIMAL(10,2),
    Discount_amt DECIMAL(10,2),
    Total_amt DECIMAL(10,2),
    Payment_status VARCHAR(20) DEFAULT 'Pending' CHECK (Payment_status IN ('Pending', 'Paid', 'Failed')),
    Usr_id INTEGER,
    Trip_id INTEGER,
    PRIMARY KEY (Bill_no)
);

-- CUSTOMER_SERVICE Table
CREATE TABLE CUSTOMER_SERVICE (
    Emp_id INTEGER NOT NULL,
    F_name VARCHAR(20),
    L_name VARCHAR(20),
    PRIMARY KEY (Emp_id)
);

-- FEEDBACK Table
CREATE TABLE FEEDBACK (
    Fbk_id INTEGER NOT NULL,
    Message VARCHAR(140),
    Email VARCHAR(50),
    Emp_id INTEGER,
    Usr_id INTEGER,
    Trip_id INTEGER,
    PRIMARY KEY (Fbk_id)
);

-- OWNS Table
CREATE TABLE OWNS (
    Owner_id INTEGER NOT NULL,
    No_Cars INTEGER,
    PRIMARY KEY (Owner_id)
);

-- OWNER_TAXI Table
CREATE TABLE OWNER_TAXI (
    Owner_id INTEGER NOT NULL,
    Taxi_id INTEGER NOT NULL,
    PRIMARY KEY (Owner_id, Taxi_id)
);

-- INDIVIDUAL Table
CREATE TABLE INDIVIDUAL (
    Ssn INTEGER NOT NULL,
    Name VARCHAR(20),
    Owner_id INTEGER,
    PRIMARY KEY (Ssn)
);

-- TAXI_SERVICE_COMPANY Table
CREATE TABLE TAXI_SERVICE_COMPANY (
    Tsc_id INTEGER NOT NULL,
    Tsc_name VARCHAR(20),
    Owner_id INTEGER,
    PRIMARY KEY (Tsc_id)
);