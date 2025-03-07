CREATE OR REPLACE PROCEDURE BOOK_TAXI (
    Name IN VARCHAR2,
    v_Address IN VARCHAR2,
    v_Contact IN VARCHAR2,
    Taxi_Model IN VARCHAR2,
    v_Gender IN VARCHAR2,
    v_Email IN VARCHAR2,
    Advance IN DECIMAL
) AS
    v_usr_id INT;
    v_Trip_id INT;
    v_Bill_no INT;
    v_Taxi_id INT;
    v_Driver_id INT;
BEGIN
    -- Generate IDs
    SELECT NVL(MAX(Usr_id), 0) + 1 INTO v_usr_id FROM USER_TBL;
    SELECT NVL(MAX(Trip_id), 0) + 1 INTO v_Trip_id FROM TRIP_DETAILS;
    SELECT NVL(MAX(Bill_no), 0) + 1 INTO v_Bill_no FROM BILL_DETAILS;

    -- Auto-assign available taxi and driver
    BEGIN
        SELECT Taxi_id, Driver_id
        INTO v_Taxi_id, v_Driver_id
        FROM TAXI
        WHERE Status = 'Available'
          AND Taxi_model = Taxi_Model
          AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'No available taxi of model ' || Taxi_Model);
    END;

    -- Insert customer details
    INSERT INTO USER_TBL
    VALUES (v_usr_id, SUBSTR(Name, 1, INSTR(Name, ' ', 1)), 
            SUBSTR(Name, INSTR(Name, ' ', 1) + 1, LENGTH(Name)), 
            v_Contact, v_Gender, v_Address, v_Email, SYSDATE, v_Taxi_id);

    -- Insert trip details
    INSERT INTO TRIP_DETAILS
    VALUES (v_Trip_id, SYSDATE, 0, v_Driver_id, v_usr_id, v_Taxi_id, SYSTIMESTAMP, NULL);

    -- Insert bill details
    INSERT INTO BILL_DETAILS
    VALUES (v_Bill_no, NULL, Advance, 0, NULL, 'Pending', v_usr_id, v_Trip_id);

    -- Update taxi status
    UPDATE TAXI SET Status = 'Booked' WHERE Taxi_id = v_Taxi_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Taxi booked successfully. Taxi ID: ' || v_Taxi_id || ', Trip ID: ' || v_Trip_id);
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/