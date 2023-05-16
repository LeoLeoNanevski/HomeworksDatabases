create database SEDCACADEMYDB

use SEDCACADEMYDB
create table dbo.Students(
Id int identity (1,1),
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
DateOfBirth date not null,
EnrolledDate date null,
Gender nchar(1) null,
NationalIdNumber char(13) not null,
StudentCardNumber nvarchar(20) not null,
)

create table dbo.Teacher (
Id int identity (1,1),
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
DateOfBirth date not null,
AcademicRank nvarchar(max) null,
HireDate date null,
)

create table dbo.Grade(
Id int identity (1,1),
StudentId nvarchar(20) not null,
CourseId nvarchar(50) not null,
TeacherId nvarchar(500) not null,
Grade char(6) not null,
Comment nvarchar(max) null,
CreatedDate date null
)

create table Course(
Id int identity (1,1),
[Name] nvarchar(max) not null,
Credit int null,
AcademicYear date not null,
Semester char(2) not null
)

create table GradeDetails(
Id int identity (1,1),
GradeId char(6) not null,
AchievementTypeId nvarchar(10) null,
AchievementPoints nvarchar(100) not null,
AchievementMaxPoints char(1) null,
AchievementDate date null 
)

create table AchievementTypes(
Id int identity (1,1),
[Name] nvarchar(max) not null,
Description nvarchar(max) not null,
ParticipationRate decimal(5,2) not null
)