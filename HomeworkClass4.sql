-- Calculate the count of all grades per Teacher in the system

select *
from dbo.Teacher
select *
from dbo.Grade

select TeacherID, LastName, FirstName, count (Grade.Grade) as AllGradesCountByTeacher
from dbo.Teacher
join dbo.Grade on TeacherID = Grade.TeacherID
group by TeacherID, LastName, FirstName

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

select *
from dbo.Teacher
select *
from dbo.Grade
select *
from dbo.Student

select Teacher.ID, Teacher.LastName, Teacher.FirstName, count (Grade.Grade) as TeacherGradeCountForStudentsWithIdSmallerThan100
from dbo.Teacher
join dbo.Grade on Teacher.ID = Grade.TeacherID
join dbo.Student on Grade.StudentID = Student.ID
where Student.ID < 100
group by Teacher.ID, Teacher.LastName, Teacher.FirstName


-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system

select *
from dbo.Student
select *
from dbo.Grade

select Student.ID, max(Grade.Grade) as MaxGrade, AVG(Grade.Grade) as AverageGrade
from dbo.Student
join dbo.Grade on Student.ID = Grade.StudentID
group by Student.ID

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

select *
from dbo.Teacher
select *
from dbo.Grade

select Teacher.ID, Teacher.LastName, Teacher.FirstName, count(Grade.Grade) as AllGradesWithSumOver200
from dbo.Teacher
join dbo.Grade on Teacher.ID = Grade.TeacherID
group by Teacher.ID, Teacher.LastName, Teacher.FirstName
having count (Grade.Grade) > 200

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

select *
from dbo.Student
select *
from dbo.Grade

select Student.ID, count(Grade.Grade) as GradeCount, max(Grade.Grade) as MaxGrade, avg(Grade.Grade) as AvgGrade
from dbo.Student
join dbo.Grade on Student.ID = Grade.StudentID
group by Student.ID
having max(Grade.Grade) = avg(Grade.Grade)

-- List Student First Name and Last Name next to the other details from previous query

select Student.FirstName, Student.LastName, Student.ID, count(Grade.Grade) as GradeCount, max(Grade.Grade) as MaxGrade, avg(Grade.Grade) as AvgGrade
from dbo.Student
join dbo.Grade on Student.ID = Grade.StudentID
group by Student.FirstName, Student.LastName, Student.ID
having max(Grade.Grade) = avg(Grade.Grade)

-- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

select *
from dbo.Grade

create view vv_StudentGrades as
select StudentID, count(*) as GradeCount
from dbo.Grade
group by StudentID

select *
from vv_StudentGrades

-- Change the view to show Student First and Last Names instead of StudentID

alter view vv_StudentGrades as
select Student.FirstName, Student.LastName, count (*) as GradeCount
from dbo.Grade
join dbo.Student on Grade.StudentID = Student.ID
group by Student.FirstName, Student.LastName

select *
from vv_StudentGrades

-- List all rows from view ordered by biggest Grade Count

select *
from vv_StudentGrades
order by GradeCount desc