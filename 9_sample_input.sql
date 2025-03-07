-- Book a taxi
EXEC BOOK_TAXI('Jane Smith', '456 Elm St', '9876543210', 'Benz 300', 'Female', 'jane@gmail.com', 50);

-- End the trip (wait a few minutes for time difference)
EXEC END_TRIP(1, 5);

-- Process payment
EXEC PROCESS_PAYMENT(1, 45);

-- Add feedback
INSERT INTO FEEDBACK VALUES (1, 'Bad Driver, slow service', 'jane@gmail.com', 1, 2, 1);

-- Update customer details
EXEC UPDATE_CUSTOMER(2, 'Jane', 'Smith', '9876543210', '789 Pine St', 'jane.smith@gmail.com');

-- Update driver details
EXEC UPDATE_DRIVER(1, '4693805870', 4, 'DL12345');