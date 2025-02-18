-- Q4: How to keep track of who last modified a record?
-- A4: This works for server user and the initial INSERT...
ALTER TABLE dbo.v_w3_schools_customers
ADD last_modified_by VARCHAR(50) DEFAULT SUSER_NAME();

-- Modify the trigger to update both last_modified_date and last_modified_by
CREATE TRIGGER trg_customers_last_mod
ON dbo.v_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    UPDATE dbo.v_w3_schools_customers
    SET last_modified_date = GETDATE(),
        last_modified_by = SUSER_NAME()
    WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Inserted);
END;
