-- Total orders ?
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM orders

--Total sales ? 

-- 1) Sales per order (Extra)
SELECT order_id, SUM(item_price * quantity) AS order_revenue
FROM orders as o
LEFT JOIN items as i
ON i.item_id = o.item_id
GROUP BY order_id
ORDER BY order_id

--2) Total sales
with sales_per_order AS (
    SELECT order_id, 
    SUM(item_price * quantity) AS order_revenue
    FROM orders as o
    LEFT JOIN items as i
    ON i.item_id = o.item_id
    GROUP BY order_id
    ORDER BY order_id
)

SELECT SUM(order_revenue) AS total_sales
FROM sales_per_order

/*The previous query could have been done in an easier faster way
but I wanted to see the sales per order before.
*/

/* Total sales = 
SELECT SUM(item_price * quantity)
FROM orders as o
LEFT JOIN items as i
ON i.item_id = o.item_id
*/

-- Total items sold?
SELECT SUM(quantity) AS total_items_sold
FROM orders

-- Average Order Value? 
SELECT (SUM(item_price * quantity) / COUNT(DISTINCT order_id)) AS Average_Order_Value
FROM orders as o
LEFT JOIN items as i
ON i.item_id = o.item_id

