create database office;
show databases;
use office;

create table supplier(sid int, sname varchar(30), city varchar(20), PRIMARY KEY(sid));
create table parts(pid int, pname varchar(30), color varchar(10), PRIMARY KEY(pid));
create table catalog(sid int, pid int, cost int, PRIMARY KEY(sid,pid), FOREIGN KEY(sid) REFERENCES supplier(sid), FOREIGN KEY(pid) REFERENCES parts(pid));


insert into supplier values(10001, 'Acme Widget', 'Bangalore'),
(10002, 'Johns', 'Kolkata'),
(10003, 'Vimal', 'Mumbai'),
(10004, 'Reliance', 'Delhi');

select * from supplier;

insert into parts values(20001, 'Book', 'Red'),
(20002, 'Pen', 'Red'),
(20003, 'Pencil', 'Green'),
(20004, 'Mobile', 'Green'),
(20005, 'Charger', 'Black');

select * from parts;

insert into catalog values(10001,20001,10),
(10001,20002,10),
(10001,20003,30),
(10001,20004,10),
(10001,20005,10),
(10002,20001,10),
(10002,20002,20),
(10003,20003,30),
(10004,20003,40);

select * from catalog;

select distinct supplier.sid
from supplier, parts, catalog
where parts.color='red' or parts.color='green' and supplier.sid=catalog.sid and parts.pid=catalog.pid;

select distinct supplier.sid
from supplier,parts, catalog
where supplier.sid=catalog.sid and parts.pid=catalog.pid and parts.color='red' or supplier.city='Bangalore';

select c1.sid, c1.cost, c2.sid, c2.cost
from catalog c1, catalog c2
where c1.cost > c2.cost;

select c1.sid, c1.cost, c2.sid, c2.cost
from catalog c1, catalog c2
where c1.cost > c2.cost and c1.pid=c2.pid and c1.sid <> c2.sid;

