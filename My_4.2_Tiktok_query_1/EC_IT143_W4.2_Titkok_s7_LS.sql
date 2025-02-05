-- EC_IT143_W4.2_Tiktok_s7_LS.sql
-- Creating a stored procedure to load data into the TiktokFollowersTable

CREATE PROCEDURE dbo.LoadTiktokFollowersData
AS
BEGIN
    -- Step 6: Truncate and Insert data
    TRUNCATE TABLE dbo.TiktokFollowersTable;
    GO

    INSERT INTO dbo.TiktokFollowersTable (my_message, username, Most_Followers)
    SELECT 'This is the most followed TikTok account.' AS my_message,  
           username,  
           Followers AS Most_Followers  
    FROM Tiktok
    ORDER BY Followers DESC; 
END
GO
