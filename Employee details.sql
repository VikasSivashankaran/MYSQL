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

-- JOINS






 
 
 