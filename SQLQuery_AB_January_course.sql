--zad.1
--CREATE DATABASE Test

--zad.2
--CREATE TABLE Student
--(
--	StudentID INT IDENTITY(1, 1) PRIMARY KEY, 
--	FirstName NVARCHAR(64) NOT NULL,
--	LastName NVARCHAR (64) NOT NULL,
--	Birth DATE
--) 

--CREATE TABLE Subject
--(
--	SubjectID INT IDENTITY(1, 1) PRIMARY KEY,
--	SubjectName NVARCHAR(64) NOT NULL
--)

--zad.3
--CREATE TABLE StudentSubject
--(
--	StudentID INT REFERENCES Student(StudentID),
--	SubjectID INT REFERENCES Subject(SubjectID),
--	PRIMARY KEY(StudentID, SubjectID)
--)

--zad.4
--diagram

--zad.5
--INSERT INTO Student (FirstName, LastName)
--VALUES ('Jan', 'Kowalski'),
--	   ('Micha³', 'Nowak'),
--	   ('Maria', 'Malinowska')

--SELECT *
--FROM StudentSubject

--zad. 6
--ALTER TABLE StudentSubject ADD Mark DECIMAL (3, 2)

--ZAD.7
--DELETE FROM Student 
--WHERE LastName = 'Kowalski'

----zad.8
--UPDATE Student 
--SET LastName = 'Nowakowski'
--WHERE LastName = 'Nowak'

--SELECT*
--FROM Student

--zad. 9
--SELECT*
--FROM Products

--zad. 10
--SELECT ProductName, QuantityPerUnit, UnitPrice
--FROM Products

--zad. 11
--SELECT P.ProductName, P.QuantityPerUnit, P.UnitPrice
--FROM Products AS P
--WHERE P. UnitPrice > 20
--AND (P.QuantityPerUnit like '%kg%'
--OR  P.QuantityPerUnit LIKE '%boxes%')

----zad. 12
--SELECT OD.*, OD.UnitPrice* OD.Quantity * (1-OD.Discount) as Wartosc
--FROM [Order Details] as OD
--WHERE  OD.UnitPrice* OD.Quantity * (1-OD.Discount) > 500 
--ORDER BY Wartosc desc

--SELECT*
--FROM [Order Details]

----zad. 13
--SELECT *
--FROM Customers
--WHERE Country IN ('Germany', 'Mexico', 'UK', 'Sweden')

--ZAD. 14
--SELECT *
--FROM Orders
--WHERE OrderDate between '20170601' and '20171231'

--zad. 15 
--SELECT TOP 15 WITH TIES
--	ProductName, 
--	UnitPrice 
--FROM Products
--ORDER BY UnitPrice DESC

--ZAD. 16
----SELECT TOP 15 WITH TIES 
--ProductName, 
--UnitPrice INTO new_table
----FROM Products
----ORDER BY UnitPrice DESC


--zad. 17
--SELECT ProductName, UnitPrice,
--CASE 
--	WHEN UnitPrice BETWEEN 0 AND 10.00 THEN '0-10.00'
--	WHEN UnitPrice BETWEEN 10.01 AND 50.00 THEN '10.01-50.00'
--	WHEN UnitPrice BETWEEN 50.01 AND 100.00 THEN '50.01-100.00'
--	WHEN UnitPrice BETWEEN 100.01 AND 200.00 THEN '100.01-200.00'
--ELSE '>200.01'
--END
--FROM Products

--zad. 18
--SELECT Title, COUNT(EmployeeID) AS LiczbaPracownikow
--FROM Employees
--GROUP BY Title

----zad. 19
--SELECT Title, Country, COUNT(*) AS LiczbaPracownikow
--FROM Employees
--GROUP BY Title, Country

--zad. 20
--SELECT Title,
--AVG (DATEDIFF (YEAR, BirthDate, GETDATE())) AS Sredni,
--MIN (DATEDIFF (YEAR, BirthDate, GETDATE())) AS Najmlodszy,
--MAX (DATEDIFF (YEAR, BirthDate, GETDATE())) AS Najstarszy
--FROM Employees
--GROUP BY Title

--ZAD. 21
--SELECT City
--FROM Customers
--WHERE Country = 'Brazil'
--GROUP BY City
--HAVING COUNT(*)>1

----ZAD. 22
--SELECT *
--FROM Customers
--WHERE City IN (
--	SELECT City
--	FROM Customers
--	WHERE Country = 'Brazil'
--	GROUP BY City
--	HAVING COUNT(*)>1
--	)

----ZAD. 23
--SELECT FirstName + ' ' + LastName AS Nazwa,
--		LEFT (FirstName, 1) + '. ' + LastName AS Nazwa2
--FROM Employees

--zad. 24
--SELECT HomePhone,
--SUBSTRING (HomePhone, 2, CHARINDEX (')', HomePhone) - 2) as NrKierunkowy,
--REPLACE (SUBSTRING (HomePhone, CHARINDEX ('), HomePhone)+2, 8), '-', '') as Numer
--FROM Employees


--SELECT
--	FirstName,
--	LastName,
--	HomePhone,
--	FirstName + ' ' + LastName AS iMIEnAZWISKO,
--	LEFT (FirstName, 1) + '. ' + LastName as 'I.Nazwisko',
--	SUBSTRING (HomePhone, 2, CHARINDEX (')', HomePhone) - 2) as NrKierunkowy,
--	REPLACE (HomePhone, '-', '') as ShortPhone
--FROM Employees


--ZAD. 25
--SELECT 
--	OrderID, 
--	OrderDate,
--	ShippedDate,
--	DATEPART (YYYY, OrderDate) AS ROK,
--	DATEPART (ISO_WEEK, OrderDate) AS WeekNUMBER,
--	DATENAME (MONTH, OrderDate) as Miesiac,
--	DATEDIFF (DAY, OrderDate, ShippedDate)
--FROM Orders


--zad. 26, 27, 28
--SELECT Country, City
--FROM Customers
----UNION ALL
----EXCEPT
----INTERSECT
--SELECT Country, City
--FROM Employees



--ZAD. 1.1.
--SELECT  
--	YEAR (OrderDate) AS Rok,
--	COUNT (OrderID) AS LiczbaZamowien
--FROM Orders
--GROUP BY YEAR (OrderDate)


--zad. 1.2
--SELECT 
--	YEAR (OrderDate) AS Rok,
--	MONTH (OrderDate) AS Miesiac,
--	COUNT (OrderID) AS LiczbaZamowien
--FROM Orders
--GROUP BY 
--	YEAR (OrderDate),
--	MONTH (OrderDate)

--zad. 1.3
--SELECT 
--	OrderID,
--	SUM (ROUND(Unitprice*Quantity* (1-Discount), 2)) as wARTOSC
--FROM [Order Details]
--GROUP BY OrderID
--HAVING SUM (Unitprice*Quantity* (1-Discount)) > 10000


--ZAD. 1.4
--SELECT 
--	Country,
--	COUNT (CustomerID) AS LiczbaKlientow
--FROM Customers
--GROUP BY Country
--ORDER BY 2 DESC


--SELECT *
--FROM Customers

--ZAD. 1.5

--SELECT 
--	ProductName,
--	UnitPrice,
--	UnitPrice * 1.05 AS NewPrice
--FROM Products
--WHERE CategoryID IN
--	(
--		SELECT CategoryID
--		FROM Categories
--		WHERE CategoryName IN ('Confections', 'Dairy Products')
--		)

--Dzieñ 2
--zad. 1
--CREATE DATABASE zlaczenia

--zad. 2
--SELECT EMP.*, CAR.Marka
--FROM EMP
--INNER JOIN CAR
--ON EMP.IdPrac = CAR.IdPrac

--zad.3, 4, 5
--SELECT *
--FROM EMP 
--FULL JOIN CAR
--ON EMP.IdPrac = CAR.IdPrac

--ZAD. 6
--SELECT 
--	EMP.Imie,
--	EMP.Nazwisko,
--	EMP.Stanowisko,
--	CAR.Marka,
--	CASE 
--	WHEN CAR.Marka IS NULL
--	THEN 'brak'
--	ELSE CAR.Marka
--	END 
--	AS Marka2,
--	IIF (CAR.Marka is null, 'brak', CAR.Marka) as Marka3,
--	ISNULL (CAR.Marka, 'BRAK') AS Marka4
--FROM EMP
--LEFT JOIN CAR
--ON EMP.IdPrac = CAR.IdPrac
--WHERE SUBSTRING (EMP.PESEL, 10, 1) IN (0, 2, 4, 6, 8)


--zad. 7
--SELECT*
--FROM HIST
--LEFT JOIN CAR
--ON HIST.NrRej = CAR.NrRej
--LEFT JOIN EMP
--ON HIST.IdPrac = EMP.IdPrac

--zad. 8
--SELECT 
--	P.ProductName,
--	P.UnitPrice,
--	P.ProductName,
--	C.Description
--FROM Products AS P
--LEFT JOIN Categories AS C
--ON P.CategoryID = C.CategoryID

--SELECT*
--FROM Categories

--ZAD. 9
--CREATE VIEW vZamowienia AS 
--SELECT
--	O.OrderID,
--	O.CustomerID,
--	O.OrderDate,
--	OD.ProductID,
--	P.ProductName,
--	OD.UnitPrice,
--	OD.Quantity,
--	OD.Discount,
--	ROUND (OD.Quantity* OD.UnitPrice* (1-OD.Discount), 2) AS Wartosc
--FROM Orders AS O
--LEFT JOIN [Order Details] AS OD
--ON O.OrderID = OD.OrderID
--LEFT JOIN Products AS P
--ON OD.ProductID = P.ProductID

--SELECT *
--FROM vZamowienia

--zad. 10
--SELECT DISTINCT
--	E.FirstName,
--	E.LastName,
--	R.RegionDescription
--FROM Employees AS E
--JOIN EmployeeTerritories AS ET
--ON E.EmployeeID = ET.EmployeeID
--JOIN Territories AS T
--ON  ET.TerritoryID = T.TerritoryID 
--JOIN Region AS R
--ON T.RegionID = R.RegionID

--ZAD. 11, 12, 13
--RANKING

--SELECT 
--	C.CategoryName, 
--	P.ProductName, 
--	P.UnitPrice,
--	ROW_NUMBER() OVER(PARTITION BY C.CategoryName ORDER BY P.UnitPrice DESC) AS ROW_NUMBER,
--	RANK() OVER (PARTITION BY C.CategoryName ORDER BY P.UnitPrice DESC) AS RANK,
--	DENSE_RANK() OVER (PARTITION BY C.CategoryName ORDER BY P.UnitPrice DESC) AS DENSE_RANK
--FROM Products AS P
--	LEFT JOIN Categories AS C
--	ON P.CategoryID = C.CategoryID

--ZAD. 14
--SELECT *
--FROM 
--		(SELECT 
--			E.FirstName,
--			E.LastName,
--			E.Country,
--			SUM (vZ.Wartosc) AS RAZEM,
--			RANK() OVER (PARTITION BY E.Country ORDER BY SUM (vZ.Wartosc)DESC) AS Ranking
--		FROM vZamowienia AS vZ
--		JOIN Orders AS O
--		ON vZ.OrderID = O.OrderID
--		JOIN Employees AS E
--		ON O.EmployeeID = E.EmployeeID
--		WHERE YEAR (vZ.OrderDate) = 2017
--		GROUP BY 
--			E.FirstName,
--			E.LastName,
--			E.Country) AS T
--	WHERE T.Ranking = 1

--ZAD. 15
--SELECT 
--	OrderID,
--	SUM(Wartosc) AS WartoscZamowienia,
--	COUNT (ProductID) AS LiczbaProduktow
--FROM vZamowienia
--GROUP BY OrderID
--HAVING SUM(Wartosc) >
----ZAPYTANIE ZWRACAJ¥CE ŒRENI¥ ZE WSZYSTKICH ZAMÓWIEÑ'
--			(SELECT 
--				AVG (WartoscZamowienia) AS SredniaWartoscZamowienia
--			FROM
--					(SELECT
--						OrderID,
--						SUM (Wartosc) AS WartoscZamowienia
--					FROM vZamowienia
--					GROUP BY OrderID) AS T)


--zad. 16, 17, 18

--SELECT 
--	DATEPART (YEAR, OrderDate) AS Rok,
--	DATEPART (QUARTER, OrderDate) AS Kwartal,
--	SUM (Wartosc) AS Razem
--FROM vZamowienia
----GROUP BY CUBE 
----GROUP BY ROLLUP
--GROUP BY GROUPING SETS
--	(
--		(DATEPART(YYYY, OrderDate), DATEPART(Q, OrderDate)),
--		(),
--		(DATEPART(Q, OrderDate))
--	)
--	ORDER BY Rok, Kwartal


--ZAD. 19


--SELECT*
--FROM 
--	(SELECT 
--		ProductName, 
--		UnitPrice
--	FROM Products) AS T1
--	LEFT JOIN 
--		(SELECT 
--			Przedzial,
--			LEFT(Przedzial, CHARINDEX('-', Przedzial) -1) as WartoscOd,
--			RIGHT (Przedzial, LEN (Przedzial) - CHARINDEX('-', Przedzial)) AS WartoscDo
--		FROM Grupy) AS T2
--ON 
--	T1.UnitPrice >= T2.WartoscOd
--AND
--	T1.UnitPrice <=WartoscDo

--ZAD. 20

--SELECT*
--FROM
--	(SELECT CustomerID
--	FROM Customers) AS T1
--CROSS JOIN
--	(SELECT TOP 12
--	ROW_NUMBER() OVER (ORDER BY CustomerID) AS NrMiesiaca
--	FROM Customers) AS T2

--EXCEPT

--	SELECT DISTINCT
--		CustomerID,
--		MONTH (OrderDate) AS Miesiac
--	FROM Orders
--	WHERE YEAR (OrderDate) = 2017

--ZAD. 21

--SELECT*
--FROM 
--(SELECT
--	T1.*,
--	DENSE_RANK() OVER (PARTITION BY T1.CustomerID ORDER BY T1.WartoscZamowienia DESC) AS Ranking
--FROM
--	(SELECT 
--		OrderID,
--		CustomerID,
--		SUM (Wartosc) AS WartoscZamowienia
--	FROM vZamowienia
--	GROUP BY OrderID, CustomerID) AS T1
--JOIN 
----ZAOYTANIE ZWRACAJ¥CE INFO O TRZECH NAJLEOSZYCH KLIENTACH
	--	(SELECT TOP 3 WITH TIES
	--		CustomerID,
	--		SUM(Wartosc) AS WartoscWszystkichZamowien
	--	FROM vZamowienia
	--	GROUP BY CustomerID
	--	ORDER BY WartoscWszystkichZamowien DESC) AS T2
	--ON T1.CustomerID = T2.CustomerID) AS T
	--WHERE 
	--Ranking BETWEEN 1 AND 3

--Zadania do samodzielnego wykonania

--zad. 1
--SELECT 
--	YEAR (OrderDate) AS ROK,
--	DATEPART(QUARTER, OrderDate) AS KWARTAL,
--	SUM (Wartosc) AS Razem,
--	COUNT (DISTINCT OrderId) AS lICZBAzAMOWIEN 
--FROM vZamowienia
--GROUP BY Wartosc, YEAR (OrderDate), DATEPART(QUARTER, OrderDate) 
--ORDER BY ROK, KWARTAL

--SELECT*
--FROM vZamowienia

--ZAD. 2

--SELECT 
--	C.CategoryName,
--	SUM (A.Quantity) AS rAZEM 
--FROM vZamowienia A
--JOIN Products B
--ON A.ProductID = B.ProductID
--JOIN Categories C
--ON B.CategoryID = C.CategoryID
--GROUP BY 
--	C.CategoryName
--ORDER BY rAZEM DESC

--ZAD. 3
--SELECT TOP 10 WITH TIES
--	ProductName,
--	SUM(Quantity) AS Razem
--FROM vZamowienia
--GROUP BY 
--	ProductName
--ORDER BY Razem DESC

--ZAD. 4

--SELECT*
--FROM 
--	(SELECT
--		B.CompanyName,
--		B.Country,
--		SUM (Quantity) AS Razem,
--		DENSE_RANK() OVER (PARTITION BY B.Country ORDER BY SUM (Quantity) DESC) as Ranking
--	FROM vZamowienia A
--	JOIN
--	Customers B
--	ON A.CustomerID = B.CustomerID
--	GROUP BY 
--		B.CompanyName,
--		B.Country) AS T
--WHERE Ranking = 1




--	DENSE_RANK() OVER (PARTITION BY T1.CustomerID ORDER BY T1.WartoscZamowienia DESC) AS Ranking
--RANK() OVER (PARTITION BY E.Country ORDER BY SUM (vZ.Wartosc)DESC) AS Ranking