-- EC_IT143_W4.2_Tiktok_s6_LS.sql
-- Truncate the table and insert the data from the view

TRUNCATE TABLE dbo.TiktokFollowersTable; -- Clear out the existing data
GO

INSERT INTO dbo.TiktokFollowersTable (my_message, username, Most_Followers)
SELECT 'This is the most followed TikTok account.' AS my_message,  
       username,  
       Followers AS Most_Followers  
FROM Tiktok
ORDER BY Followers DESC; 
