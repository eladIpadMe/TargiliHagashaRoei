

--1
select [FirstName], [LastName], [HomePhone]
from Employees e
where e.Country != 'UK'

--2
select *
from Products p
where p.UnitPrice > 10 and p.UnitsInStock > 2
order by p.UnitPrice

--3
select [FirstName], [LastName], [HomePhone]
from Employees e
where year(e.HireDate) = 1992 or year(e.HireDate) = 1993

--4
select [ProductName],s.CompanyName, [UnitsInStock]
from Products p join  [dbo].[Suppliers] s on p.SupplierID = s.SupplierID 
where p.UnitsInStock >= 15 and (p.ProductName like 'B%' OR  p.ProductName like 'C%' OR  p.ProductName like 'M%')

--5

select *
from Products p join Categories C on p.CategoryID = C.CategoryID
where C.CategoryName = 'Meat/Poultry' or  C.CategoryName = 'Dairy Products'
order by p.ProductName

--6
select C.CategoryName, p.ProductName, (p.UnitPrice * p.UnitsInStock) 'Money_to_be_earn'
from Products p join Categories C on p.CategoryID = C.CategoryID 
order by (p.UnitPrice * p.UnitsInStock) desc

--7
select distinct e.FirstName, e.LastName, c.CategoryName
from Employees e join Orders o on e.EmployeeID = o.EmployeeID 
join [Order Details] od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
join Categories c on p.CategoryID = c.CategoryID


--8
select [FirstName], [LastName], [HomePhone], [BirthDate]
from Employees e
where (year(getdate()) - year((e.BirthDate))) > 35



--9
select e.EmployeeID, e.FirstName, p.ProductName, sum(od.Quantity) 'sum_quantity'
from Employees e join Orders o on e.EmployeeID = o.EmployeeID 
join [Order Details] od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
group by e.EmployeeID,e.FirstName, p.ProductName

--10
select [CompanyName] 'CustomerName', o.OrderID 'OrderId', p.ProductName 'ProductName', od.Quantity, od.UnitPrice, od.Quantity * od.UnitPrice 'Total price', DATEDIFF(day, o.OrderDate, o.ShippedDate) AS DateDiff
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
order by o.OrderID


--11
select c.CustomerID, c.CompanyName, sum( od.Quantity * od.UnitPrice * (1 - od.Discount )) 'sum_of'
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID 
group by c.CustomerID, c.CompanyName


--12
select distinct o.OrderID
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
where  od.Quantity > p.UnitsInStock * 0.1

--13
select e.Country , count(*) 'NumberInEachCountry', avg(DATEDIFF(day, e.BirthDate, getdate()) / 365.0)  'number_in_each_country'
from Employees e
group by e.Country

--14
select  sum(od.Quantity * od.UnitPrice * (1- od.Discount) * 0.05) 'Discount for Londoners'
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
where c.City like '%ondon%' and DATEDIFF(day, o.OrderDate , o.ShippedDate) >= 5



--15
select p.ProductID,p.ProductName, p.UnitsInStock, p.UnitPrice, (p.UnitPrice * p.UnitsInStock) 'TotalValue'
from Products p join [dbo].[Order Details] od on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName, p.UnitsInStock, p.UnitPrice,  (p.UnitPrice * p.UnitsInStock) 
having sum(od.Quantity) > 500

--16
select sum(od.Quantity * od.UnitPrice * (1- od.Discount)) 'TotalPricePaid'
from Employees e join Orders o on e.EmployeeID = o.EmployeeID join [Order Details] od on o.OrderID = od.OrderID
where o.ShippedDate is null
group by e.EmployeeID

--17
select   c.CategoryID, c.CategoryName, year(o.OrderDate), sum(od.Quantity * od.UnitPrice * (1- od.Discount)) 'totalSaleRev'
from Categories c join Products p on c.CategoryID = p.CategoryID join [Order Details] od on p.ProductID = od.ProductID join Orders o on od.OrderID = o.OrderID
where year(o.OrderDate) is not null
group by c.CategoryID, c.CategoryName, year(o.OrderDate)

--18
select top 1 p.ProductID, p.ProductName, sum(od.Quantity) 'NumberOfItems'
from Products p join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName
order by  sum(od.Quantity) desc

--19
select top 1 p.ProductID, p.ProductName, sum(od.Quantity * od.UnitPrice * (1- od.Discount)) 'TotalPriceEarned'
from Products p join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName
order by  sum(od.Quantity * od.UnitPrice * (1- od.Discount)) desc

--20

with avgCategoryPrice as 
(select p.CategoryID, avg(p.UnitPrice) 'avg_unit_price'
from Products p
group by  p.CategoryID)


select  p.ProductID, p.ProductName
from Products p, avgCategoryPrice a
where p.CategoryID = a.CategoryID and p.UnitPrice > a.avg_unit_price


--21

with sumOfOrdersInACity as 
(select c.City, sum(od.Quantity * od.UnitPrice * (1- od.Discount)) 'sum_of_orders'
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
group by  c.City)



select distinct c.city ,s.sum_of_orders / e.counted_years 'yearly income avg'
from Customers c, sumOfOrdersInACity s, (select c.City, count(*) 'counted_years'
			from Customers c join Orders o on c.CustomerID = o.CustomerID  
			group by  c.City) e
 where c.City = s.City and s.City = e.City 
	order by c.City		

--22

with sumOfOrdersInAmonth as 
(select year(o.OrderDate) 'year', month(o.OrderDate) 'month' , sum(od.Quantity * od.UnitPrice * (1- od.Discount)) 'sum_of_orders_in_a_month'
from  Orders o  join [Order Details] od on o.OrderID = od.OrderID
group by year(o.OrderDate), month(o.OrderDate))



select  s.year 'year', s.month 'month', s.sum_of_orders_in_a_month / e.count_of_orders_in_a_month 'avg_sale_in_a_month'
from  sumOfOrdersInAmonth s, (select year(o.OrderDate) 'year', month(o.OrderDate) 'month' , count(*) 'count_of_orders_in_a_month'
										from  Orders o  join [Order Details] od on o.OrderID = od.OrderID
										group by  year(o.OrderDate), month(o.OrderDate)) e
 where s.year = e.year and s.month = e.month
 order by s.year, s.month


 --23

 select od.ProductID, od.OrderID, od.Quantity
 from (select p.ProductID,  max(od.Quantity) 'Quantity'
		from Products p join [Order Details] od on p.ProductID = od.ProductID
		 group by p.ProductID) k , [Order Details] od
 where k.ProductID = od.ProductID and k.Quantity = od.Quantity
 order by k.ProductID
 

 
--24
with something as
(select b.yearr, max(b.sum_of_orders_in_a_year_of_cust) 'somecol'
from		(select year(o.OrderDate) 'yearr', c.CustomerID , sum(od.Quantity * od.UnitPrice * (1- od.Discount)) 'sum_of_orders_in_a_year_of_cust'
			from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
			group by year(o.OrderDate), c.CustomerID) b
group by b.yearr
 )

 select b.yearr, b.CustomerID, b.sum_of_orders_in_a_year_of_cust
 from something s, (select year(o.OrderDate) 'yearr', c.CustomerID , sum(od.Quantity * od.UnitPrice * (1- od.Discount)) 'sum_of_orders_in_a_year_of_cust'
			from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
			group by year(o.OrderDate), c.CustomerID) b
where s.somecol = b.sum_of_orders_in_a_year_of_cust
order by b.yearr 



-----







