task5  (lesson6)
-- ������������ �����: ������� ������� all_products_with_index_task5 ��� ����������� ���� ������ �� ����� code (union all)
-- � ������� ���� (flag) �� ���� > ������������ �� ��������. 
--����� �������� ��������� (����� ������� �������) �� ������ ��������� �������� � ������� ����������� ���� (price_index). 
--�� ����� price_index ������� ������


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