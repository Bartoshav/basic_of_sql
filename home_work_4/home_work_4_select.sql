USE homework4;

-- выбрать ветеринаров (только имя), которые обслуживают собак, которые тяжелее 30 кг, а так же ветериновров, которые обслуживают котов легче 7 кг. 
WITH 
temp1 AS (
 SELECT v.name FROM pet p
 INNER JOIN veterinarian v
 ON p.veterinarian_id = v.veterinarian_id
 WHERE species='dog' and weight>30),
 
 temp2 AS (
 SELECT v.name FROM pet p
 INNER JOIN veterinarian v
 ON p.veterinarian_id = v.veterinarian_id
 WHERE species='cat' and weight<7)
 
 SELECT * FROM temp1
 UNION
 SELECT * FROM temp2; 