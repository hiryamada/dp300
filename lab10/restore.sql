RESTORE DATABASE AdventureWorks2017
FROM DISK = 'C:\LabFiles\Monitor and optimize\AdventureWorks2017.bak'
WITH RECOVERY,
      MOVE 'AdventureWorks2017' 
        TO 'C:\LabFiles\Monitor and optimize\AdventureWorks2017.mdf',
      MOVE 'AdventureWorks2017_log'
        TO 'C:\LabFiles\Monitor and optimize\AdventureWorks2017_log.ldf';
GO

