-- homework

-- prvo
select *
from dbo.Products

alter table dbo.Products
add constraint DF_Products_Price
default (1) for [Price] 

-- vtoro
select *
from dbo.Products

alter table dbo.Products
with check
add constraint CHK_Product_Price_vs_Cost
check (Price <= 2 * Cost)

-- treto
select *
from dbo.Products

alter table dbo.Products
with check
add constraint UC_Products_Unique_Names
unique ([Name])
-- The CREATE UNIQUE INDEX statement terminated because a duplicate key was found for the object name 'dbo.Products' and the index name 'UC_Products_Unique_Names'. The duplicate key value is (Gluten Free).
select *
from dbo.Products
update dbo.Products
set [Name] = 'Gluten Free Second'
where Code = 'Glu13'
-- The CREATE UNIQUE INDEX statement terminated because a duplicate key was found for the object name 'dbo.Products' and the index name 'UC_Products_Unique_Names'. The duplicate key value is (Multigrain).
select *
from dbo.Products
update dbo.Products
set [Name] = 'Multigrain Second'
where Id = 12