use dataspark;
#(1)To Segment customers purchasing pattern based on demographics
SELECT
  Customers1.Name,
  Customers1.Country,
  Customers1.Gender,
  SUM(Sales.quantity) AS total_quantity
FROM
  Customers1
JOIN
  Sales ON Customers1.customerkey = Sales.customerkey 
GROUP BY
  Customers1.Name,Customers1.Country,
  Customers1.Gender
ORDER BY
  total_quantity DESC
LIMIT 3;

#(2)SQL TO KNOW THE MOST PREFERRED PRODUCT BY category and subcategory
SELECT
  Products.Productkey,
  Products.Brand,
  Products.category,
  Products.Subcategory,
  SUM(Sales.quantity) AS total_quantity
  FROM
  Products
JOIN
  Sales ON Products.Productkey = Sales.Productkey 
GROUP BY
  Products.productkey,
  Products.Brand,
  Products.category,
  Products.Subcategory
ORDER BY
  total_quantity DESC
LIMIT 3;

#(3)TO ORDER THE PRODUCTS BASED ON TOTAL_PROFIT
SELECT
  Products.Productkey,
  Products.Brand,
  Products.category,
  Products.Subcategory,
  SUM(Products.profit)AS total_Profit
FROM
  Products
JOIN
  Sales ON Products.Productkey = Sales.Productkey 
GROUP BY
  Products.productkey,
  Products.Brand,
  Products.category,
  Products.Subcategory
ORDER BY
  total_profit DESC
LIMIT 3;

#(4)SQL QUERY TO CHECK THE IMPACT OF CURRECY CODE ON QUANTITY
SELECT 
    Currency_Code,
    SUM(quantity) AS total_quantity
FROM 
    Sales
Group  BY 
    Currency_code
ORDER BY total_quantity DESC;

#(5)SQL QUERY TO GET WHICH STORE HAS SOLD MAXIMUM QUANTITY BASED ON COUNTRY
SELECT 
    Stores.storekey,
    Stores.Country,
    Stores.Square_meters,
    SUM(Sales.quantity) AS total_quantity
FROM 
    Stores
JOIN 
    Sales ON Stores.Storekey = Sales.Storekey 
GROUP BY 
    Stores.storekey,
    Stores.Country,
    Stores.Square_meters

ORDER BY 
    total_quantity DESC;
    
#(6)SQL QUERY TO FIND WHICH PRODUCT HAS HIGH COST AND ABOVE 500 USD

SELECT Product_Names,
       Category,
       Unit_Cost,
       profit 
FROM Products
WHERE Unit_cost >500
Order BY Unit_cost Desc;

#(7) SQL QUERY TO FIND THE CATEGORY LIKED ACCORDING TO THEIR GENDER
SELECT
  Customers1.Country,
  Customers1.Gender,
  Products.Category,
  SUM(Sales.Quantity)AS total_quantity
FROM
  Customers1
JOIN
  Sales ON Customers1.customerkey = Sales.customerkey 
JOIN
Products ON Sales.Productkey = Products.Productkey
GROUP BY
  Customers1.Country,
  Customers1.Gender,Category
ORDER BY
  total_quantity DESC
LIMIT 5;

#(8)SQL QUERY TO SELECT THE COUNTRY WITH MORE PEOPLE ABOVE AGE 60
SELECT COUNT(Age) AS Number_people ,Country FROM Customers1 Where Age >60 GROUP BY Country ORDER BY Number_people DESC;

#(9)SQL QUERY TO FIND THE SUBCATEGORY UNDER EACH CATEGORY WHICH HAS BEEN SOLD THE HIGHEST
SELECT 
    Products.Category,
    Products.Subcategory,
    SUM(sales.Quantity) as total_quantity
FROM
    Products
JOIN  Sales ON Products.Productkey =Sales.Productkey
Group BY Products.Category,Products.Subcategory
ORDER BY total_quantity DESC;

#(10)SQL QUERY TO FIND OUT WHICH YEAR THE FREQUENCY OF PURCHASE WAS HIGHEST
SELECT 
	YEAR(order_date) AS order_year,
    COUNT(quantity) AS frequency
FROM 
    Sales
GROUP BY 
    order_year
ORDER BY 
     frequency DESC;



