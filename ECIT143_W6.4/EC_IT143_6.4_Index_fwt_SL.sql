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
----------------------------------------------------------------------------
 ------Another example with customer orders 

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