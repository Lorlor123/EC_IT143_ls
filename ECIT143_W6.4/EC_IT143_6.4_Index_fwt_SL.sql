-- 1. Analyze performance of a query before indexing
USE AdventureWorks2022;
GO

-- Query on the Person.Person table using an unindexed column
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE FirstName = 'John';


-- 2. Create the Recommended Index
USE AdventureWorks2022;
GO

-- Creating an index on FirstName to improve performance
CREATE NONCLUSTERED INDEX IX_Person_FirstName
ON Person.Person (FirstName);
GO


-- 3. Re-run the Query and Compare Performance
USE AdventureWorks2022;
GO

SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE FirstName = 'John';



USE AdventureWorks2022;
GO
-------------------------------------------------------------------------
---------------------------------------------------------------------------

--SQL Server Profiler Questions & Answers
--1. What are some use cases for SQL Server Profiler?
--SQL Server Profiler is used for:

--Performance Tuning – Identifying slow queries and missing indexes.
--Troubleshooting & Debugging – Monitoring deadlocks, blocking, and long-running queries.
--Security Auditing – Tracking unauthorized access attempts or changes to the database.
--Monitoring User Activity – Tracking SQL queries executed by different users.
--Capturing Workload for Testing – Recording real database activity for testing in another environment.


--2. What are the major steps to use SQL Server Profiler?
--To use SQL Server Profiler, follow these steps:

--Open SQL Server Profiler

--In SSMS, go to Tools → SQL Server Profiler.
--Start a New Trace

--Click File → New Trace and connect to the SQL Server instance.
--Select a Template

--Choose a predefined template (e.g., Tuning, Standard, or TSQL-Duration).
--You can also create a custom template.
--Configure Events & Filters

--Select the events you want to capture, such as SQL:BatchCompleted or SQL:StmtCompleted.
--Apply filters (e.g., capturing only slow queries taking longer than 500ms).
--Run the Trace & Capture Data

--Click Run to start capturing SQL activity.
--Let it run while executing your SQL queries.
--Analyze & Save Results

--Stop the trace and analyze the captured data.
--Save it as a .trc file or export it to a table for further analysis.

----------------------------------------------------------------------------
 -----
 ------------Another example with customer orders 

-- 1. Analyze performance of a query before indexing
-- Checking the execution plan for a slow-running query
SELECT p.ProductID, p.Name, p.ListPrice, s.Quantity
FROM Production.Product p
JOIN Production.ProductInventory s ON p.ProductID = s.ProductID
WHERE p.ListPrice > 1000;
GO

-- 2. View the execution plan (Run in SSMS)
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO
EXPLAIN SELECT p.ProductID, p.Name, p.ListPrice, s.Quantity
FROM Production.Product p
JOIN Production.ProductInventory s ON p.ProductID = s.ProductID
WHERE p.ListPrice > 1000;
GO

-- 3. Create a missing index recommended by SQL Server
CREATE NONCLUSTERED INDEX IDX_Product_ListPrice
ON Production.Product (ListPrice);
GO

-- 4. Re-execute the query after adding the index
SELECT p.ProductID, p.Name, p.ListPrice, s.Quantity
FROM Production.Product p
JOIN Production.ProductInventory s ON p.ProductID = s.ProductID
WHERE p.ListPrice > 1000;
GO