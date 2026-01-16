CREATE database employees;
use employees;
SHOW databases;
create table employee (
EmployeeID INT primary KEY,
FirstName VARCHAR (25) ,
LastName VARCHAR (25) ,
Position VARCHAR (50) ,
Department VARCHAR(75) ,
HireDate DATE ,
Salary DECIMAL (10,2) 
);

insert into employee(EmployeeID , FirstName, LastName, Position, Department, HireData, Salary)
values (1001, 'John', 'Chan', 'Software Engineer', 'Engineering', '2021-06-15', 85000);

insert into employee(EmployeeID , FirstName, LastName, Position, Department, HireData, Salary)
values (1002, 'Jane', 'Smith', 'Project Manager', 'Project Management', '2019-09-01', 95000),
(1003, 'Micheal', 'Brown', 'UX Designer', 'Design', '2020-03-12', 7500),
(1004, 'Emily', 'Johnson', 'Quality Assurance Analyst', 'Quality Assurance', '2022-01-10', 70000),
(1005, 'David', 'Wilson', 'DevOps Engineer', 'IT Operations', '2018-08-25', 90000);
 
update employee
set Salary = '75000'
where EmployeeID= 1003;

update employee
set HireData = '2021-06-15'
where EmployeeID= 1001;

 Select * FROM employee;
 
 update employee
 set LastName = 'Smith'
 where EmployeeID= 1004;
 
 alter table employee
 add column RetirementDate Date;
 
 update employee
 set RetirementDate = '2023-06-01'
 where EmployeeID= '1005'
 
 insert into employee(EmployeeID , FirstName, LastName, Position, Department, HireData, Salary)
 values
(1006, 'Alice', 'Hughes', 'Software Engineer', 'Engineering', '2022-02-15', 80000),
(1007, 'Robert', 'Fox', 'Project Manager', 'Project Management', '2020-05-22', 85000),
(1008, 'Maria', 'Kelley', 'UX Designer', 'Design', '2021-07-19', 100000),
(1009, 'James', 'Pena', 'Quality Assurance Analyst', 'Quality Assurance', '2023-01-10', 82000),
(1010, 'Linda', 'Gordon', 'DevOps Engineer', 'Engineering', '2019-11-08', 70000),
(1011, 'Brian', 'Hughes', 'Software Engineer', 'Project Management', '2022-03-30', 76000),
(1012, 'Nancy', 'Jordan', 'Project Manager', 'Design', '2020-09-15', 68000),
(1013, 'Kevin', 'Bishop', 'Graphic Designer', 'Engineering', '2021-04-20', 73000),
(1014, 'Carol', 'Hughes', 'Software Engineer', 'Engineering', '2018-12-01', 110000);
 
 Select * FROM employee;
 
 select Department, count(*) as countemployee
 from employee
 group by Department
 Order by countemployee DESC;
 
 select count(*) as lastnamen
 from employee
 where LastName like '%n';

select count(*) as hiredbetween2019and2021
from employee
where HireData between '2019-01-01' and '2021-12-31'

select avg(Salary) as averagesalary
from employee;
 
 select EmployeeID, (Salary - (select avg(Salary) from employee)) as differenceinsalary
 from employee

select Department, avg(salary) as averagesalary
from employee
group by Department
Order by averagesalary DESC;

SELECT EmployeeID, FirstName, LastName, Salary
FROM employee
WHERE Salary IN (
    SELECT Salary
    FROM employee
    WHERE Salary > (SELECT AVG(Salary) FROM employee)
    );