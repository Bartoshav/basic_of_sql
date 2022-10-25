USE homework3;

#1. самый дорогой товар, который купил каждый покупатель
WITH 
temp1 AS (
SELECT c.customer_name AS customer, MAX(g.price) AS price 
FROM customer_order co
INNER JOIN customer c ON co.customer_id=c.id_customer
INNER JOIN goods g ON co.goods_id=g.id_goods
GROUP BY customer),
temp2 AS (
SELECT c.customer_name AS customer, g.price AS price, g.goods_name AS goods	
FROM customer_order co
INNER JOIN customer c ON co.customer_id=c.id_customer
INNER JOIN goods g ON co.goods_id=g.id_goods)

SELECT temp2.customer, temp2.price,temp2.goods 
FROM temp2 
WHERE EXISTS 
(SELECT temp1.customer, temp1.price FROM temp1 
WHERE temp1.customer=temp2.customer AND temp1.price=temp2.price)
ORDER BY temp2.customer;

#2. Сумма всех покупок каждого покупателя
SELECT c.customer_name as customer, SUM(co.quantity*g.price) as amount_of_purchases  FROM customer_order co
INNER JOIN customer c ON co.customer_id=c.id_customer
INNER JOIN goods g ON co.goods_id=g.id_goods
GROUP BY customer;

#3. Среднюю стоимость купленного товара каждого клиента по каждой категории 
SELECT c.customer_name as customer, gc.goods_category_name as category, ROUND(AVG(price)) as avg_purchases  FROM customer_order co
INNER JOIN customer c ON co.customer_id=c.id_customer
INNER JOIN goods g ON co.goods_id=g.id_goods
INNER JOIN goods_сategory gc ON g.goods_category_id=gc.id_goods_category
GROUP BY customer, category
ORDER BY customer;

#4. Сумма(количество) купленных товаров по каждой категории (один товар может быть куплен несколько раз)
SELECT gc.goods_category_name as category, COUNT(DISTINCT co.goods_id) as number_of_goods, SUM(quantity) as quantity FROM customer_order co
INNER JOIN goods g ON co.goods_id=g.id_goods
INNER JOIN goods_сategory gc ON g.goods_category_id=gc.id_goods_category
GROUP BY category;
 
#5. Вывести имя покупателя, наименование товара и цену, где в имени категори есть буква а или о, и цена товара больше 150
WITH temp1 as (
SELECT c.customer_name as customer, g.goods_name as goods, g.price as price FROM customer_order co
INNER JOIN customer c ON co.customer_id=c.id_customer
INNER JOIN goods g ON co.goods_id=g.id_goods
INNER JOIN goods_сategory gc ON g.goods_category_id=gc.id_goods_category
WHERE price>150 and gc.goods_category_name LIKE '%а%'),

temp2 as (
SELECT c.customer_name as customer, g.goods_name as goods, g.price as price FROM customer_order co
INNER JOIN customer c ON co.customer_id=c.id_customer
INNER JOIN goods g ON co.goods_id=g.id_goods
INNER JOIN goods_сategory gc ON g.goods_category_id=gc.id_goods_category
WHERE price>150 and gc.goods_category_name LIKE '%о%')

SELECT * FROM temp1 
UNION 
SELECT * FROM temp2;

#6. Вывести наименование товара и выручку от него (т.е. стоимость умоноженная на количество раз, сколько его заказали)
SELECT g.goods_name as goods, SUM(g.price*co.quantity) as revenue FROM customer_order co
INNER JOIN goods g ON co.goods_id=g.id_goods
GROUP BY goods;

#7. Вывести наименование товара и сколько раз он был куплен (заказан), для товаров которые были заказаны от 2 до 5 раз (включительно)
WITH temp1 as (
SELECT g.goods_name as goods, COUNT(co.goods_id) as number_of_orders FROM customer_order co
INNER JOIN goods g ON co.goods_id=g.id_goods
GROUP BY goods
)

SELECT * FROM temp1
WHERE number_of_orders BETWEEN 2 and 5;

#8. Вывести два столбца:имя покупателя и имя товара, если один покупатель купил несколько товаров - он будет в результирующей таблице несколько раз, 
#если покупатель ничегон не купил - всё равно вывести его имя. Пара покупатель товар должна быть уникальная 
SELECT c.customer_name as customer, g.goods_name as goods 
FROM customer c
LEFT JOIN customer_order co ON c.id_customer=co.customer_id
LEFT JOIN goods g ON co.goods_id=g.id_goods;

#9. Вывести имя товара, который ниразу не был заказан.
SELECT goods_name as goods FROM goods
WHERE id_goods NOT IN (SELECT goods_id FROM customer_order);

#10. Вывести имя категории и цены самого дорого товара (имя товара тоже вывести) в ней, но только для тех, где самый дорогой товар дороже 1000 
WITH
temp1 AS (SELECT gc.goods_category_name AS category, g.goods_name AS goods, g.price AS price
FROM goods g
INNER JOIN goods_сategory gc ON g.goods_category_id=gc.id_goods_category
WHERE price>1000),

temp2 AS (SELECT gc.goods_category_name AS category, MAX(g.price) AS price
FROM goods g
INNER JOIN goods_сategory gc ON g.goods_category_id=gc.id_goods_category
GROUP BY category)

SELECT temp1.category, temp1.goods, temp1.price
FROM temp1
WHERE EXISTS 
(SELECT temp2.category, temp2.price 
FROM temp2
WHERE temp1.category=temp2.category AND temp1.price=temp2.price)
ORDER BY temp1.category;


