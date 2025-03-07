# Taxi Booking and Management System

A comprehensive taxi management system built using **Oracle SQL**, **PL/SQL**, and **Oracle APEX**. This project automates taxi booking, fare calculation, payment processing, and provides a real-time monitoring dashboard.

## Features
- **Customer & Driver Management**: Procedures to register and update profiles.
- **Taxi Auto-Assignment**: Dynamically assigns available taxis based on customer preferences.
- **Automated Fare Calculation**: Calculates fares at $15/hour based on trip duration.
- **Payment Processing & Tracking**: Manages advance payments and tracks payment status (Pending/Paid/Failed).
- **APEX Dashboard**: Visualizes active trips, driver availability (pie chart), and pending payments using interactive reports.

## Technologies
- **Oracle SQL**: Database schema with tables, constraints, and views.
- **PL/SQL**: Stored procedures and triggers for business logic.
- **Oracle APEX**: Web-based dashboard for monitoring.


## Setup Instructions
1. **Database Setup**:
   - Run `sql/*.sql` files in order (1-10) in an Oracle database.
   - Use `09_test_commands.sql` to populate sample data.
2. **APEX Dashboard**:
   - Import `apex/taxi_dashboard.sql` into Oracle APEX (App Builder > Import).
   - Run the app to view the dashboard.
3. **Requirements**:
   - Oracle Database (e.g., 19c or later).
   - Oracle APEX (web or local instance).

## Usage
- Book a taxi: `BEGIN BOOK_TAXI('Name', 'Address', 'Contact', 'Model', 'Gender', 'Email', Advance); END;`
- End a trip: `BEGIN END_TRIP(Trip_id, Discount); END;`
- Process payment: `BEGIN PROCESS_PAYMENT(Bill_no, Amount); END;`
