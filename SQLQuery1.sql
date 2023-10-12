/*To create a database and tables with minimum 10 field requirements for your own project, 
and then implement insert, update, select and delete operations*/

Create database Studentidcard;
USE Studentidcard;


CREATE TABLE studentinformation(
Idno INT PRIMARY KEY NOT NULL,
Name VARCHAR(20),
Age INT,
Bloodgroup VARCHAR(5),
Department VARCHAR(50),
Collegename VARCHAR(50),
Emaild VARCHAR(50),
Phoneno VARCHAR(10),
City VARCHAR(20),
Pincode VARCHAR(10),
);

INSERT INTO Studentinformation VALUES(1,'Anand',19,'o+','B.tech-IT','EME College','anand@gmail.com','7339667200','Tiruppur','641 607');



INSERT INTO Studentinformation VALUES(2,'Jotheeswaran',19,'A+','B.tech-IT','EME College','jothees@gmail.com','8213467890','Nammakal','601 604');
INSERT INTO Studentinformation VALUES(3,'Shabeer',19,'O+','B.tech-IT','EME College','shabeer@gmail.com','7567839045','Virudhachalam','652 437');
INSERT INTO Studentinformation VALUES(4,'Mugeshkannan',18,'B+','B.tech-IT','EME College','kannan@gmail.com','8590437829','Nmmakal','601 606');
INSERT INTO Studentinformation VALUES(5,'Sathishkumar',18,'AB+','B.tech-IT','EME College','sathish@gmail.com','7658412904','Tiruppur','641 607');
INSERT INTO Studentinformation VALUES(6,'Sridhar',17,'A-','B.tech-IT','EME College','sridhar@gmail.com','6345782091','Erode','631 627');
INSERT INTO Studentinformation VALUES(7,'Prakashkanna',17,'B-','B.tech-IT','EME College','pk@gmail.com','9012647839','Salem','621 681');
INSERT INTO Studentinformation VALUES(8,'Madhivannan',19,'AB-','B.tech-IT','EME College','madhivannan@gmail.com','6216487234','Kodaikannal','631 548');
INSERT INTO Studentinformation VALUES(9,'Manojkumar',18,'O+','B.tech-IT','EME College','mkumar@gmail.com','9781230967','Erode','631 437');
INSERT INTO Studentinformation VALUES(10,'Santhosh',19,'O-','B.tech-IT','EME College','santhos@gmail.com','7339667200','Gobichettpalayam','631 657');

Select*from Studentinformation;

DELETE FROM Studentinformation WHERE Idno=10;

UPDATE Studentinformation
SET Name='Thangamani', City='salem',Pincode='621 681'
WHERE Idno=9;


/*To create an employee table and how to achieve or get the second highest salary from the table*/

create table Employee(
     employeeid VARCHAR(8),
     employeename VARCHAR(20),
     employeeage INT,
	 employeesalary varchar(10),
	 employeedept varchar(20),
);

INSERT INTO Employee VALUES('E40001','PRADEEP',36,'20,000','food dept'),
    ('E40002','ASHOK',28,'30,000','health dept'),
    ('E40003','PAVAN KUMAR',28,'25,000','food dept'),
    ('E40004','SANTHOSH',25,'40,000','produdction dept'),
    ('E40005','THAMAN',26,'35,000','health dept');

	Select*from Employee;

	SELECT MAX(employeesalary) FROM Employee WHERE employeesalary < (SELECT MAX(employeesalary) FROM Employee);
	
	
	/*To perform the SQL statement for to lists the number of employees in each department.*/

	SELECT employeedept, COUNT(*)
    FROM Employee
    GROUP BY employeedept ;

create table Project(
employeeid VARCHAR(8),
projectid varchar(10),
projectname varchar(20),
projectstatus varchar(20),
);

Insert into Project values ('E40001','111','project no 1','ongoing');
Insert into Project values ('E40002','121','project no 2','completed');
Insert into Project values ('E40003','131','project no 3','partially completed');
Insert into Project values ('E40004','141','project no 4','completed');
Insert into Project values ('E40001','111','project no 1','partially completed');
Insert into Project values ('E40001','111','project no 1','completed');

Select*from Project;

/*inner join*/


SELECT employeename , employeedept, projectname
FROM Employee
 INNER JOIN Project ON Employee.employeeid = Project.employeeid;

 /*full join*/
SELECT employeename, Employee.employeesalary,projectid
FROM Employee
FULL JOIN Project
ON Employee.employeeid = Project.employeeid;


/*left join*/

SELECT employeename,employeeage, projectname, projectstatus
FROM Employee
LEFT JOIN Project
ON Employee.employeeid = Project.employeeid;

/*right join*/
SELECT Employee.employeeid, employeedept, Project.employeeid, projectid
FROM Employee
RIGHT JOIN Project
ON Employee.employeeid = Project.employeeid ;

/*To combine necessary fields from two different tables by using primary key and foreign key constraints.*/

create table Foods(
foodid int primary key,
foodname varchar(20),
foodrate varchar(10),
);

insert into Foods values(01,'parotta','50');
insert into Foods values(02,'dhosa','30');
insert into Foods values(03,'poori','40');
insert into Foods values(04,'Idly','20');
insert into Foods values (05,'Meals','60');

create table Branch(
branchname varchar(20),
branchaddress varchar(30),
foodid int,
foreign key (foodid) references Foods(foodid),

);
insert into Branch values('AMS hotel','chennai',05);
insert into Branch values ('RDX hotel','Kerala',02);
insert into Branch values('SAG hotel','Tirunelveli',01);
insert into Branch values('PSK hotel','Tiruppur',03);
insert into Branch values('AM hotel','Erode',04);

SELECT Foods.foodname,Foods.foodrate,Branch.branchname,Branch.branchaddress
FROM Foods,Branch
WHERE Foods.foodid=Branch.foodid;



create table personalinformation(id int,Name varchar(20),DOB varchar(10),Age int,City varchar(20))
create procedure spr (@id int,@Name varchar(20),@DOB varchar(10),@Age int,@City varchar(20))
as
insert into personalinformation values(@id,@Name,@DOB,@Age,@City)
execute spr 01,'Anand','22.08.2001',21,'Tiruppur'
