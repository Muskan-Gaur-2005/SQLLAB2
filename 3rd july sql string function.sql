use itvedant;

#String Function
select left("Database",4);
select right("Database",4);
select trim("  Database  ");
select reverse("esabatad");
select substring("Hello",1);
select replace("Database","D","M");

select round(456,-3);
select round(456,-2);
select round(556,-2);
select floor(456.67);
select ceil(456.45);

select truncate(456.45,-2); # before decimal 2 digits 00  e.g -- 400  
select truncate(456.45,1);  # after decimal number is visble  e.g  456.4

select * from employee;
desc employee;
select emp_id, name, department, salary, if(salary>20000,"Promote","Regular") from employee;

#-------------------------COMPARISON FUNCTION -----------------------------------------------
#greatest function
select greatest(10,20,30);
#list function
select least(10,20,30);

select ifnull(null,2);
select nullif(15,6);     #(15,15)--> null,   (15,6)--first value display
select coalesce(null,null,null,30);     # display the fisrt number which is available.


#----------------------------DATE FUNCTION------------------------------------------
select curdate();
select now();

select timestampdiff(YEAR,'1982-07--1',curdate());
select timestampdiff(YEAR,'1982-07--1',curdate()) as Age;
select date_add(curdate(),interval 10 day);
select date_sub(curdate(),interval 15 day);
select date_add(curdate(),interval 10 month);
select date_sub(curdate(),interval 12 month);
select date_add(curdate(),interval 10 year);
select date_sub(curdate(),interval 12 year);  
select day('2026-07-02');
select year('2026-07-02'); 






