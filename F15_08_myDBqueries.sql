------------1. Find the number of customers visiting each restaurant -------------------------------------

SELECT C.restaurant_id,
       Count(*) AS Number_of_ppl_visited
FROM   f15_08_cust_rest_visit_det C,
       f15_08_restaurant R
WHERE  C.restaurant_id = R.restaurant_id
GROUP  BY Rollup(C.restaurant_id);


------------2. The number of customer visiting  a restaurant between specific DATES , which can be monthly or day or weekly basis--------------

SELECT C.restaurant_id,
       Count(*) AS Number_of_ppl_visited
FROM   f15_08_cust_rest_visit_det C,
       f15_08_restaurant R
WHERE  C.restaurant_id = R.restaurant_id
       AND walk_in_date BETWEEN '30-NOV-15' AND '31-DEC-15'
GROUP  BY Rollup(C.restaurant_id); 



------------------3.Find the Average,Maximum,Minimum speed of service in comparison to other restaurants-------------------------

SELECT temp.rest_id,
       Avg(temp.order_time) AS Average_Time,
       Min(temp.order_time) AS MIN_TIME,
       Max(temp.order_time) AS MAX_TIME
FROM   (SELECT a.restaurant_id                       AS Rest_Id,
               ( b.fullfilled_time - b.placed_time ) AS Order_time
        FROM   f15_08_cust_rest_visit_det a,
               f15_08_orders b
        WHERE  a.customer_id = b.customer_id
               AND a.walk_in_date = b.order_date) temp
GROUP  BY temp.rest_id; 



--------------------4.Find the maximum number of customers visiting, among all the restaurants--------------------

SELECT temp.rest_id,
       Max(temp.ppl_count) AS MAX_NUM
FROM   (SELECT a.restaurant_id AS Rest_Id,
               Count(*)        AS PPL_COUNT
        FROM   f15_08_cust_rest_visit_det a
        GROUP  BY a.restaurant_id
        ORDER  BY ppl_count DESC) temp
WHERE  rownum = 1
GROUP  BY temp.rest_id; 


 
---------------------5.Find Service_Rating from orders_tables and the number of people who rated it----------------------------------

SELECT Avg(service_rating)                  AS avg_service_rating,
       Count(f15_08_orders.customer_id)     AS no_of_ppl,
       f15_08_cust_rest_visit.restaurant_id AS restaurant
FROM   f15_08_orders,
       f15_08_cust_rest_visit
WHERE  service_rating IS NOT NULL
       AND f15_08_orders.customer_id = f15_08_cust_rest_visit.customer_id
GROUP  BY f15_08_cust_rest_visit.restaurant_id
ORDER  BY avg_service_rating DESC;


---------------------6.Find Food_Rating from orders_tables and the number of people who rated it----------------------------------

SELECT Avg(food_rating)                     AS avg_food_rating,
       Count(f15_08_orders.customer_id)     AS no_of_ppl,
       f15_08_cust_rest_visit.restaurant_id AS restaurant
FROM   f15_08_orders,
       f15_08_cust_rest_visit
WHERE  food_rating IS NOT NULL
       AND f15_08_orders.customer_id = f15_08_cust_rest_visit.customer_id
GROUP  BY f15_08_cust_rest_visit.restaurant_id
ORDER  BY avg_food_rating DESC; 


---------------------7.Find Food_Rating from orders_tables and the number of people who rated it ,the average for each restaurant and find MAX to find the best food rating amoung restaurants----------------------------------

SELECT *
FROM   (SELECT f15_08_restaurant.restaurant_id AS rest_id,
               Max(total_food_rating)          AS avg
        FROM   (SELECT Avg(food_rating)                     AS total_food_rating
                       ,
                       Count(f15_08_orders.customer_id)
                       AS no_of_ppl,
                       f15_08_cust_rest_visit.restaurant_id AS rest
                FROM   f15_08_orders,
                       f15_08_cust_rest_visit
                WHERE  food_rating IS NOT NULL
                       AND f15_08_orders.customer_id =
                           f15_08_cust_rest_visit.customer_id
                GROUP  BY f15_08_cust_rest_visit.restaurant_id) Rest_rating,
               f15_08_restaurant
        WHERE  rest = f15_08_restaurant.restaurant_id
        GROUP  BY f15_08_restaurant.restaurant_id
        ORDER  BY avg DESC) max_table
WHERE  rownum = 1; 

---------------------8.Find Service_Rating from orders_tables and the number of people who rated it ,the average for each restaurant and find MAX to find the best food rating amoung restaurants----------------------------------

SELECT *
FROM   (SELECT f15_08_restaurant.restaurant_id AS rest_id,
               Max(total_service_rating)       AS avg
        FROM   (SELECT Avg(service_rating)                  AS
                       total_service_rating,
                       Count(f15_08_orders.customer_id)     AS no_of_ppl,
                       f15_08_cust_rest_visit.restaurant_id AS rest
                FROM   f15_08_orders,
                       f15_08_cust_rest_visit
                WHERE  service_rating IS NOT NULL
                       AND f15_08_orders.customer_id =
                           f15_08_cust_rest_visit.customer_id
                GROUP  BY f15_08_cust_rest_visit.restaurant_id) Rest_rating,
               f15_08_restaurant
        WHERE  rest = f15_08_restaurant.restaurant_id
        GROUP  BY f15_08_restaurant.restaurant_id
        ORDER  BY avg DESC) max_table
WHERE  rownum = 1; 


---------------------8.Generate a report to find the food ordered the most -------------------------------------------------------

SELECT item_name,
       Count(*)
FROM   f15_08_orders
GROUP  BY item_name
HAVING Count(*) = (SELECT Max(A.count)
                   FROM   (SELECT Count(*) AS count
                           FROM   f15_08_orders
                           GROUP  BY item_name) A); 
