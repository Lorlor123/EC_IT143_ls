USE AdventureWorks2022;
GO

-- 1. Analyze performance of a query before indexing
-- Checking the execution plan for a slow-running query
SELECT p.ProductID, p.Name, p.ListPrice, s.Quantity
FROM Production.Product p
JOIN Production.ProductInventory s ON p.ProductID = s.ProductID
WHERE p.ListPrice > 1000;
GO

-- 2. View the execution plan 
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

-- 5. Another example with customer orders (before indexing)
SELECT soh.SalesOrderID, soh.OrderDate, c.CustomerID, c.CompanyName
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
WHERE soh.OrderDate >= '2022-01-01';
GO

-- 6. Check execution plan for this query
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO
EXPLAIN SELECT soh.SalesOrderID, soh.OrderDate, c.CustomerID, c.CompanyName
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
WHERE soh.OrderDate >= '2022-01-01';
GO

-- 7. Create another recommended missing index
CREATE NONCLUSTERED INDEX IDX_SalesOrder_OrderDate
ON Sales.SalesOrderHeader (OrderDate);
GO

-- 8. Re-run the optimized query
SELECT soh.SalesOrderID, soh.OrderDate, c.CustomerID, c.CompanyName
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
WHERE soh.OrderDate >= '2022-01-01';
GO

-- 9. Disable execution statistics
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO
