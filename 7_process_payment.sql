CREATE OR REPLACE PROCEDURE PROCESS_PAYMENT (
    v_Bill_no IN INTEGER,
    v_Payment_amt IN DECIMAL
) AS
    v_total_due DECIMAL(10,2);
BEGIN
    -- Get total amount due
    SELECT Total_amt - NVL(Advance_amt, 0)
    INTO v_total_due
    FROM BILL_DETAILS
    WHERE Bill_no = v_Bill_no;

    -- Check if payment is sufficient
    IF v_Payment_amt >= v_total_due THEN
        UPDATE BILL_DETAILS
        SET Payment_status = 'Paid'
        WHERE Bill_no = v_Bill_no;
        DBMS_OUTPUT.PUT_LINE('Payment for Bill ' || v_Bill_no || ' successful. Status: Paid');
    ELSE
        UPDATE BILL_DETAILS
        SET Payment_status = 'Failed'
        WHERE Bill_no = v_Bill_no;
        DBMS_OUTPUT.PUT_LINE('Payment failed for Bill ' || v_Bill_no || '. Insufficient amount: ' || v_Payment_amt || ' due: ' || v_total_due);
    END IF;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Bill ' || v_Bill_no || ' not found.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/