create database BankingDB;
use BankingDB;


create table Customers(
CustomerID int Primary Key,
FirstName Varchar(50),
LastName Varchar(50),
Email Varchar(50),
Phone Varchar(15),
AccountCreationDate Date 
);


Create table Accounts(
AccountID INT Primary Key,
CustomerID INT,
AccountType Varchar(20),
Balance Decimal(10,2),
Foreign key(CustomerID) References Customers(CustomerID)  );


Create Table Transactions(
TransactionID INT Primary Key,
AccountID INT,
TransactionDate Date,
Amount Decimal(10,2),
TransactionType Varchar(20),
Foreign Key(AccountId) References Accounts(AccountID));



Create Table Branches(
branchID Int Primary Key,
BranchName Varchar(100),
BranchAddress varchar(200),
BranchPhone Varchar(15));


Create Table AccountBranches(
AccountID Int,
BranchID Int,
AssignmentDate Date,
Foreign Key(AccountID) References Accounts(AccountID),
Foreign Key(BranchID) References Branches(BranchID) );




Create Table Loans(
LoanID Int Primary Key,
CustomerID Int,
LoanAmount Decimal(10,2),
Interestrate Decimal(5,2),
StartDate Date,
EndDate Date,
Foreign key(CustomerID) References Customers(CustomerID));


Describe Customers;
Describe Accounts;
Describe Transactions;
Describe Branches;
Describe AccountBranches;
Describe Loans;



show databases;
#TO VIEW LIST OF DATABASES

Alter Table Customers add DOB Date;
Describe Customers;
#Changes to do in the table or Add or Modify
Alter Table Customers modify Phone int;
Alter Table Customers modify Phone Varchar(20);


#Replace 
Alter Table Customers change column Firstname FName varchar(40);
#Alter Table Customers change column old_name new_name varchar(40);
Alter Table Customers change column Lastname LName varchar(40);


#Drop REcord 
Alter Table Customers drop DOB;
Alter Table Customers add DOB Date;

#Rename tableName
Alter Table Customers rename to CustInfo;
Alter Table CustInfo rename to Customers ; 


#Add column in middle or as we like 
Alter Table Customers add Address2 Varchar(50) after Phone;


#Remove Table 
#Drop table Customers;
#Drop database BankingDB;

#Delete from Customers ;


Insert Into Customers(CustomerID, FName, LName ,email, Address2, AccountCreationDate, Phone, Address)
Values
(1,"Rahul","Sharma", "rahul@gmail.com", "Mumbai","2025-01-10", "9899765421","Andheri"),
(2,"Ramesh","Sharma", "ramesh@gmail.com", "Mumbai","2025-02-10", "9689765421","Andheri");

desc Customers;

#use itvedant;
select * from Customers;
create table Cus_backup
(
CustomerID int ,
FName Varchar(50),
LName Varchar(50),
Email Varchar(50),
Phone Varchar(15),
Address2 varchar(50),
AccountCreationDate Date
)
select * from Customers;
#copy from one table to another 
insert into Cus_backup(CustomerID,FName, LName, email, Phone, Address2, AccountCreationDate)

select * from Cus_backup;
select CustomerID, FName , LName , Email from Customers; 

#Default in Asc
select * from Customers order by FName;
select * from Customers order by FName desc;
insert into Customers(CustomerID, FName, LName ,email, Address2, AccountCreationDate, Phone) values 
(4,"Rajesh","Sharma", "rajesh@gmail.com", "Mumbai","2025-02-10", "9689767421"),
(5,"Hiesh","Sharma", "hitesh@gmail.com", "Mumbai","2025-08-10", "9689765821"),
(6,"Rohan","Verma", "rohan@gmail.com", "Mumbai","2025-02-10", "9989765481");

select Address2 , count(FName) as Total from Customers 
group by Address2;

Alter table Customers add DOB Date;

Alter table Customers drop DOB ;

select * from Customers limit 3;

select * from Customers limit 3 offset 2;



select Address2 , count(FName) as Total from Customers 
group by Address2 having count(FName) > 10;
select * from Customers where FName like 'R%';  # start with R
select * from Customers where FName like '%h';   #End with h
select * from Customers where FName like '_a%';  # start with any single character and 2nd place must be 'a' and end with any letter.


insert into Customers(CustomerID, FName, LName, Email) values(101, "Mukesh", "Singh", "mukesh@gmail.com");
desc Customers;
select * from Customers;
select * from Customers where Phone is null;
select * from Customers where Phone is not null;
desc Accounts;
insert into Accounts(AccountID, CustomerID, AccountTYpe, Balance) values 
(100024, 1, "Savings", 2390.56),
(105634, 2, "Current", 2890.56),
(105723, 3, "Savings", 2390.56),
(104120, 4, "Current", 2000.56),
(102933, 5, "Bussiness", 120090.56),
(104832, 6, "Current", 3490);

select * from Customers where Email is null;
select * from Accounts where Amount is not null;
select * from Transactions order by Amount desc limit 3;
select * from Customers order by LName;
select * from Customers limit 3 offset 3;

select distinct(TransactionID) from Transactions;
desc Transactions;