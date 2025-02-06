DROP VIEW IF EXISTS dbo.v_my_tiktok_data;  
GO  
CREATE VIEW dbo.v_my_tiktok_data AS  

/******************************************************************************************************************  
NAME:    TikTok Top 100 Analysis  
PURPOSE: This script retrieves insights from the "Top 100 TikTokers in 2025" dataset,  
         including the most followed account, total likes, and most active user.  

MODIFICATION LOG:  
Ver      Date        Author        Description  
-----   ----------   -----------   -------------------------------------------------------------------------------  
1.0     05/23/2022   JJAUSSI       1. Built this script for EC IT440  

RUNTIME:  
Xm Xs  

NOTES:  
This script is designed to analyze the top TikTok accounts in 2025, providing useful insights  
such as the most followed account, highest engagement, and top content creators.  
******************************************************************************************************************/

-- Step 1: Q: What is the most followed TikTok account?  
-- Step 2: A: Let's ask SQL Server and find out...  
 SELECT 'This is the most followed TikTok account.' AS my_message,  
       MAX(Followers) AS Most_Followers  
FROM Tiktok;
