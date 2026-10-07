-- MySQL SELECT practice: product and order data.

-- All products.
SELECT * FROM products;

-- Apple phones.
SELECT *
FROM products
WHERE manufacturer = 'Apple' AND category = 'Phones';

-- Products whose name contains "sa".
SELECT name, price
FROM products
WHERE name LIKE '%sa%';

-- Products in a price range.
SELECT name, price
FROM products
WHERE price BETWEEN 100 AND 1000;

-- Total price of Samsung products.
SELECT SUM(price) AS `SAMSUNG TOTAL PRICE`
FROM products
WHERE manufacturer = 'Samsung';

-- Products from the most expensive to the least expensive.
SELECT name, price
FROM products
ORDER BY price DESC;

-- Distinct manufacturers and categories.
SELECT DISTINCT manufacturer FROM products;
SELECT DISTINCT category FROM products LIMIT 2;

-- Products with a 12-character name beginning with A.
SELECT name
FROM products
WHERE name LIKE 'A___________';

-- Average price of products.
SELECT AVG(price) AS `PRODUCTS AVG PRICE`
FROM products;

-- Products manufactured by Samsung or Huawei.
SELECT name, description
FROM products
WHERE manufacturer IN ('Samsung', 'Huawei');

-- A UNION query combining product names and order identifiers.
SELECT name AS item FROM products
UNION
SELECT CAST(order_id AS CHAR) AS item FROM orders;

-- Categories with more than 15 products.
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
HAVING COUNT(*) > 15;

-- Product message based on manufacturer.
SELECT manufacturer, category, price, name,
       CASE manufacturer
           WHEN 'Apple' THEN 'This is an Apple product'
           WHEN 'Samsung' THEN 'This is a Samsung product'
           WHEN 'Huawei' THEN 'This is a Huawei product'
           WHEN 'Xiaomi' THEN 'This is a Xiaomi product'
           ELSE 'This product is made by another company'
       END AS product_message
FROM products;
