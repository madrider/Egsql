
-- Using Default Constraint
drop table ToBeDeleted1
create table ToBeDeleted1
(
 col1 int,
 col2 varchar(20) NOT NULL DEFAULT 'UNKNOWN'
)

insert into ToBeDeleted1(col1) values (1);
insert into ToBeDeleted1(col1) values (2);
insert into ToBeDeleted1(col1) values (3);

select * from ToBeDeleted1

DELETE ToBeDeleted1 
TRUNCATE TABLE  ToBeDeleted1 



--------------------------------------------------------------------------------
-- Using Check Constraint 

create table Tbl2
(
pub_id char(4) check ( pub_id in('1234', '4321', '1212') ),
pub_name varchar(40)
)

insert into tbl2 values('1234', 'Pname1')
insert into tbl2 values('4321', 'Pname2')
insert into tbl2 values('1212', 'Pname3')
insert into tbl2 values('123', 'Pname4')
insert into tbl2 values('2344', 'Pname5')

select * from tbl2

----------------------------------------------------------------------------------

-- * Create table Department_132419 with following fields.
	-- DeptId (int) PK, DeptName (string), Location (string)
-- * Insert 3 Sample records in the above table using insert query.

drop type Location

create type Location
from varchar(30) not null

create default DF_Location as 'UNKNOWN'

EXEC SP_BinDefault DF_Location, Location

drop table Department
create table Department
(
	DeptId int Primary Key,
	DeptName varchar(20) NOT NULL,
	Location Location
)

insert into Department values(101, 'Admin', 'Andheri');
insert into Department(DeptId, DeptName, Location) values(102, 'Operation', 'Vashi');
insert into Department(DeptId, DeptName) values(103, 'HR');

select * from Department


-- * Create table Employee_132419 with following fields.
	-- EmpId (int) PK,	EmpName (string), DOJ (date), Salary (currency), DeptId (int) FK
-- * Insert 6 Sample records in the above table using insert query.
drop table Employee
create table Employee
(
	EmpId int primary key Identity (1001, 1),
	EmpName varchar(20),
	DOJ date,
	Salary money,
	DeptId int FOREIGN KEY REFERENCES Department(DeptId)
)

insert into Employee values('Ravindra', '2017-8-31', 46000,101) -- allowed
insert into Employee values('Jayesh', '12-12-2016', 34000,102) --allowed
insert into Employee values('Harshal', '31-8-2017', 43000,102) -- not allowed
insert into Employee values('Kavita', '8-31-2017', 40000,104) -- not allowed

select * from Employee

alter table Employee
add EAddress varchar(30)

alter table Employee
add constraint df_customer_Add DEFAULT 'UNKNOWN' for EAddress

-- * Using group by query
-- * Use select query to retirve records from more than one related tables.
-- * Display records from details table based on value from master table.
-- * Retrive records based on year/month from the date field
-- * Retrive the records containing highest (number) value.
-- * Retrive the records containing in specific range