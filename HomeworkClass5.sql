-- Declare scalar variable for storing FirstName values
---- Assign value ‘Antonio’ to the FirstName variable
---- Find all Students having FirstName same as the variable

declare @FirstName varchar(20)
set @FirstName = 'Antonio'

select * 
from dbo.Student
where FirstName = @FirstName

-- Declare table variable that will contain StudentId, StudentName and DateOfBirth
---- Fill the table variable with all Female students

select * 
from dbo.Student

declare @FemaleStudents table
(
	StudentId int,
	StudentName varchar(20),
	DateOfBirth date
)

insert into @FemaleStudents (StudentId, StudentName, DateOfBirth)
select ID, FirstName, DateOfBirth
from dbo.Student
where gender = 'F'


-- Declare temp table that will contain LastName and EnrolledDate columns
---- Fill the temp table with all Male students having First Name starting with ‘A’
---- Retrieve the students from the table which last name is with 7 characters

create table #Students 
(
	LastName varchar(50),
	EnrolledDate date
)

select *
from dbo.Student

insert into #Students (LastName, EnrolledDate)
select LastName, EnrolledDate
from dbo.Student
where Gender = 'M' and FirstName like 'A%'

select * 
from #Students
where len(LastName) = 7

-- Find all teachers whose FirstName length is less than 5 and
---- the first 3 characters of their FirstName and LastName are the same

select *
from dbo.Teacher

select * from dbo.Teacher
where len (FirstName) < 5 

select * from dbo.Teacher
where len (FirstName) < 5 and left(FirstName, 3) = left(LastName, 3)