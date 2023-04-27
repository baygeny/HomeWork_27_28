create database MyDB;
create table employee_name_phone (
id int auto_increment,
name varchar(40),
phone varchar(30),
primary key (id));
insert into employee_name_phone
(name, phone)
values
('Grigorenko N.', '+380958475994'),
('Petrenko A.', '+380668407238'),
('Sidorenko V.', '+380964596702'),
('Stepanenko S.', '+380986840633'),
('Ivanenko F.', '+380669430255'),
('Andrienko O.', '+380503497502');

create table employee_job_salary (
id int auto_increment,
job varchar (20),
salary int,
primary key (id));
insert into employee_job_salary
(job, salary)
values
('director', 25000),
('accountant', 13000),
('manager', 15000),
('driver1', 9000),
('driver2', 8000),
('cleaner', 5000);

create table job_birthday_address (
id int auto_increment,
job varchar (20),
birthday varchar (20),
address varchar (40),
primary key (id));
insert into job_birthday_address
(job, birthday, address)
values
('director', '25.11.1974', 'str. Second, 44, apt. 56, Kharkiv'),
('accounter', '09.03.1990', 'str. Fourth, 55, apt. 123, Kharkiv'),
('manager', '29.02.1991', 'str. Sixth, 43, apt. 98, Kharkiv'),
('cleaner', '04.07.1985', 'str. Third, 60, apt. 44, Kharkiv'),
('driver1', '12.03.1980', 'str. First, 25, apt. 3, Kharkiv'),
('driver2', '17,05,1989', 'str. Fifth, 222, apt. 32, Kharkiv');
use MyDB;
select id from employee_job_salary
where salary > 10000;






