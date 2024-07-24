create database user_schema;
use user_schema;
create table users(id int not null auto_increment, email varchar(30), password varchar(10), user_name varchar(10),primary key (id));

insert into users values(1,"vikas@gmail.com","abc","vikas");
insert into users values(2,"v@gmail.com","bc","s");

select * from users;
