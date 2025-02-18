-- Q1: How to keep track of when a record was last modified?
-- A1: This works for the initial INSERT...
-- ALTER TABLE dbo.v_w3_schools_customers
-- ADD last_modified_date DATETIME DEFAULT GETDATE();

-- Q2: How to keep track of when a record was last modified?
-- A2: Maybe use an AFTER UPDATE trigger?

-- Research references:
-- https://stackoverflow.com/questions/9522982/t-sql-trigger-update
-- https://stackoverflow.com/questions/4574010/how-to-create-trigger-to-keep-track-of-last-changed-data
