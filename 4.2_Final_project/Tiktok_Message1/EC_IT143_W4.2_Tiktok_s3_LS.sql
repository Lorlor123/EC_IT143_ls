 ---Q: What is the most Following titok account?
 
 ---A Let's ask SQL Server and find out ...
 

 SELECT 'This is the most followed TikTok account.' AS my_message,  
       MAX(Followers) AS Most_Followers  
FROM Tiktok;

