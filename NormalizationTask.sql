drop database Company;

create database Company;

USE Company;

create table Employees
(
	Employee varchar(200),
	Department varchar(200)    	
);

insert Employees(Employee, Department)
values
('John Doe, 1000$ salary', 'Development, access to secured data granted, Bill Gates, 10000$'),
('Jack Smith, 900$ salary', 'Accounting, access to secured data not granted, Jeff Bezos, 9000$' );

 select * from Employees;
 
 -- Не в 1NF - значения не атомарны
 
 -- 1NF:
 
drop table Employees;
 
create table Employees
(
	EmployeeName varchar(50),
	EmployeeSurname varchar(50),
   	EmplyeeSalary decimal,
    DepartmentName varchar(50),
    DepartmentSecurityAccessGranted bit,
    HeadOfDepartmentName varchar(50),
	HeadOfDepartmentSurname varchar(50),
    HeadOfDepartmentSalary decimal 
);

insert Employees(EmployeeName, EmployeeSurname, EmplyeeSalary, DepartmentName,
	DepartmentSecurityAccessGranted, HeadOfDepartmentName, HeadOfDepartmentSurname,
    HeadOfDepartmentSalary)
values
('John', 'Doe', 1000, 'Development', 1, 'Bill', 'Gates', 10000),
('Jack', 'Smith', 900, 'Accounting', 0, 'Jeff', 'Bezos', 9000);

 select * from Employees;
 
 -- Для обеспечения целостности добавим первичный ключ для таблицы Employees:
 
 alter table Employees add column EmployeeId int primary key auto_increment first;
 
  select * from Employees;
 
 -- Не в 2NF - не все столбцы зависят от первичного ключа EmployeeId 
 -- (например DepartmentSecurityAccessGranted не зависит от EmployeeId)
 
 -- 2NF:
 
 drop table Departments;
drop table Employees;
  
create table Departments
(
	Id int primary key auto_increment,
    Name varchar(50),
    SecurityAccessGranted bit,
    HeadName varchar(50),
	HeadSurname varchar(50),
    HeadSalary decimal
);

create table Employees
(
	Id int primary key auto_increment,
    Name varchar(50),
	Surname varchar(50),
   	Salary decimal,
    DepartmentId int,
    
    foreign key(DepartmentId) references Departments(Id)
);

insert Departments(Name, SecurityAccessGranted, HeadName, HeadSurname, HeadSalary)
values
('Development', 1, 'Bill', 'Gates', 10000),
('Accounting', 0, 'Jeff', 'Bezos', 9000);

insert Employees(Name, Surname, Salary, DepartmentId)
values
('John', 'Doe', 1000, 1),
('Jack', 'Smith', 900, 2);

select * from Employees;
select * from Departments;

-- не в 3NF - в таблице Departments есть зависимости от неключевого столбца

-- 3NF:

drop table Employees;
drop table Departments;
  
create table Departments
(
	Id int primary key auto_increment,
    Name varchar(50),
    SecurityAccessGranted bit
);

create table Employees
(
	Id int primary key auto_increment,
    Name varchar(50),
	Surname varchar(50),
   	Salary decimal,
    DepartmentId int,
    HeadOfDepartment bit, -- может быть добавлен constraint чтобы гарантировать только одного главу отдела
    
    foreign key(DepartmentId) references Departments(Id)
);

insert Departments(Name, SecurityAccessGranted)
values
('Development', 1),
('Accounting', 0);

insert Employees(Name, Surname, Salary, DepartmentId, HeadOfDepartment)
values
('John', 'Doe', 1000, 1, 0),
('Jack', 'Smith', 900, 2, 0),
('Bill', 'Gates', 10000, 1, 1),
('Jeff', 'Bezos', 9000, 2, 1);

select * from Employees;
select * from Departments;

-- В таблице Departments не был создан внешний ключ HeadId на таблицу Employees
-- чтобы избежать циклическую зависимость

 

 