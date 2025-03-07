-- Trigger to Update Driver Rating Based on Feedback
CREATE OR REPLACE TRIGGER UPDATE_DRIVER_RATING
AFTER INSERT ON FEEDBACK
FOR EACH ROW
WHEN (NEW.Message LIKE '%Bad Driver%')
BEGIN
    UPDATE DRIVER 
    SET Rating = Rating - 1
    WHERE Driver_id = (SELECT Driver_id FROM TRIP_DETAILS WHERE Trip_id = :NEW.Trip_id);
    DBMS_OUTPUT.PUT_LINE('Driver rating updated due to feedback.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in trigger: ' || SQLERRM);
END;
/

-- Trigger to Update Number of Cars in OWNS
CREATE OR REPLACE TRIGGER ADD_NO_OF_CARS
BEFORE INSERT OR UPDATE ON OWNS
FOR EACH ROW
DECLARE
    v_no_of_cars INT;
BEGIN
    SELECT COUNT(Taxi_id) 
    INTO v_no_of_cars 
    FROM OWNER_TAXI 
    WHERE Owner_id = :NEW.Owner_id;
    :NEW.No_Cars := v_no_of_cars;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        :NEW.No_Cars := 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in trigger: ' || SQLERRM);
END;
/