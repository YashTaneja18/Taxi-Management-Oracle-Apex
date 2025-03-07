-- Active Trips
CREATE OR REPLACE VIEW ACTIVE_TRIPS AS
SELECT Trip_id, u.F_name || ' ' || u.L_name AS Customer, 
       d.F_name || ' ' || d.L_name AS Driver, 
       t.Taxi_model, Strt_time
FROM TRIP_DETAILS td
JOIN USER_TBL u ON td.Usr_id = u.Usr_id
JOIN DRIVER d ON td.Driver_id = d.Driver_id
JOIN TAXI t ON td.Taxi_id = t.Taxi_id
WHERE End_time IS NULL;

-- Driver Availability
CREATE OR REPLACE VIEW DRIVER_STATUS AS
SELECT d.Driver_id, d.F_name || ' ' || d.L_name AS Driver_Name, 
       t.Taxi_id, t.Taxi_model, t.Status
FROM DRIVER d
LEFT JOIN TAXI t ON d.Driver_id = t.Driver_id;

-- Payment Status
CREATE OR REPLACE VIEW PAYMENT_TRACKING AS
SELECT b.Bill_no, u.F_name || ' ' || u.L_name AS Customer, 
       b.Total_amt, b.Payment_status
FROM BILL_DETAILS b
JOIN USER_TBL u ON b.Usr_id = u.Usr_id
WHERE b.Payment_status = 'Pending';