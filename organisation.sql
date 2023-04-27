create database org;
use org;

drop table name_phone;
drop table salary_status;
drop table fstatus_birthday_address;

create table name_phone
(
id int auto_increment,
name varchar(15),
phone varchar(30),
primary key(id)
);

insert into name_phone
(name, phone)
values
('Andrew', '0674568734'),
('Katy', '0503459988'),
('Paul', '0974523456');

create table salary_status
(
id int auto_increment,
user_id int,
salary int,
status varchar(15),
foreign key(user_id) references name_phone(id),
primary key(id)
);

insert into salary_status
(user_id, salary, status)
values
(1, 5000, 'director'),
(2, 1000, 'manager'),
(3, 500, 'worker');

create table fstatus_birthday_address
(
id int auto_increment,
user_id int,
fstatus varchar(15),
birthday varchar(15),
address varchar(40),
foreign key(user_id) references name_phone(id),
primary key(id)
);

insert into fstatus_birthday_address
(user_id, fstatus, birthday, address)
values
(1, 'single', '21.12.90', 'Pavlova str. 50'),
(2, 'married', '04.02.95', 'Ivanova str. 34'),
(3, 'married', '22.09.85', 'Rustaveli str. 55');

select * from name_phone;
select * from salary_status;
select * from fstatus_birthday_address;

select phone, address from name_phone np
join fstatus_birthday_address fba
	on np.id = fba.user_id;
    
select phone, birthday from name_phone np
join fstatus_birthday_address fba
	on np.id = fba.user_id
where fba.fstatus = 'single';

select phone, birthday from name_phone np
join fstatus_birthday_address fba
	on np.id = fba.user_id
join salary_status ss
	on np.id = ss.user_id
where ss.status = 'manager';
