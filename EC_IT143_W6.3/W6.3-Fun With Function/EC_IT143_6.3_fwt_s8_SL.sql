--Q: How to extract first name from Contact Name?
--A: Well, here is your problem...
--CustomerName =Elizabeth Lincoln → Elizabeth
--Google search:
--"How to extract first name from combined name T-SQL Stack Overflow"
--https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

SELECT 
    t.CustomerID,  
    t.ContactName,  
    dbo.udf_parse_first_name(t.ContactName) AS ContactName_first_name,  
    CASE 
        WHEN CHARINDEX(' ', t.ContactName) = 0 THEN NULL  
        ELSE RIGHT(t.ContactName, LEN(t.ContactName) - CHARINDEX(' ', t.ContactName))  
    END AS ContactName_last_name,  
    t.Address,  
    t.City,  
    t.Country  
FROM dbo.t_w3_schools_customers AS t  
ORDER BY 3;

