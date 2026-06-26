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