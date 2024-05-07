--------------------------------------------------------------------------------------------------
CREATE DATABASE SQL_PROJECTS;
----------------------------------------------
USE SQL_PROJECTS;
----------------------------------------------
-- Question Basic:
-- 1. Retrieve the total number of orders placed.
-- 2. Calculate the total revenue generated from pizza sales.
-- 3. Identify the highest-priced pizza.
-- 4. Identify the most common pizza size ordered.
-- 5. List the top 5 most ordered pizza types along with their quantities.

-- Question Intermediate:
-- 6. Join the necessary tables to find the total quantity of each pizza category ordered.
-- 7. Determine the distribution of orders by hour of the day.
-- 8. Join relevant tables to find the category-wise distribution of pizzas.
-- 9. Group the orders by date and calculate the average number of pizzas ordered per day.
-- 10. Determine the top 3 most ordered pizza types based on revenue.

-- Question Advanced:
-- 11. Calculate the percentage contribution of each pizza type to total revenue.
-- 12. Analyze the cumulative revenue generated over time.
-- 13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.
-----------------------------------------------------------------------------------------------
-- 1. Retrieve the total number of orders placed.

SELECT 
    COUNT(DISTINCT (order_id)) AS Total_Nunbers_of_Orders
FROM
    orders;
----------------------------------------------------------------------------
-- 2. Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(od.quantity * p.price), 2)
FROM
    order_details od
        LEFT JOIN
    pizzas p ON p.pizza_id = od.pizza_id;
-----------------------------------------------------------------------------
-- 3. Identify the highest-priced pizza.

SELECT 
    pt.name, p.price
FROM
    pizza_types pt
        LEFT JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;
------------------------------------------------------------------------
-- 4. Identify the most common pizza size ordered.

SELECT 
    size, COUNT(quantity) AS order_count
FROM
    pizzas p
        LEFT JOIN
    order_details od ON od.pizza_id = p.pizza_id
GROUP BY size
ORDER BY order_count DESC
LIMIT 1;
----------------------------------------------------------------------------
-- 5. List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pt.name,
    p.pizza_type_id,
    COUNT(od.order_details_id) total_orders,
    SUM(od.quantity) AS Total_quantity
FROM
    order_details od
        LEFT JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        LEFT JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pizza_type_id , pt.name
ORDER BY total_orders DESC
LIMIT 5;
-----------------------------------------------------------------------------
-- 6. Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pt.category, SUM(quantity) AS qty
FROM
    order_details od
        JOIN
    pizzas p ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY category
ORDER BY qty DESC;
------------------------------------------------------------------------------
-- 7. Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(time) AS hour_day, COUNT(order_id)
FROM
    orders
GROUP BY hour_day;
------------------------------------------------------------------------------
-- 8. Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(name) AS qty
FROM
    pizza_types
GROUP BY category;
--------------------------------------------------------------------------------
-- 9. Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(qty), 0) order_avg_per_day
FROM
    (SELECT 
        date, SUM((quantity)) AS qty
    FROM
        orders o
    JOIN order_details od ON od.order_id = o.order_id
    GROUP BY date) AS Avg_order_qty;
--------------------------------------------------------------------------------
-- 10. Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pt.name,
    pt.pizza_type_id,
    ROUND(SUM(p.price * od.quantity), 2) AS revenue
FROM
    order_details od
        JOIN
    pizzas p ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY name , pt.pizza_type_id
ORDER BY revenue DESC
LIMIT 3;
-------------------------------------------------------------------------------
-- 11. Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pizza_types.category,
    SUM(price * quantity) / (SELECT 
            SUM(price * quantity) AS Total_revenue
        FROM
            order_details
                JOIN
            pizzas ON pizzas.pizza_id = order_details.pizza_id) * 100 AS Percentage_of_total
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.category
ORDER BY Percentage_of_total DESC;
---------------------------------------------------------------------------------
-- 12. Analyze the cumulative revenue generated over time.

select date, sum(revenue) over (order by date) as cumulative 
from 
   (select date, sum(price*quantity) as Revenue from orders
    join order_details on  order_details.order_id=orders.order_id
	join pizzas on pizzas.pizza_id=order_details.pizza_id
	group by date) as sales;
-----------------------------------------------------------------------------------
-- 13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select * from 
(select pizza_types.category, pizza_types.pizza_type_id, sum(price*quantity) as revenue, 
row_number() over (partition by pizza_types.category order by  sum(price*quantity) desc) as r1
from order_details
join pizzas on pizzas.pizza_id=order_details.pizza_id
join pizza_types on pizza_types.pizza_type_id=pizzas.pizza_type_id

group by pizza_types.category, pizza_types.pizza_type_id ) as a
where r1<=3
order by category,revenue desc

---------------------------------------------End------------------------------------------------------------------------------------