 --Create table ,attention to date format
CREATE DATABASE [Realestate]

create table SaleMan (
salemanId	int not null identity primary key,		
firstName	char (25) not null ,
lastName	char (25) not null)

create table HouseType (
categoryName  char (25) not null  primary key)

create table Specialization (
salemanId		int not null foreign key references SaleMan(salemanId) ,		
categoryName	char (25) not null foreign key references HouseType(categoryName)
Constraint PK_Specialization Primary Key (salemanId,categoryName)
)

create table Customer (
customerId		int not null identity primary key,		
firstName	char (25) not null ,
lastName	char (25) not null)



create table House (
houseId		int not null identity primary key,		
customerId	int not null foreign key references Customer(customerId),
categoryName	char (25) not null foreign key references HouseType(categoryName),
neighberhood char (25) not null,
city char (25) not null,
houseValue  money not null,
numberOfrooms  int not null,
area int not null)


create table Sale (
saleId		int not null identity primary key,
salemanId	int not null foreign key references SaleMan(salemanId) ,		
houseId	int not null foreign key references House(houseId),
buyer	int  foreign key references Customer(customerId),
price money not null,
dateOfSale date) 


--drop table Sale
--drop table House 
--drop table Customer
--drop table Specialization
--drop table HouseType
--drop table SaleMan



Insert into SaleMan  values
('Dan','Trefler'),
('Niv','Avraham'),
('Einat','Erlich'),
('Avigdor','Liberman'),
('Peter','Pen'),
('Avi','Nimni'),
('Viktor','Pacha'),
('Eivri','Levin'),
('Michael','Angelo'),
('Abas','Sona'),
('Jong','Ming'),
('Adis','Ababa'),
('Denis','Viktor'),
('Moshe','Cohen'),
('Chaim','Levi')

insert into HouseType values('Villa'),('Apartment'),('Private House'),('Penthouse Apartment'),('Mansion'),('Husha'),('Flat'),('Student Apartment'),('A'),('B'),('C'),('D'),('E'),('F'),('G')




insert into Specialization values(1,'Villa'),(1,'Apartment'),(2,'Private House'),(3,'Mansion'),(4,'Penthouse Apartment'),(5,'Flat'),(5,'Student Apartment'),(6,'Flat'),(6,'Mansion'),(6,'Student Apartment'),(7,'Apartment'),(8,'Husha'),(9,'Private House'),(11,'Apartment'),(12,'Student Apartment'),(3,'Apartment'),(13,'Husha'),(15,'Private House'),(13,'Apartment')Insert into Customer values('ramon','benfika'),('Nir','Golan'),('Dvir','Avraham'),('Einat','Elmal'),('Avigdor','Kahalani'),('Snir','Altit'),('Yotam','Cohen'),('Shemesh','Anan'),('Dikla','Peretz'),('Ruth','Levi'),('Muhamad','Abusnen'),('Ravit','Nemesh'),('Sky','Miller'),('Brad','Pit'),('Raviv','Plotner'),('Dan','Barzily')


Insert into House values(16, 'Apartment', 'Rakefet', 'Tel Aviv',100000,1,1),(1,'Apartment', 'Rakefet', 'Tel Aviv', 750000, 4, 75),(2,'Husha', 'Vered', 'Ramat Gan', 55000,  2, 35),(3,'Private House', 'Kalanit', 'Haifa',  700000, 5, 135),(4,'Mansion', 'Vered', 'Ramat Gan', 1500000, 15, 250),(5,'Flat', 'Savion', 'Beer Sheva', 45000, 1, 45),(6,'Student Apartment', 'Vered', 'Ramat Gan', 200000, 3, 80),(7,'Villa', 'Parag', 'Ashkelon', 850000, 5, 170),(8,'Private House', 'Parag', 'Ashkelon', 430000, 3, 120),(9,'Student Apartment', 'Rakefet', 'Tel Aviv', 700000, 4, 120),(10,'Penthouse Apartment', 'Narkis', 'Herzeliya', 1000000, 5, 150),(11,'Husha', 'Rakefet', 'Tel Aviv', 330000, 2, 72),(12,'Private House', 'Hartzit', 'Rishon', 75000, 3, 90),(13,'Villa', 'Narkis', 'Herzeliya', 830000, 5, 180),(14,'Apartment', 'Vered', 'Ramat Gan', 200300, 2, 66),(15,'Flat', 'Narkis', 'Herzeliya', 152900, 1, 45)

Insert into Sale values(2,1,null,200000,'1985-8-3'),
(2,16,16,200000,'1985-8-3'),

(2,8,1,200000,'1985-8-3'),
(11,7,2,350000,'2000-2-11'),(4,6,2,1000000,'2012-12-6'),(5,2,7,90000,'2013-4-14'),(6,15,8,9000000,'2010-4-15'),(12,14,9,140000,'2002-11-16'),(14,13,9,340000,'2006-12-17'),(13,10,9,60000,'2012-12-8'),(9,1,10,1600000,'2009-12-7'),(8,2,3,200000,'2016-7-8'),(7,6,6,750000,'2020-5-14'),(7,5,8,880000,'1978-7-6'),(5,3,5,970000,'1991-2-28'),(8,7,7,560000,'2013-1-15'),(8,9,13,20000,'2015-11-4'),(3,4,11,2000,'2014-1-26'),(2,6,10,1600000,'2001-5-11'),(5,14,11,780000,'2009-5-11'),(11,9,9,900000,'2015-11-14'),(5,7,5,300300,'2017-8-12'),(15,7,7,650000,'2018-10-7'),(4,7,8,550000,'2019-9-8'),(6,12,9,900000,'2007-7-15'),(3,11,13,140000,'2008-6-22'),(11,2,14,229000,'2004-5-27'),(9,3,5,260000,'2003-1-30'),(8,2,5,600000,'2009-1-31'),(2,8,1,1000000,'2022-8-3'),
(11,7,2,350000,'2022-2-11'),(4,6,2,1000000,'2022-12-6'),(5,2,7,90000,'2022-4-14'),(6,15,8,9000000,'2022-4-15'),(12,14,9,140000,'2022-11-16'),(14,13,9,340000,'2022-12-17'),(13,10,9,60000,'2022-12-8'),(9,1,10,1600000,'2022-12-7'),(8,2,3,200000,'2022-7-8'),(7,6,6,750000,'2022-5-14'),(7,5,8,880000,'2022-7-6'),(5,3,5,970000,'2022-2-28'),(8,7,7,560000,'2022-1-15'),(8,9,13,20000,'2022-11-4'),(3,4,11,2000,'2022-1-26'),(2,8,null,1000000,'2019-8-3'),
(11,7,null,350000,'2019-2-11'),
(4,6,null,1000000,'2017-12-6'),
(5,2,null,90000,'2017-4-14'),
(6,15,null,9000000,'1994-4-15'),
(12,14,null,140000,'2019-11-16'),
(14,13,null,340000,'1994-12-17'),
(13,10,null,60000,'2000-12-8'),
(9,1,null,1600000,'2019-12-7'),
(8,2,null,200000,'2017-7-8'),
(7,6,null,750000,'2019-5-14'),
(7,5,null,880000,'2015-7-6'),
(5,3,null,970000,'2015-2-28'),
(8,7,null,560000,'2000-1-15'),
(8,9,null,20000,'2000-11-4'),
(3,4,null,2000,'2015-1-26')select * from Customerselect * from Houseselect * from HouseTypeselect * from Saleselect * from SaleManselect * from Specialization--1select h.categoryName, sum(s.price) - sum(h.houseValue) 'totalProfit'from House h join Sale s on h.houseId = s.houseIdgroup by h.categoryName;

--2

with MinBuyingPrice as (
select S.Buyer, min(S.Price) 'min price' 
from Sale S 
group by S.Buyer
),
MaxSellingPrice as (
select h.customerId, max(s.Price) 'max price'
from House h join Sale S on h.houseId = s.houseId
group by h.customerId
)

select m1.buyer, m2.[max price], m1.[min price]
from MinBuyingPrice m1 join MaxSellingPrice m2 on m1.buyer = m2.customerId
where m2.[max price] - m1.[min price] > 0

--3

with avgOfNeighberhoodInAcity as
(select h.city, h.neighberhood, avg(s.price) 'avgOfSales'
from House h join sale s on h.houseId = s.houseId
group by h.city, h.neighberhood)

select top 1 a.city, a.neighberhood, a.avgOfSales
from avgOfNeighberhoodInAcity a
order by a.avgOfSales desc

--4

with yearlyProfit as(
select year(S.DateOfSale) 'year1', S.SaleManid, sm.FirstName, sm.LastName, sum (S.Price - H.HouseValue) 'profit'
from SaleMan sm join Sale S on S.SaleManid = sm.SaleManid join House H on S.HouseId = H.Houseid
group by year(S.DateOfSale), S.SaleManid, sm.FirstName, sm.LastName
),
maxYearlyProfit as(
select y.year1, max(y.profit) 'maxProfit'
from yearlyProfit y
group by y.year1
)

select y.year1, y.profit, y.SaleManid, y.FirstName, y.LastName
from yearlyProfit y join maxYearlyProfit m on y.year1 = m.year1 and y.profit = m.maxProfit
order by y.year1


--5
with currentLivingPlace as
(select h.customerId, c.firstName, c.lastName, h.city, h.area, h.numberOfrooms
from house h join customer c on h.customerId = c.customerId),

relevantDate as(
select   s.buyer,(h.houseId), h.city
from house h join Sale s on h.houseId = s.houseId 
where year(getDate()) -2 > year(s.dateOfSale) 
),

relevantSales as(
select  h.city, h.area, h.numberOfrooms
from house h join Sale s on h.houseId = s.houseId
where  s.buyer is null
)


select distinct *
from currentLivingPlace c join relevantDate r on c.customerId = r.buyer and c.city = r.city join relevantSales rs on r.city =rs.city
where (rs.area > c.area or rs.numberOfrooms > c.numberOfrooms)




