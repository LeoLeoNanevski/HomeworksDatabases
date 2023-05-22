
-- Find all Students with FirstName = Antonio
select *
from dbo.Student
where [FirstName] = 'Antonio'

-- Find all Students with DateOfBirth greater than ‘01.01.1999’
select *
from dbo.Student
where DateOfBirth >= '1999-01-01'

-- Find all Students with LastName starting With ‘J’ enrolled in January/1998
select *
from dbo.Student
where [LastName] like 'J%' and EnrolledDate like '1998%' -- tocnata sintaksa e -> where [LastName] like 'J%' and EnrolledDate like '1998-01%', ama nema takov primer pa ostaviv samo 1998 :-)

-- List all Students ordered by FirstName
select *
from dbo.Student
order by [FirstName]

-- List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
select *
from dbo.Teacher
select * 
from dbo.Student

select [LastName]
from dbo.Student
union
select [LastName]
from dbo.Teacher

-- Create Foreign key constraints from diagram or with script
-- mozda sum greshka ama mislam deka vekje bea vrzani so run na dummy tabelite :-)
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Course1] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO

ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Course1]
GO

ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Student1] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO

ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Student1]
GO

ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Teacher1] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO

ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Teacher1]
GO

ALTER TABLE [dbo].[GradeDetails]  WITH CHECK ADD  CONSTRAINT [FK_GradeDetails_AchievementType1] FOREIGN KEY([AchievementTypeID])
REFERENCES [dbo].[AchievementType] ([ID])
GO

ALTER TABLE [dbo].[GradeDetails] CHECK CONSTRAINT [FK_GradeDetails_AchievementType1]
GO

ALTER TABLE [dbo].[GradeDetails]  WITH CHECK ADD  CONSTRAINT [FK_GradeDetails_Grade1] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
GO

ALTER TABLE [dbo].[GradeDetails] CHECK CONSTRAINT [FK_GradeDetails_Grade1]
GO

-- List all possible combinations of Courses names and AchievementType names that can be passed by student

select *
from dbo.Course
select *
from dbo.AchievementType

select PS.Name as CustomerName, PS.Name as ProductName
from dbo.Customers as CS
cross join dbo.Products PS

select ATYP.[Name] as AchievementTypeName,  COUR.Name as CoursesName
from dbo.Course as COUR
cross join dbo.AchievementType as ATYP

-- List all Teachers without exam Grade

select *
from dbo.Teacher
select *
from dbo.Grade

select *
from dbo.Teacher as TE
left join dbo.Grade as GR on TE.ID=GR.TeacherID
where GR.Grade is null
