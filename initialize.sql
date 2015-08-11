drop database if exists sample;
create database sample;

GRANT ALL ON *.* TO root@'10.0.2.2' IDENTIFIED BY 'mysql';

CREATE TABLE sample.people
(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
last_name varchar(255),
first_name varchar(255),
address varchar(255),
city varchar(255)
);

insert into sample.people (last_name, first_name, address, city) values ('hocker', 'harrison', '705 N Gayoso', 'New Orleans');
