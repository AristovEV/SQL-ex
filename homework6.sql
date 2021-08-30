
--task1 (lesson5)
-- Компьютерная фирма: Сделать view (pages_all_products), в которой будет постраничная разбивка всех продуктов (не более двух продуктов на одной странице). Вывод: все данные из laptop, номер страницы, список всех страниц
create view pages_all_products as 
select code,model,speed,ram,hd,price,screen,row_number,ntile from(
select *,row_number  () over (partition by ntile order by ntile) from (
select *,ntile (3) over() from laptop) g
) p

select * from  pages_all_products 
--task2 (lesson5)
-- Компьютерная фирма: Сделать view (distribution_by_type), в рамках которого будет процентное соотношение всех товаров по типу устройства. Вывод: производитель,
create view distribution_by_type as
select type,sum(y) ,
cast(100 as float)/ (select cast (count(*) as float) from product)* cast(sum(y)as float) proc 
from(
select *,count(*) y 
from product 
group by type,maker,model
order by type
) n
group by type

select * from distribution_by_type


--task3 (lesson5)
-- Компьютерная фирма: Сделать на базе предыдущенр view график - круговую диаграмму

--task4 (lesson5)
-- Корабли: Сделать копию таблицы ships (ships_two_words), но у название корабля должно состоять из двух слов
select create table ships_two_words as select *
from ships 
where name like '% %'

select * from ships_two_words
--task5 (lesson5)
-- Корабли: Вывести список кораблей, у которых class отсутствует (IS NULL) и название начинается с буквы "S"
select name from ships 
where class is null and name like 'S%'
--task6 (lesson5)
-- Компьютерная фирма: Вывести все принтеры производителя = 'A' со стоимостью выше средней по принтерам производителя = 'C' и три самых дорогих (через оконные функции). Вывести model
select *, row_number() over(order by price) as pri from (
select p.*,pr.maker from printer as p join product as pr using(model) where price >(
select avg(price ) from printer as p 
join product as pr using(model)
where  maker ='C') and maker ='A'
) h