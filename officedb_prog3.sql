show tables;
show databases;

create database supplier;
use supplier;

create table suppliers(sid int PRIMARY KEY, sname varchar(20), city varchar(20));
create table parts(pid int PRIMARY KEY, pname varchar(20), color varchar(20));
create table catalog(sid int, pid int,  PRIMARY KEY(sid, pid), cost int, FOREIGN KEY(sid) references suppliers(sid), FOREIGN KEY(pid) references parts(pid));

insert into suppliers values(10001, 'Acme Widget', 'Bangalore'), 
(10002, 'Johns', 'Kolkata'), 
(10003, 'Vimal', 'Mumbai'), 
(10004, 'Reliance', 'Delhi');

select * from suppliers;

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

select distinct suppliers.sid 
from suppliers, parts, catalog 
where parts.color='red' or parts.color='green' and suppliers.sid=catalog.sid and parts.pid=catalog.pid;

select distinct suppliers.sid
from suppliers, parts, catalog
where suppliers.sid=catalog.sid and parts.pid=catalog.pid and parts.color='red' or suppliers.city='Bangalore';

select c1.sid, c1.cost,c2.sid,c2.cost
from catalog c1, catalog c2
where c1.cost > c2.cost and c1.pid=c2.pid and c1.sid <> c2.sid;

select distinct suppliers.sid
from suppliers, parts, catalog
where suppliers.sid=catalog.sid and parts.pid=catalog.pid and parts.color='red';

SELECT DISTINCT P.pname
FROM Parts P, Catalog C
  WHERE P.pid = C.pid;
  
  SELECT S.sname
    FROM Suppliers S
    WHERE NOT EXISTS ((SELECT P.pid  FROM Parts P)
            except (SELECT C.pid FROM Catalog C
            WHERE C.sid = S.sid));
            
SELECT S.sname
FROM Suppliers S
WHERE NOT EXISTS (( SELECT P.pid
FROM Parts P
WHERE P.color = 'red' )
			except
			( SELECT C.pid
			FROM Catalog C, Parts P
			WHERE C.sid = S.sid AND
			C.pid = P.pid AND P.color = 'red' ));
            





/*lab*/
show tables;
show databases;

create database office;
use office;

create table suppliers(sid int PRIMARY KEY, sname varchar(20), city varchar(20));
create table parts(pid int PRIMARY KEY, pname varchar(20), color varchar(20));
create table catalog(sid int, pid int,  PRIMARY KEY(sid, pid), cost int, FOREIGN KEY(sid) references suppliers(sid), FOREIGN KEY(pid) references parts(pid));

insert into suppliers values(10001, 'Acme Widget', 'Bangalore'), 
(10002, 'Johns', 'Kolkata'), 
(10003, 'Vimal', 'Mumbai'), 
(10004, 'Reliance', 'Delhi');

select * from suppliers;

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

select distinct suppliers.sid 
from suppliers, parts, catalog 
where parts.color='red' or parts.color='green' and suppliers.sid=catalog.sid and parts.pid=catalog.pid;

select distinct suppliers.sid
from suppliers, parts, catalog
where suppliers.sid=catalog.sid and parts.pid=catalog.pid and parts.color='red' or suppliers.city='Bangalore';

select c1.sid, c1.cost,c2.sid,c2.cost
from catalog c1, catalog c2
where c1.cost > c2.cost and c1.pid=c2.pid and c1.sid <> c2.sid;

select distinct suppliers.sid
from suppliers, parts, catalog
where suppliers.sid=catalog.sid and parts.pid=catalog.pid and parts.color='red';


