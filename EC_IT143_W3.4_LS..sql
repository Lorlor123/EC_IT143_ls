/*
==============================================================
NAME: AdventureWorks_QA_Script.sql
AUTHOR: Lormine Stevenson
DATE: 01/31/2025
PURPOSE: Answer user questions using the AdventureWorks database
==============================================================
MODIFICATION LOG:
Version    Date       Author           Description
1.0        01/31/2025 Lormine      EC_IT143_W3.4_LS.
==============================================================
NOTES:
- This script contains questions and answers.
- Each question is commented, followed by its SQL query.
==============================================================
*/

/*
==============================================================
1. BUSINESS USER QUESTION (Marginal Complexity)
Question: List all employees with their job titles and hire dates.
==============================================================
*/
SELECT 
    e.BusinessEntityID,
    p.FirstName + ' ' + p.LastName AS FullName,
    j.JobTitle,
    e.HireDate
FROM HumanResources.Employee e
JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
JOIN HumanResources.JobTitle j ON e.JobTitle = j.JobTitle;

/*
==============================================================
2. BUSINESS USER QUESTION (Marginal Complexity)

Question: Retrieve a list of product names and their current inventory levels.
==============================================================
*/
SELECT 
    p.Name AS ProductName,
    SUM(ih.Quantity) AS InventoryLevel
FROM Production.Product p
JOIN Production.ProductInventory ih ON p.ProductID = ih.ProductID
GROUP BY p.Name
ORDER BY InventoryLevel DESC;

/*

3. BUSINESS USER QUESTION (Moderate Complexity)

Q3: Find the top 5 customers by total sales amount.
==============================================================
*/
SELECT TOP 5
    c.CustomerID,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    SUM(s.SubTotal) AS TotalSales
FROM Sales.Customer c
JOIN Sales.SalesOrderHeader s ON c.CustomerID = s.CustomerID
JOIN Person.Person p ON c.CustomerID = p.BusinessEntityID
GROUP BY c.CustomerID, p.FirstName, p.LastName
ORDER BY TotalSales DESC;

/*
==============================================================
4. BUSINESS USER QUESTION (Moderate Complexity)

Question: List employees who have worked in more than one department.
==============================================================
*/
SELECT DISTINCT
    e.BusinessEntityID,
    p.FirstName + ' ' + p.LastName AS FullName,
    COUNT(DISTINCT edh.DepartmentID) AS DepartmentCount
FROM HumanResources.Employee e
JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
GROUP BY e.BusinessEntityID, p.FirstName, p.LastName
HAVING COUNT(DISTINCT edh.DepartmentID) > 1;

/*

5. BUSINESS USER QUESTION (Increased Complexity)

Question: Generate a report of yearly sales totals by territory.
==============================================================
*/
SELECT
    YEAR(soh.OrderDate) AS SalesYear,
    t.Name AS TerritoryName,
    SUM(soh.SubTotal) AS TotalSales
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory t ON soh.TerritoryID = t.TerritoryID
GROUP BY YEAR(soh.OrderDate), t.Name
ORDER BY SalesYear, TotalSales DESC;

/*


6. BUSINESS USER QUESTION (Increased Complexity)

Question: Identify the most profitable product category.
==============================================================
*/
SELECT TOP 1
    pc.Name AS CategoryName,
    SUM(s.SubTotal) AS TotalSales
FROM Production.ProductCategory pc
JOIN Production.ProductSubcategory psc ON pc.ProductCategoryID = psc.ProductCategoryID
JOIN Production.Product p ON psc.ProductSubcategoryID = p.ProductSubcategoryID
JOIN Sales.SalesOrderDetail s ON p.ProductID = s.ProductID
GROUP BY pc.Name
ORDER BY TotalSales DESC;

/*

7. METADATA QUESTION

Question: List all tables in the AdventureWorks database.
==============================================================
*/
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

/*
8. METADATA QUESTION

Question: Retrieve column names and data types for the "Person.Person" table.
==============================================================
*/
SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Person';
