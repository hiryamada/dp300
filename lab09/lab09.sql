-- サンプルのSELECT文

USE AdventureWorks2017
GO

SELECT BusinessEntityID, NationalIDNumber, LoginID, HireDate, JobTitle
FROM HumanResources.Employee
WHERE NationalIDNumber = 14417807;

-- データ型の変更

USE AdventureWorks2017
GO

--Dropping the index first
DROP INDEX [AK_Employee_NationalIDNumber] ON [HumanResources].[Employee]
GO

--Changing the column data type to resolve the implicit conversion warning
ALTER TABLE [HumanResources].[Employee] ALTER COLUMN [NationalIDNumber] INT NOT NULL;
GO

--Recreating the index
CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_NationalIDNumber] ON [HumanResources].[Employee]( [NationalIDNumber] ASC );
GO
