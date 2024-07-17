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