﻿--Q: How to extract first name from Contact Name?
--A: Well, here is your problem...
--CustomerName =Elizabeth Lincoln → Elizabeth
--Google search:
--"How to extract first name from combined name T-SQL Stack Overflow"
--https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

SELECT t.ContactName,  
       LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS first_name,  
       dbo.udf_parse_first_name(t.ContactName) AS first_name2  
FROM dbo.t_w3_schools_customers AS t  
ORDER BY 1;
