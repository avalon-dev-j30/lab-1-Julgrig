/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */

create table UserInfo
(
id int primary key, 
name varchar (255),
surname varchar (255)
);

create table Roles
(
id int unique not null,
name varchar(255) primary key

);

create table Users
( 
id int not null unique generated always as identity 
(start with 1, increment by 1),
email varchar(255) primary key not null,
password varchar(255) not null,
info int not null unique references Userinfo(id),
role int not null references Roles(id)
);

create table Orders
( 
id int not null generated always as identity 
(start with 1, increment by 1) primary key,
users int not null references Users(id),
created timestamp not null
);

create table Supplier
(
id int not null generated always as identity 
(start with 1, increment by 1) unique, 
name varchar(255) not null primary key,
address varchar(255),
phone varchar(255)not null,
representative varchar(255)
);

create table Product
(
id int not null generated always as identity 
(start with 1, increment by 1) unique, 
code varchar(255) not null primary key,
title varchar(255)not null,
supplier int not null references Supplier(id),
initial_price double not null,
retail_value double not null
);


create table Order2Product
(
orders int not null references Orders(id),
product int not null references Product(id),
primary key(orders, product)
 
);

insert into UserInfo (id, name, surname) values
(1, 'Андрей', 'Петров'),
(2, 'Артем', 'Иванов'),
(3, 'Семен', 'Васильев'); 


insert into Roles (id, name) values
(1, 'Администратор' ),
(2, 'Заказчик');

insert into Users(email, password, info, role) values 
('APetrov@gmail.com', '1111', 1, 2),
('AIvanov@gmail.com', '22333', 2, 1),
('SVasilyev@gmail.com', '34444', 2,1);


insert into Orders (users, created) values
(1, '2019-04-03, 12:00:00'),
(2, '2019-05-03, 12:30:05'),
(3, '2019-06-05, 12:35:00';

insert into Supplier (name, address, phone, representative) values
('Рональд Макдональд', 'Санкт-Петербург, Митрофаньевское шоссе 5',
 '+7(812)555-32-43', 'Рональд' ),
('Макдональд', 'Санкт-Петербург, Московское шоссе 5',
 '+7(812)556-32-43', 'Макдональд' ),
('Еда', 'Санкт-Петербург, Гражданский пр 15',
 '+7(812)711-32-43', 'Рональд' );

insert into Product (code, title, supplier, initial_price, retail_value) values
('11111', 'Апельсины', 1, 50.0, 100.0),
('22222', 'Мандарины', 2, 80.0, 140.0),
('33333', 'Лимоны', 3, 12.0, 30.0);

insert into Order2Product (orders, product) values
(1,1),
(2,3), 
(3,1);




