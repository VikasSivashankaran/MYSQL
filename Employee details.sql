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
 
 insert into employees values(0001, '20-03-03','vikas','balasubramaniam','M','13-12-23');
 insert into departments values(1, 'Civil Department');
 insert into dept_emp values(1,1,'13-12-23','13-12-25');
 insert into dept_manager values(1,1,'13-12-23','13-12-25');
 insert into titles values(1,'Manager', '13-12-23', '13-12-25');
 insert into salaries values(1,50000,'13-12-23','13-12-25');
 
 
 