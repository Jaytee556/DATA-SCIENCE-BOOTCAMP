-- Creating Wine Table

Create Table Wine (
NumW INT Primary Key,
Category VARCHAR (400),
Year INT,
Degree VARCHAR (300)
);

-- Creating Producer Table

Create Table Producer (
NumP INT Primary Key,
FirstName VARCHAR (200),
LastName VARCHAR (200),
Region VARCHAR (250) 
);

-- Creating Harvest Table

Create Table Harvest (
Harvest_ID INT Primary Key,
NumW INT FOREIGN KEY (NumW) REFERENCES Wine(NumW),
NumP INT FOREIGN KEY (NumP) REFERENCES Producer (NumP),
Quantity INT 
);

-- Inserting values into the Wine Table
INSERT INTO Wine (NumW, Category, Year, Degree)
VALUES (1, 'Red Wine', 2003, 15),
		(2, 'White Wine', 2001, 12),
		(3, 'Veleta', 2005, 5),
		(4,'4th Street', 2004, 15),
		(5, 'Four Cousin', 2010, 20),
		(6, 'Pinor Nior', 2011, 25),
		(7, 'Chardonnay', 2009, 30),
		(8, 'Rosee', 2009, 35),
		(9, 'Gamay', 2015, 17),
		(10, 'Merlot', 2011, 19),
		(11, 'Riseling', 2019, 9),
		(12, 'Malbac', 2000, 29),
		(13, 'Sparkling Wine', 2001, 10),
		(14, 'Rice Wine', 1999, 40),
		(15, 'Dessert Wine', 2020, 33);
SELECT * FROM Wine

--Updating table
UPDATE Wine
set Degree = 20
WHERE NumW = 11

--Inserting values to Producer Table 
INSERT INTO Producer (NumP, FirstName, LastName, Region)
VALUES (4, 'James', 'Jack','Sousse'),
		(6,'Jim', 'Ben','Tunis'),
		(8,'Jamie', 'Song','Sousse'),
		(10,'Beck', 'Noah','El Kef'),
		(12,'Benove', 'Rage','Sousse'),
		(14,'Ovel', 'Randi','Gabes'),
		(16,'Hope', 'Uwon','Gafas'),
		(18,'Horse', 'Randy','Safax'),
		(20,'Honu', 'Rag','Testour'),
		(22,'Nana', 'Gary','Sousse'),
		(24,'Horse', 'Randy','Safax'),
		(26,'Hanti', 'Benu','Bizerte'),
		(28,'Manny', 'Deli','Mandia'),
		(30,'Victor', 'Frood', 'Zarzis'),
		(32,'Cape', 'Noah','Bardo');
SELECT * FROM Producer
ORDER BY FirstName

--Updting table
UPDATE Producer
SET Region = 'Sousse'
WHERE NumP IN (22,26,18)

-- --Inserting values to Harvest Table 
INSERT INTO Harvest(Harvest_ID, NumW, NumP, Quantity)
VALUES (1, 1, 4, 100),
		(2, 2, 6, 200),
		(3, 3, 8, 150),
		(4, 4, 10,250),
		(5, 5, 12, 300),
		(6, 6, 14, 400),
		(7, 7, 16, 100),
		(8, 8, 18, 350), 
		(9, 9, 20, 500),
		(10,10, 22, 450),
		(11, 11, 24, 300),
		(12, 12,26, 350),
		(13, 13, 28, 600),
		(14, 14, 30, 200),
		(15, 15, 32, 100);  
SELECT * FROM Harvest

--UPDATE TABLE 
UPDATE Harvest
SET Quantity = 500
WHERE NumP IN (4,8)


--LIST OF ALL PRODUCERS 
SELECT FirstName,LastName FROM Producer 

-- SORT THE NAME OF THE PRODUCERS
SELECT * FROM Producer
ORDER BY FirstName, LastName 

--LIST OF PRODUCERS IN SOUSSE
SELECT *
FROM Producer
WHERE Region = 'Sousse'

-- NUMBER OF WINE PRODUCED HAVING THE NUMBER 12
Select Wine.NumW, Wine.Category, SUM(Harvest.Quantity) AS 'total_sum'
FROM Harvest
JOIN Wine
ON Harvest.NumW = Wine.NumW
WHERE Wine.NumW = 12
GROUP BY Wine.NumW, Wine.Category

-- OR WITHOUT JOINING, WE CAN GET OUR RESULT
SELECT NumW, SUM(Quantity) AS 'total_sum'
FROM Harvest
WHERE NumW = 12
GROUP BY NumW

--QUANTITY OF WINE PRODUCED BY CATEGORY
Select Wine.Category, SUM(Quantity) AS quatity_of_wine_produced 
FROM Harvest
JOIN Wine
ON Harvest.NumW = Wine.NumW
GROUP BY Wine.Category

-- Producers in Sousse region that have harvested at least one wine in quantities greater than 300 litres 
Select FirstName, LastName, quantity, Region
FROM Harvest
JOIN Producer
ON Harvest.NumP = Producer.NumP
WHERE Region = 'Sousse' AND Quantity > 300
ORDER BY FirstName, LastName

-- Wine Numbers that have degree greater than 12 and produced by producer 24
Select NumP, Degree
FROM Harvest
JOIN Wine
ON Harvest.NumW = Wine.NumW
WHERE Degree > 12 AND NumP = 24


