-- Procedure to Update Customer Details
CREATE OR REPLACE PROCEDURE UPDATE_CUSTOMER (
    v_Usr_id IN INTEGER,
    v_F_name IN VARCHAR2,
    v_L_name IN VARCHAR2,
    v_Contact IN VARCHAR2,
    v_Address IN VARCHAR2,
    v_Email IN VARCHAR2
) AS
BEGIN
    UPDATE USER_TBL
    SET F_name = v_F_name,
        L_name = v_L_name,
        Contact_no = v_Contact,
        Address = v_Address,
        Email = v_Email
    WHERE Usr_id = v_Usr_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Customer ' || v_Usr_id || ' updated successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Customer ID ' || v_Usr_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- Procedure to Update Driver Details
CREATE OR REPLACE PROCEDURE UPDATE_DRIVER (
    v_Driver_id IN INTEGER,
    v_Contact IN VARCHAR2,
    v_Rating IN INTEGER,
    v_License_no IN VARCHAR2
) AS
BEGIN
    UPDATE DRIVER
    SET Contact_no = v_Contact,
        Rating = v_Rating,
        License_no = v_License_no
    WHERE Driver_id = v_Driver_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Driver ' || v_Driver_id || ' updated successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Driver ID ' || v_Driver_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/