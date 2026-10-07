-- MySQL JOIN practice: users, orders, and products.

-- User login, order number, and total price.
SELECT u.login,
       o.order_id,
       o.total
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
WHERE u.login = 'test_user'
ORDER BY o.order_id;

-- Order number, product name, and quantity.
SELECT oi.order_id,
       p.name AS product_name,
       oi.quantity
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
ORDER BY oi.order_id, p.name;

-- All users, including users without orders.
SELECT u.login,
       o.order_id
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
ORDER BY u.user_id, o.order_id;

-- All products, including products not represented in paid orders.
SELECT oip.order_id,
       p.name AS product_name
FROM order_items_paid oip
RIGHT JOIN products p ON oip.product_id = p.product_id
ORDER BY p.product_id, oip.order_id;

-- Products more expensive than Samsung Active 5.
SELECT p.name,
       p.price
FROM products p
WHERE p.price > (
    SELECT price
    FROM products
    WHERE name = 'Samsung Active 5'
)
ORDER BY p.price;
