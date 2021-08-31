task5  (lesson6)
-- Компьютерная фирма: Создать таблицу all_products_with_index_task5 как объединение всех данных по ключу code (union all)
-- и сделать флаг (flag) по цене > максимальной по принтеру. 
--Также добавить нумерацию (через оконные функции) по каждой категории продукта в порядке возрастания цены (price_index). 
--По этому price_index сделать индекс


create table all_products_with_index_task5 as
select *,row_number() over ( order by price ) as price_index , case when 
				price >(select max(price) from printer) then 1
				else 0
				end flag 
				from
(
select maker,model,price 
from product 
join pc using(model)
union all
select maker,model,price 
from product 
join laptop using(model)
union all
select maker,model,price 
from product 
join printer using(model)
) j 
create unique index id on all_products_with_index_task5 (price_index)
select * from all_products_with_index_task5