create database SEDCLEO

use SEDCLEO

create table dbo.BusinessEntity (
Id int identity (1,1),
[Name] nvarchar(100) null,
Region nvarchar(1000) null, 
Zipcode nvarchar(10) null,
Size nvarchar(10) null
)

create table dbo.Employee (
Id int identity (1,1),
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
DateOfBirth date null,
Gender nchar(1) null,
HireDate date null,
NationalIdNumber nvarchar(20) null
)

create table dbo.Product (
Id int identity (1,1),
Code nvarchar(50) null,
[Name] nvarchar(100) null,
Descrtiption nvarchar(max) null,
[Weight] decimal(18,2) null,
Price decimal(18,2) null,
Cost decimal(18,2) null
)

create table dbo.Customer (
Id int identity (1,1),
[Name] nvarchar(100) not null,
AccountNumber nvarchar(50) null,
City nvarchar (100) null,
RegionName nvarchar (100) null,
CustomerSize nvarchar (10) null,
PhoneNumber nvarchar (20) null,
isActive bit not null
)

create table dbo.[Order] (
Id bigint identity (1,1),
OrderDate datetime null,
[Status] smallint null,
BusinessEntityId int null,
CustomerId int null,
EmployeeId int null,
TotalPrice decimal(18,2) null,
Comment nvarchar(max) null
)

create table dbo.OrderDetails (
Id bigint identity (1,1),
OrderId bigint null, 
ProductId int null, 
Quantity int null,
Price decimal(18,2) null
)

