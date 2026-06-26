Create database ItVedant;
Use ItVedant;
Create table Student
(
stud_id int,
stud_name varchar(20),
Age int, 
Email varchar(30)
);

insert into Student values(
100 ,
'Nitesh',
24,
'Nitesh@gmail.com');

insert into Student values(
101,
'Mukesh',
20,
'Mukesh@gmail.com');

insert into Student values(102, 'Mahesh', 25, 'Mahesh@gmail.com');

insert into Student values(103, 'Suresh', 27, 'Suresh@gmail.com');
insert into Student values(104, 'Manoj', 25, 'Mahesh@gmail.com');


select * from Student;

insert into Student values
(101, 'Mahesh', 25, 'Mahesh@gmail.com'),
(102, 'Suresh', 25, 'Suresh@gmail.com'),
(103, 'Manoj', 20, 'Manoj@gmail.com');
                            

