use itvedant;

create table Employee(
emp_id int,
name varchar(20),
department varchar(20),
salary varchar(30));
select * from employee;
desc employee;

set sql_safe_updates=0; 
update employee 
set department="IT"
where emp_id in(1,2);

update employee 
set department="HR"
where emp_id in(3,4);

update employee 
set department="Finance"
where emp_id in(5,6);

update employee 
set department="Admin"
where emp_id in(7,8);

select * from employee;
desc employee;

insert into employee(emp_id, name, department, salary) values
(1, "Alice", "IT", 25000),
(2, "Carol", "IT", 15000),
(3, "David", "HR", 20000),
(4, "John", "HR", 35000),
(5, "Roy", "Finance", 45000),
(6, "Anthony", "Admin", 55000),
(7, "Sam", "Finance", 28000);
select * from employee;
truncate table employee;

#Calculate total salary based on department
select department, sum(salary) from employee
group by department;

# For descending :
select department, sum(salary)  from employee
group by department order by sum(salary) desc;


select name, 
salary, 
AVG(salary) OVER() AS average_salary
From employee;




select name, 
department, 
AVG(salary) OVER(PARTITION BY DEPARTMENT) AS dept_salary 
From employee;



select name, 
salary,
row_number() 
OVER(Order by salary desc) AS row_num
From employee;



select name, 
salary,
rank() 
OVER(Order by salary desc) AS new_rank
From employee;

select name, 
salary,
dense_rank() 
OVER(Order by salary desc) AS DenseRank
From employee;

create table Post
(
user_id int,
post_id int,
likes int);


insert into post(user_id, post_id, likes) values
(101,1,10),
(101,2,20),
(102,3,15),
(102,4,25);

select * from Post;

select user_id, post_id, likes,
sum(likes) over(partition by user_id) 
as user_total_likes
from Post;


select post_id, 
likes,
row_num() over(order by likes desc) 
as new_likes
from Post;

select post_id,
likes,
rank() over(order by likes desc)
as new_rank
from Post;


select post_id,
likes,
dense_rank() over(order by likes desc)
as new_dense_rank
from Post;


create table emp
(
stud_name varchar(30)
);


truncate table emp;

#String Function 
select upper('sumit');
select concat('sanoj', ' ','Amat');
select length('sanoj');
select now();
select current_timestamp();

#Display employee details along with total number of employees.
select * from employee;
select name, sum(salary) from employee group by name; 

desc employee;
-- select 
-- emp_id,
-- name,department, salary
-- over() as Total employee




