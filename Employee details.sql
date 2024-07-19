create database Employee;

use Employee;

create table employees (
emp_no int not null auto_increment,
birth_date date not null,
first_name varchar(14) not null,
last_name varchar(16) not null,
gender enum('M','F') not null,
hire_date date not null,
primary key (emp_no) ) ;

create table salaries(
emp_no int not null,
salary int not null,
from_date date not null,
to_date date not null,
key (emp_no),
foreign key (emp_no) references employees(emp_no),
primary key (emp_no, from_date));
 
 create table departments(
 dept_no char(4),
 dept_name varchar(40),
 primary key (dept_no),
 unique key (dept_name));
 
 create table dept_emp(
 emp_no int not null,
 dept_no char(4) not null,
 from_date date not null,
 to_date date not null,
 key (emp_no),
 key (dept_no),
 foreign key (emp_no) references employees (emp_no),
 foreign key (dept_no) references departments (dept_no),
 primary key (emp_no,dept_no));
 
 create table dept_manager(
 dept_no char(4) not null,
 emp_no int not null,
 from_date date not null,
 to_date date not null,
 key (emp_no),
 key (dept_no),
 foreign key (emp_no) references employees (emp_no),
 foreign key (dept_no) references departments (dept_no),
 primary key (emp_no,dept_no));
 
 create table titles(
 emp_no int not null,
 title varchar(50),
 from_date date not null,
 to_date date not null,
 key (emp_no),
 foreign key (emp_no) references employees (emp_no),
 primary key (emp_no,title,from_date));
 
 insert into employees values(0002, '20-03-03','vikas','balasubramaniam','M','13-12-23');
 insert into departments values(1, 'Civil Department');
 insert into dept_emp values(1,1,'13-12-23','13-12-25');
 insert into dept_manager values(1,1,'13-12-23','13-12-25');
 insert into titles values(1,'Manager', '13-12-23', '13-12-25');
 insert into salaries values(1,50000,'13-12-23','13-12-25');
 
 update employees set first_name='Kavin' where emp_no=1;
 select * from employees;
 
 delete from dept_emp where emp_no =1;
 
-- delete from employees where emp_no = 1;
 
 -- delete from employees;
 
 -- drop table employees;
 
 select * from employees;
 
 select first_name ,hire_date, gender from employees;
 
 select distinct first_name from employees;
 
 select distinct title from titles;
 
 select distinct dept_name from departments;
 
 select * from employees where gender = "M";
 
 select * from employees order by hire_date;
 
 select * from salaries order by salary desc; -- desc means descending order the values get sorted
 
 select * from employees where first_name='vikas' and last_name='balasubramaniam';
 select * from employees;
 select * from employees where gender='M' or hire_date='2013-12-23';
 
 select * from salaries where not salary=10000;
 
 select * from employees limit 5;
 
 select max(salary) from salaries ;
 select min(salary) from salaries;
 select min(salary) as lower_salary from salaries;
 
 select count(*) from employees;
 select count(*) from employees where gender = 'M';
 
 select sum(salary) from salaries;
 select sum(salary) from salaries where from_date='21-06-22';
 select avg(salary) from salaries;
 
 select avg(salary) from salaries where from_date='21-06-22';
 
 select * from employees where first_name regexp '$vikas';  -- regural expression
 select * from employees where first_name regexp '^vikas';
 select * from employees where first_name like '___a%';

select * from employees where first_name like '%a';
select * from employees where first_name like 'a__%';
select * from employees where first_name like '%__a';

select * from salaries where salary in (10000,20000,30000);

select * from salaries where salary not in (10000,20000,30000);

select * from salaries where salary not between 10000 and 30000;

select * from salaries where salary between 10000 and 30000;

select first_name as name from employees;

-- INNER JOINS


select * from employees inner join salaries on employees.emp_no = salaries.emp_no; 

select em.first_name, sa.salary from employees as em inner join salaries as sa on em.emp_no=sa.emp_no;

-- Left JOINS
select * from employees left join salaries on employees.emp_no= salaries.emp_no;

select * from salaries;

select em.first_name, sa.salary from employees as em left join salaries as sa on em.emp_no=sa.emp_no;

-- right join 

select * from employees right join salaries on employees.emp_no=salaries.emp_no;

select em.first_name ,sa.salary from employees as em right join salaries as sa on em.emp_no=sa.emp_no;

-- cross join 

select * from employees cross join salaries on employees.emp_no=salaries.emp_no;

select em.first_name ,sa.salary from employees as em cross join salaries as sa on em.emp_no=sa.emp_no;

-- self join 
select * from employees , salaries where employees.emp_no= salaries.emp_no;

select em.first_name , sa.salary from employees as em ,salaries as sa where em.emp_no=sa.emp_no ;

-- group by keyword

select count(emp_no), title from titles group by title;

-- using keyword having

select count(emp_no),title from titles group by title having title='manager';

-- using exists keyword 

select first_name ,salary from employees , salaries where exists(select salary from salaries where salaries.emp_no=employees.emp_no and salary > 49999);

-- using any and all keyword

select first_name, last_name from employees where emp_no = any (select emp_no from titles where title = 'manager');

select first_name, last_name from employees where emp_no = all (select emp_no from titles where title = 'manager');

-- using insert into keyword 

-- insert into employees select * from employees_old

-- USING CASE STATEMENT

select emp_no ,gender,
 case 
 when gender='M' then 'Work from home' 
 when gender='F' then 'work from office' 
 else 'there is no employee' 
 end as type_of_work 
 from 
 employees;

--  to alter tabletable 

alter table employees add address varchar(255);
alter table employees drop address;

-- alter table employees modify emp_no varchar(10);

alter table employees change first_name f_name varchar(20);

-- using check and default 

CREATE TABLE employee_detail (
    emp_no INT PRIMARY KEY,
    mobile_num BIGINT NOT NULL DEFAULT 00000000,
    age INT,
    CHECK (age > 18)
);

-- date, date time 

select * from employees where hire_date='2023-11-16';
select * from employees where hire_date<'2023-11-16';
select * from employees where hire_date>'2023-11-16';
select * from employees where hire_date>'2023-11-16'and hire_date<'2023-12-10';
select * from employees where hire_date between '1997-01-00' and '1997-01-31' ;
select * from employees where month(hire_date)='02';
select * from employees where month(hire_date)='02'and year(hire_date)='2023';
select * from employees where year(hire_date)='2020';
select * from employees where hire_date between curdate()-interval 1 day and curdate();
select * from employees where time(hire_date)='20:00:00';
select * from employees where time(hire_date)>'20:00:00';
select * from employees where time(hire_date)<'20:00:00';
select * from employees where time(hire_date)>'18:00:00' and time(hire_date)<'20:00:00';
select * from employees where time(hire_date) between '18:00:00' and '18:00:00';
alter table titles drop column title;
select * from titles;

-- truncate

truncate titles;

select * from employees where hire_date in (select birth_date from dept_emp);




 