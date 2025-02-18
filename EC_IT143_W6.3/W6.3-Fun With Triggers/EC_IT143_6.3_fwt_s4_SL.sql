/*****************************************************************************************************************
NAME:    T-SQL Data Manipulation
PURPOSE: Fun with Triggers

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     02/18/2025   Lormine      1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1: What should go here?
-- A1: Question goes on the previous line, intoduction to the answer goes on this line...


CREATE TRIGGER trg_customers_last_mod
ON dbo.v_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    -- Update the last_modified_date to track the latest modification time
    UPDATE dbo.v_w3_schools_customers
    SET last_modified_date = GETDATE()
    WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Inserted);
END;
