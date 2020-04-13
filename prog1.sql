
show tables;
show databases;


create database insurance;
use insurance;

create table person(driver_id varchar(25), name1 varchar(25), address varchar(25), PRIMARY KEY(driver_id));
create table car(reg_num varchar(25), model varchar(25), yea int, PRIMARY KEY(reg_num));
create table accident(report_num int, accident_date date, location varchar(25), PRIMARY KEY(report_num));
create table owns(driver_id varchar(25), reg_num varchar(25), PRIMARY KEY(driver_id, reg_num), FOREIGN KEY(driver_id) REFERENCES person(driver_id), FOREIGN KEY(reg_num) REFERENCES car(reg_num));
create table participated(driver_id varchar(25), reg_num varchar(25), report_num int, damage_amount int, PRIMARY KEY(driver_id, reg_num, report_num), FOREIGN KEY(driver_id) REFERENCES person(driver_id), FOREIGN KEY(reg_num) REFERENCES car(reg_num), FOREIGN KEY(report_num) REFERENCES accident(report_num));

desc person;
desc car;desc accident;desc owns;desc participated;



insert into person values("A01", "Richard", "Srinivas nagar" );
insert into person values("A02", "Pradeep", "Rajaji nagar" );
insert into person values("A03", "Smith", "Ashok nagar" );
insert into person values("A04", "Vema", "N R Colony" );
insert into person values("A05", "Jhon", "Hanumanth nagar" );

insert into car values("KA052250", "Indica", 1990);
insert into car values("KA031181", "Lancer", 1957);
insert into car values("KA095477", "Toyota", 1998);
insert into car values("KA053408", "Honda", 2008);
insert into car values("KA041702", "Audi", 2005);

insert into participated values("A01", "KA052250", 11, 10000);
insert into participated values("A02", "KA053408", 12, 50000);
insert into participated values("A03", "KA095477", 13, 25000);
insert into participated values("A04", "KA031181", 14, 3000);
insert into participated values("A05", "KA041702", 15, 5000);

insert into accident values(11,"01-01-03","Mysore Road");
insert into accident values(12,"02-02-04","South end Circle");
insert into accident values(13,"21-01-03","Bull temple Road");
insert into accident values(14,"17-02-08","Mysore Road");
insert into accident values(15,"04-03-05","Kanakpura Road");

insert into owns values("A01","KA052250");
insert into owns values("A02","KA053408");
insert into owns values("A03","KA031181");
insert into owns values("A04","KA095477");
insert into owns values("A05","KA041702");

select * from person;
select * from car;
select * from accident;
select * from owns;
select * from participated;

update participated set damage_amount=25000 where reg_num="KA053408" AND report_num=12;
insert into accident values(16,"04-03-05","Kanakpura Road");
Select count(distinct driver_id) from participated, accident where participated.report_num=accident.report_num and accident_date like '%08';
Select count(participated.report_num) as count from participated, car where participated.reg_num = car.reg_num and car.model="Audi";
