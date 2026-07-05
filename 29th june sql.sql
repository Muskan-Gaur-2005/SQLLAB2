use BankingDB;

create table EmployeeInfo
(
    emp_id int primary key auto_increment,
    emp_name varchar(20) not null,
    email varchar(40) unique,
    salary int check(salary between 15000 and 80000),
    city varchar(20) check(city in ('Mumbai','Pune','Nagpur','Nashik')),
    state varchar(20) default 'Maharashtra',
    created_at datetime default current_timestamp
);

-- Insert records
insert into EmployeeInfo(emp_name,email,salary,city)
values('Muskan','muskan@gmail.com',35000,'Mumbai');
insert into EmployeeInfo(emp_name,email,salary,city)
values('Amit','amit@gmail.com',35000,'Pune');
insert into EmployeeInfo(emp_name,email,salary,city)
values('Ajay','ajay@gmail.com',45000,'Nagpur');

select * from EmployeeInfo;




-- Update record
update EmployeeInfo
set emp_name='Aditya'
where emp_id=2;

update EmployeeInfo
set email='aditya@gmail.com'
where emp_id=2;

update EmployeeInfo
set salary=70000
where emp_id=2;





#Remove data/record
delete from EmployeeInfo where emp_id=2;
set sql_safe_updates = 0;

delete from EmployeeInfo;
insert into EmployeeInfo(emp_name,email,salary,city) values('Muskan','muskan@gmail.com',35000,'Mumbai');
truncate table EmployeeInfo;

insert into EmployeeInfo(emp_name,email,salary,city) values('Muskan','muskan@gmail.com',35000,'Mumbai');
select * from EmployeeInfo;

create table EmpInfo
(
emp_id int,
emp_name varchar(30),
email varchar(40),
salary int,
city varchar(30)
);

desc EmpInfo;

alter table EmpInfo
add constraint pk_id primary key(emp_id);

alter table EmpInfo
add constraint uk_email unique(email);

alter table EmpInfo
modify emp_name varchar(20) not null;

desc EmployeeInfo;






