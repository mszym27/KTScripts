DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS UpdatedProducts;

--Create a target table
CREATE TEMP TABLE Products
(
   ProductID INT PRIMARY KEY,
   ProductName VARCHAR(100),
   Rate MONEY
);

--Insert records into target table
INSERT INTO Products
VALUES
   (1, 'Tea', 10.00),
   (2, 'Coffee', 20.00),
   (3, 'Muffin', 30.00),
   (4, 'Biscuit', 40.00);

SELECT * FROM Products;

--Create source table
CREATE TEMP TABLE UpdatedProducts
(
   ProductID INT PRIMARY KEY,
   ProductName VARCHAR(100),
   Rate MONEY
);

--Insert records into source table
INSERT INTO UpdatedProducts
VALUES
   (1, 'Tea', 10.00),
   (2, 'Coffee', 25.00),
   (3, 'Muffin', 35.00),
   (5, 'Pizza', 60.00);

SELECT * FROM UpdatedProducts;

-- MERGE
	
INSERT INTO UpdatedProducts (ProductID, ProductName, Rate) 
SELECT ProductID, ProductName, Rate FROM Products
ON CONFLICT (ProductID) DO UPDATE SET 
  ProductName=EXCLUDED.ProductName;

SELECT * FROM Products;
SELECT * FROM UpdatedProducts ORDER BY 1;