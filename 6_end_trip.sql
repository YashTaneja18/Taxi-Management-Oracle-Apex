CREATE OR REPLACE PROCEDURE END_TRIP (
    v_Trip_id IN INTEGER,
    v_Discount IN DECIMAL DEFAULT 0
) AS
    v_total_time NUMBER; -- In hours
    v_fare DECIMAL(10,2);
    v_rate_per_hour CONSTANT DECIMAL := 15; -- Rs.15/hour
BEGIN
    -- Update end time if not already set
    UPDATE TRIP_DETAILS
    SET End_time = SYSTIMESTAMP
    WHERE Trip_id = v_Trip_id AND End_time IS NULL;

    -- Calculate total trip time in hours
    SELECT EXTRACT(HOUR FROM (End_time - Strt_time)) + 
           EXTRACT(MINUTE FROM (End_time - Strt_time)) / 60
    INTO v_total_time
    FROM TRIP_DETAILS
    WHERE Trip_id = v_Trip_id;

    -- Calculate fare
    v_fare := v_total_time * v_rate_per_hour;

    -- Update bill details
    UPDATE BILL_DETAILS
    SET Bill_date = SYSDATE,
        Discount_amt = v_Discount,
        Total_amt = v_fare - v_Discount
    WHERE Trip_id = v_Trip_id;

    -- Free the taxi
    UPDATE TAXI
    SET Status = 'Available'
    WHERE Taxi_id = (SELECT Taxi_id FROM TRIP_DETAILS WHERE Trip_id = v_Trip_id);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Trip ' || v_Trip_id || ' ended. Total fare: $' || (v_fare - v_Discount));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Trip ID ' || v_Trip_id || ' not found.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/