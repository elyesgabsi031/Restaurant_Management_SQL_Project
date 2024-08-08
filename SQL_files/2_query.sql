
-- Sales per Category?
SELECT item_cat, SUM(item_price * quantity) AS sales_per_category
FROM orders as o
LEFT JOIN items as i
ON i.item_id = o.item_id
GROUP BY item_cat


-- Top selling items?

SELECT o.item_id, sku, SUM(quantity) AS items_sold
FROM orders as o
LEFT JOIN items as i
ON i.item_id = o.item_id
GROUP BY o.item_id, sku
ORDER BY items_sold DESC

-- Top selling pizzas? 
SELECT item_name, SUM(quantity) AS pizzas_sold
FROM orders as o
LEFT JOIN items as i
ON i.item_id = o.item_id
GROUP BY item_name, item_cat
HAVING item_cat = 'Pizza'
ORDER BY pizzas_sold DESC

