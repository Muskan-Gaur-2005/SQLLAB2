use bankingdb;

select * from Loans;
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    lead(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS PreviousLoanAmount
FROM Loans;
select * from Loans;
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    lag(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS PreviousLoanAmount
FROM Loans;

INSERT INTO Loans (LoanID, CustomerID, LoanAmount)
VALUES
(101, 1, 500000),
(102, 2, 300000),
(103, 3, 700000),
(104, 4, 450000),
(105, 5, 600000),
(106, 6, 250000);

#Join :
#fetching , retrieving data from two or more tables / combining rows from two or more table 

#TYpes of Joins
#Inner Join
#---- Fetching only matching data 
#Syntax -- Select colName, colName, colName, from 1st table_name 
#join 2nd table_name 
#ON 
#1st table_name.commonAttribute= 2nd table_name.commonAttribute

#1) Common Attributes, 2) Same Datatype , 3)same data(compulsory)
#Outer Join--- Right , left 
#------Matching and Non Matching
#------Left :  Retrieve All data form left table and compare with right table if matching display or not matching display null on right side 
#------Right : Opposite of Left 

#Cross Join
# Natural Join
#SElf join 
# in oracle & MS SQL Full Outer join 
# IN Mysql No

select * from Customers;
select * from Accounts;


#inner
select FName, LName, Email, AccountType, Balance 
from Customers join Accounts 
ON 
Customers.CustomerID=Accounts.CustomerID;

select FName, LName, Email, AccountType, Balance 
from Customers left outer join Accounts 
ON 
Customers.CustomerID=Accounts.CustomerID;

#==================================================================================================================================================
#OUTER JOIN 
Create table Demo1(
id int,
name varchar(20)
);

insert into Demo1(id, name) values
(1, "Rakesh"),
(2, "Suresh"),
(4, "Akash"),
(5, "Varun"),
(6, "Arun");

Create table Demo2(
id int,
email varchar(20)
);

insert into Demo2(id, email) values
(1, "Rakesh@gmail.com"),
(2, "Suresh@gmail.com"),
(3, "Akash@gmail.com"),
(7, "Varun@gmail.com"),
(8, "Arun@gmail.com");

select * from Demo1;
select * from Demo2;


select name, email
from Demo1 left outer join Demo2 
ON 
Demo1.id=Demo2.id;
#left data is displaying with matching attribute


select name, email
from Demo1 right outer join Demo2 
ON 
Demo1.id=Demo2.id;
#right data is displaying with matching attribute
