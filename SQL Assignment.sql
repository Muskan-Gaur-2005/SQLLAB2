use itvedant;
#Q1
Create Table Books(
BookID INT Primary Key,
Title Varchar(100) NOT NULL,
Author Varchar(50) NOT NULL,
Category Varchar(30),
Price decimal(8,2) check (Price>0),
Quantity Int Default 0,
PublishedYear Int ,
ISBN Varchar(20) UNIQUE
);

desc Books;


#Q2
Create Table Members(
MemberID INT Primary Key,
MemberName Varchar(50) NOT NULL,
Email Varchar(100) UNIQUE,
Phone Varchar(15),
City Varchar(30) Default "Mumbai",
JoinDate Date NOT NULL
);
desc Members;


#Q3
insert into Books(BookID, Title, Author, Category, Price, Quantity, PublishedYear, ISBN)
values
(1,'Java Programming','Raj Kumar','Programming',650,20,2022,"ISBN001"),
(2,'Python Basics','Amit Sharma','Programming',700,15,2023,"ISBN002"),
(3,'SQL Master','Neha Gupta','Programming',850,25,2021,"ISBN003"),
(4,'The Alchemist','Paulo Coelho','Novel',450,10,2019,"ISBN004"),
(5,'Wings of Fire','A.P.J. Abdul Kalam','Biography',550,30,2018,"ISBN005"),
(6,'Rich Dad Poor Dad','Robert Kiyosaki','Finance',900,12,2020,"ISBN006"),
(7,'Atomic Habits','James Clear','Self Help',1200,8,2021,"ISBN007"),
(8,'Think and Grow Rich','Napoleon Hill','Finance',800,0,2017,"ISBN008"),
(9,'C Programming','Dennis Ritchie','Programming',600,5,2015,"ISBN009"),
(10,'Ikigai','Hector Garcia','Self Help',950,18,2022,"ISBN0010");

select * from Books;


#Q4
insert into Members
(MemberID, MemberName, Email, Phone, City, JoinDate)
VALUES
(1,'Muskan','muskan1@gmail.com','9876543210','Delhi','2022-01-15'),
(2,'Rahul','rahul@gmail.com','9876543211','Mumbai','2023-03-10'),
(3,'Sneha','sneha@gmail.com','9876543212','Nagpur','2021-12-20'),
(4,'Aman','aman@gmail.com','9876543213','Hyderabad','2022-08-11'),
(5,'Riya','riya@gmail.com','9876543214','Pune','2024-02-18'),
(6,'Karan','karan@gmail.com','9876543215','Jaipur','2020-06-25'),
(7,'Priya','priya@gmail.com','9876543216','Lucknow','2023-11-05'),
(8,'Arjun','arjun@gmail.com','9876543217','Bhopal','2021-05-30');

select * from Members;

---------------------------------------------------------------
#Q5
set sql_safe_updates=0;

update Books set Price=Price*1/10
where category="Programming";

update Books set Quantity=50
where BookID=5;

update Members set city = "Pune" 
where MemberID=4;

update Members set Email = "rahul_singh@gmail.com" 
where MemberID=2;

-----------------------------------------------------------------------
#Q6
Delete from Books where BookID=9;
Delete from Books where Quantity=0;
Delete from Members where JoinDate < '2022-01-01';

-----------------------------------------------------------------------
#Q7
ALter table Books add Language VARCHAR(20);
ALter table Books add Publisher VARCHAR(50);
Alter table Books modify Title VARCHAR(150);
ALter table Books rename column Quantity TO Stock;
ALter table Books drop Language ;
----------------------------------------------------------------------
#Q8
Alter table Books Rename TO LibraryBooks;
Alter table LibraryBooks Rename TO Books;
----------------------------------------------------------------------
#Q9
Create Table Employees(
EmployeeID int primary key,
Name Varchar(50) NOT NULL,
Email Varchar(50) UNIQUE,
Salary Int Check(Salary>=15000),
Department Varchar(20) Default "HR",
ManagerID Int,
Foreign Key (ManagerID) References Employees(EmployeeID)
);

---------------------------------------------------------------------
#Q10
select count(*)  As TotalBooks from Books;
select avg(Price) AS AvgPrice from Books;
select max(Price) As HighestPrice from Books;
select min(Price) As LowestPrice from Books;
select sum(Stock) As TotalStock from Books;

select sum(Price) from Books 
where category="Programming";

select category, count(*) from Books
group by category;

select category, avg(Price) from Books
group by category;

select category, max(Price) as HighestPrice from Books 
group by category;

select category, count(*) from Books 
group by category having count(*) > 2;
-------------------------------------------------------------------------------


#Q11
select * from Books ;
select Title , Price from Books;
select * from Books where Price>500;
select * from Books where Price between 500 and 1000;
select * from Books where category="Programming";
select Price from Books order by price desc;
select * from books limit 5;
select * from Books where PublishedYear>"2020";
select * from Books where Title like "J%";
select * from Books where Author like "%Kumar";

-------------------------------------------------------------------------------------------

#Q12

#1.
select * from Books order by Price desc limit 1 offset 1;
#2.
select Category, count(*)from Books
group by Category 
having Count(*)>1;
#3.
select * from Books order by Price Desc limit 3;
#4.
select avg(price) from Books where PublishedYear>"2020";
#5.
select Category, avg(Price) from Books
group by Category
having avg(Price)>800;

---------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
#Q1
select *,
ROW_NUMBER() OVER(Order by Price)  AS RowNum from Books;

#Q2
select *,
ROW_NUMBER() OVER(Partition by Category Order by Price Desc)  AS RowNum from Books;

#Q3
SELECT *
FROM
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY Category ORDER BY Price DESC) rn
FROM Books
)t
WHERE rn=1;

#Q4
SELECT *
FROM
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY Category ORDER BY Price DESC) rn
FROM Books
)t
WHERE rn=2;

#Q5
SELECT *
FROM
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY Category ORDER BY PublishedYear DESC) rn
FROM Books
)t
WHERE rn=1;


#Q6
select *,
Rank() over(Order BY Price desc) AS RankNo
FROM Books;

#Q7
select *,
Rank() over(Partition by Category Order BY Price desc) AS RankNo
FROM Books;

#Q8
SELECT *
FROM
(
SELECT *,
RANK() OVER(ORDER BY Price DESC) r
FROM Books
)t
WHERE r<=3;


#Q9
SELECT *
FROM
(
SELECT *,
RANK() OVER(PARTITION BY Category ORDER BY Price DESC) r
FROM Books
)t
WHERE r=1;

#Q10
SELECT *
FROM
(
SELECT *,
RANK() OVER(PARTITION BY Category ORDER BY Price DESC) r
FROM Books
)t
WHERE r=2;


#Q11
SELECT *,
DENSE_RANK() OVER(ORDER BY Price DESC) AS DenseRank
FROM Books;



#Q12
SELECT *
FROM
(
SELECT *,
DENSE_RANK() OVER(ORDER BY Price DESC) dr
FROM Books
)t
WHERE dr=2;

#Q13
SELECT *
FROM
(
SELECT *,
DENSE_RANK() OVER(PARTITION BY Category ORDER BY Price DESC) dr
FROM Books
)t
WHERE dr<=2;



#Q14
SELECT Title,
Price,
RANK() OVER(ORDER BY Price DESC) AS RankNo,
DENSE_RANK() OVER(ORDER BY Price DESC) AS DenseRankNo
FROM Books;
