-- UPDATETEXT https://docs.microsoft.com/en-us/sql/t-sql/queries/updatetext-transact-sql?view=sql-server-2017
-- UPDATETEXT [BULK] { table_name.dest_column_name dest_text_ptr }  
--   { NULL | insert_offset }  
--      { NULL | delete_length }  
--      [ WITH LOG ]  
--      [ inserted_data  
--     | { table_name.src_column_name src_text_ptr } ]  

USE pubs;  
GO  
ALTER DATABASE pubs SET RECOVERY SIMPLE;  
GO  
DECLARE @ptrval binary(16);  
SELECT @ptrval = TEXTPTR(pr_info)   
   FROM pub_info pr, publishers p  
      WHERE p.pub_id = pr.pub_id   
      AND p.pub_name = 'New Moon Books'  
UPDATETEXT pub_info.pr_info @ptrval 88 1 'b';  
GO  
ALTER DATABASE pubs SET RECOVERY FULL;  
GO  