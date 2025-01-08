git clone https://github.com/MicrosoftLearning/dp-300-database-administrator
New-Item "C:\LabFiles\Monitor and optimize" -ItemType Directory -ErrorAction SilentlyContinue 
cp dp-300-database-administrator/Instructions/Templates/AdventureWorks2017.bak "C:\LabFiles\Monitor and optimize"
sqlcmd -i restore.sql
