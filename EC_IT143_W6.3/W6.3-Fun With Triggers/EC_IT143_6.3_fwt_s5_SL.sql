-- Remove test data if it exists
DELETE FROM dbo.v_w3_schools_customers
WHERE CustomerName IN ('Test Customer1', 'Test Customer2');

-- Insert test data
INSERT INTO dbo.v_w3_schools_customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Test Customer1', 'John Doe', '123 Main St', 'TestCity', '12345', 'TestCountry'),
       ('Test Customer2', 'Jane Doe', '456 Elm St', 'TestCity', '67890', 'TestCountry');

-- Check initial data
SELECT * FROM dbo.v_w3_schools_customers;

-- Update a record
UPDATE dbo.v_w3_schools_customers
SET City = 'UpdatedCity'
WHERE CustomerName = 'Test Customer1';

-- Check if the trigger worked
SELECT * FROM dbo.v_w3_schools_customers;
