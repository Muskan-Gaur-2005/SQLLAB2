use itvedant;
select * from Student;
select count(*) from Student;
set sql_safe_updates=0;
update Student
set stud_name = "Ramesh"
where stud_id=100;

delete from Student where stud_id=100;
select * from Student;
select sum(age) from Student;
select max(age) from Student;
select min(age) from Student;
select avg(age) from Student;
select count(age) from Student;


select sum(age), max(age), min(age), avg(age), count(age) from Student;



#24th june SQL:
use itvedant;
select * from Student;


#Relational operator
select * from Student where stud_id=101;
select * from Student where stud_id>102;
select * from Student where stud_id<104;
select * from Student where stud_id>=103;
select * from Student where stud_id<=101;
select * from Student where stud_id<>101;
select * from Student where stud_id<>103;
select * from Student where stud_id<101;
select * from Student where stud_id<=101;
select * from Student where stud_id<105;

#Logical operator
select * from Student where stud_id=101 and stud_name='Mukesh';
select * from Student where stud_id=101 or stud_name='Mahesh';

select * from Student where not stud_name="Mukesh";



#Display All Student details whose id is 100 , 101, 102, 103

select * from Student where stud_id<104;

select * from Student where 
stud_id=103 or
stud_id=102 or
stud_id=101 or
stud_id=100;

select * from Student where stud_id in(100,101,102,103);
select * from Student where stud_id not in(100,101,102,103);


#25th june





