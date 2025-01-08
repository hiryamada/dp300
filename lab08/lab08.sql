-- 拡張イベントセッションの作成

USE MASTER

GO

CREATE EVENT SESSION [Blocking] ON SERVER 
ADD EVENT sqlserver.blocked_process_report(
ACTION(sqlserver.client_app_name,sqlserver.client_hostname,sqlserver.database_id,sqlserver.database_name,sqlserver.nt_username,sqlserver.session_id,sqlserver.sql_text,sqlserver.username))
ADD TARGET package0.ring_buffer
WITH (MAX_MEMORY=4096 KB, EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS, MAX_DISPATCH_LATENCY=30 SECONDS, MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE, TRACK_CAUSALITY=OFF,STARTUP_STATE=ON)
GO

-- Start the event session 
ALTER EVENT SESSION [Blocking] ON SERVER 
STATE = start; 
GO

EXEC sys.sp_configure N'show advanced options', 1
RECONFIGURE WITH OVERRIDE;
GO
EXEC sp_configure 'blocked process threshold (s)', 60
RECONFIGURE WITH OVERRIDE;
GO

-- ユーザー1のセッションのクエリ

USE AdventureWorks2017
GO

BEGIN TRANSACTION
    UPDATE Person.Person 
    SET LastName = LastName;

GO

-- ユーザー2のセッションのクエリ

USE AdventureWorks2017
GO

SELECT TOP (1000) [LastName]
  ,[FirstName]
  ,[Title]
FROM Person.Person
WHERE FirstName = 'David'
