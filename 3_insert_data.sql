-- Insert into TAXI
INSERT INTO TAXI VALUES (1, 'KA-15R-3367', 'Benz 300', TO_DATE('01/01/2017', 'MM/DD/YYYY'), 'SUV', 'Available', NULL);
INSERT INTO TAXI VALUES (2, 'KA-15R-3368', 'Toyota Innova', TO_DATE('02/01/2018', 'MM/DD/YYYY'), 'Van', 'Available', NULL);

-- Insert into DRIVER
INSERT INTO DRIVER VALUES (1, 'Abhi', 'Gowda', 'Male', '4693805870', 5, 25, 'DL12345', SYSDATE);
INSERT INTO DRIVER VALUES (2, 'Ravi', 'Kumar', 'Male', '9876543210', 4, 30, 'DL67890', SYSDATE);

-- Update TAXI with Driver_id
UPDATE TAXI SET Driver_id = 1 WHERE Taxi_id = 1;
UPDATE TAXI SET Driver_id = 2 WHERE Taxi_id = 2;

-- Insert into USER_TBL
INSERT INTO USER_TBL VALUES (1, 'John', 'Doe', '1234567890', 'Male', '123 Main St', 'john@gmail.com', SYSDATE, NULL);

-- Insert into CUSTOMER_SERVICE
INSERT INTO CUSTOMER_SERVICE VALUES (1, 'Priya', 'Sharma');

-- Insert into OWNS
INSERT INTO OWNS VALUES (1, 1);
INSERT INTO OWNS VALUES (2, 1);

-- Insert into OWNER_TAXI
INSERT INTO OWNER_TAXI VALUES (1, 1);
INSERT INTO OWNER_TAXI VALUES (2, 2);

-- Insert into INDIVIDUAL
INSERT INTO INDIVIDUAL VALUES (123, 'Abhi Owner', 1);

-- Insert into TAXI_SERVICE_COMPANY
INSERT INTO TAXI_SERVICE_COMPANY VALUES (1, 'Abhi Taxi Co', 2);