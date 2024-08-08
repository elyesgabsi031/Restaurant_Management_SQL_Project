-- Orders per hour ?
With Time_order AS (
SELECT DISTINCT order_id, 
EXTRACT(Hours from created_at) as Order_Time
FROM orders
)
SELECT Order_Time, count(Order_Time) AS orders_per_hour
from Time_order
GROUP BY Order_Time
ORDER BY orders_per_hour DESC

--Sales per hour ?
With Time_order AS (
SELECT order_id, quantity, item_id,
EXTRACT(Hours from created_at) as Order_Time
FROM orders
)
SELECT Order_Time, SUM(quantity * item_price) AS sales_per_hour
from Time_order
LEFT JOIN items
ON items.item_id = Time_order.item_id
GROUP BY Order_Time
ORDER BY sales_per_hour DESC


--Orders by delivery/ pick up ? (Business model)
SELECT CASE
WHEN delivery = true then 'Delivery'
ELSE 'Pick_up'
END AS order_type,
COUNT(DISTINCT order_id) AS order_count
FROM orders
GROUP BY order_type