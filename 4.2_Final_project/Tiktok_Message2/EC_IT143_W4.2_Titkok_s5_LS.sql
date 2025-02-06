-- EC_IT143_W4.2_Tiktok_s5.1_xx.sql
-- Create a table based on the data from the view

DROP TABLE IF EXISTS dbo.TiktokFollowersTable;
GO

SELECT 'This is the most followed TikTok account.' AS my_message,  
       username,  
       Followers AS Most_Followers  
INTO dbo.TiktokFollowersTable -- Create the table here
FROM Tiktok
ORDER BY Followers DESC; 

