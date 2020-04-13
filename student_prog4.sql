show tables;
show databases;

create database student;
use student;


CREATE TABLE student(
        snum INT,
        sname VARCHAR(10),
        major VARCHAR(2),
        lvl VARCHAR(2),
        age INT, primary key(snum));
        
	CREATE TABLE faculty(
       fid INT,fname VARCHAR(20),
       deptid INT,
       PRIMARY KEY(fid));
       
CREATE TABLE class(
        cname VARCHAR(20),
        meets_at TIMESTAMP,
        room VARCHAR(10),
        fid INT,
        PRIMARY KEY(cname),
        FOREIGN KEY(fid) REFERENCES faculty(fid));
        
drop table class;
drop table enrolled;
        
CREATE TABLE enrolled(
        snum INT,
        cname VARCHAR(20),
        PRIMARY KEY(snum,cname),
        FOREIGN KEY(snum) REFERENCES student(snum),
        FOREIGN KEY(cname) REFERENCES class(cname));
        
INSERT INTO STUDENT VALUES(1, 'John', 'CS', 'Sr', 19),
(2, 'Smith', 'CS', 'Jr', 20),
(3 , 'Jacob', 'CV', 'Sr', 20),
(4, 'Tom ', 'CS', 'Jr', 20),
(5, 'Rahul', 'CS', 'Jr', 20),
(6, 'Rita', 'CS', 'Sr', 21);

select * from student;
select * from faculty;
select * from class;
select * from enrolled;

INSERT INTO FACULTY VALUES(11, 'Harish', 1000),
(12, 'MV', 1000),
(13 , 'Mira', 1001),
(14, 'Shiva', 1002),
(15, 'Nupur', 1000);


insert into class values('class1', '12/11/15 10:15:16', 'R1', 14);
insert into class values('class10', '12/11/15 10:15:16', 'R128', 14),
('class2', '12/11/15 10:15:20', 'R2', 12),
('class3', '12/11/15 10:15:25', 'R3', 12),
('class4', '12/11/15 20:15:20', 'R4', 14),
('class5', '12/11/15 20:15:20', 'R3', 15),
('class6', '12/11/15 13:20:20', 'R2', 14),
('class7', '12/11/15 10:10:10', 'R3', 14);


insert into enrolled values(1, 'class1'),
(2, 'class1'),
(3, 'class3'),
(4, 'class3'),
(5, 'class4'),
(1, 'class5'),
(2, 'class5'),
(3, 'class5'),
(4, 'class5'),
(5, 'class5');



SELECT DISTINCT S.sname
FROM student S, class C, enrolled E, faculty F
WHERE S.snum = E.snum AND E.cname = C.cname AND C.fid = F.fid AND
F.fname = 'Shiva' AND S.lvl = 'Jr';

SELECT C.cname
FROM Class C
WHERE C.room = 'R128'
OR C.cname IN (SELECT E.cname
		FROM Enrolled E
		GROUP BY E.cname
		HAVING COUNT(*) >= 5);
        
SELECT DISTINCT S.sname
FROM Student S
WHERE S.snum IN (SELECT E1.snum
			FROM Enrolled E1, Enrolled E2, Class C1, Class C2
			WHERE E1.snum = E2.snum AND E1.cname <> E2.cname
			AND E1.cname = C1.cname
			AND E2.cname = C2.cname AND C1.meets_at = C2.meets_at);
            
SELECT DISTINCT F.fname
FROM Faculty F
WHERE NOT EXISTS ((SELECT C.room FROM Class C )
				except
				(SELECT C1.room
				FROM Class C1
				WHERE C1.fid = F.fid ));
                
SELECT DISTINCT F.fname
FROM Faculty F
WHERE 5 > (SELECT COUNT(E.snum)
FROM Class C, Enrolled E
WHERE C.cname = E.cname
AND C.fid = F.fid);

SELECT DISTINCT S.sname
FROM Student S
WHERE S.snum NOT IN (SELECT E.snum
FROM Enrolled E );

SELECT S.age, S.lvl
FROM Student S
GROUP BY S.age, S.lvl
HAVING S.lvl IN (SELECT S1.lvl FROM Student S1
      WHERE S1.age = S.age
GROUP BY S1.lvl, S1.age
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
FROM Student S2
WHERE s1.age = S2.age
GROUP BY S2.lvl, S2.age));
