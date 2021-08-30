
--task1 (lesson5)
-- ������������ �����: ������� view (pages_all_products), � ������� ����� ������������ �������� ���� ��������� (�� ����� ���� ��������� �� ����� ��������). �����: ��� ������ �� laptop, ����� ��������, ������ ���� �������
create view pages_all_products as 
select code,model,speed,ram,hd,price,screen,row_number,ntile from(
select *,row_number  () over (partition by ntile order by ntile) from (
select *,ntile (3) over() from laptop) g
) p

select * from  pages_all_products 
--task2 (lesson5)
-- ������������ �����: ������� view (distribution_by_type), � ������ �������� ����� ���������� ����������� ���� ������� �� ���� ����������. �����: �������������,
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
-- ������������ �����: ������� �� ���� ����������� view ������ - �������� ���������

--task4 (lesson5)
-- �������: ������� ����� ������� ships (ships_two_words), �� � �������� ������� ������ �������� �� ���� ����
select create table ships_two_words as select *
from ships 
where name like '% %'

select * from ships_two_words
--task5 (lesson5)
-- �������: ������� ������ ��������, � ������� class ����������� (IS NULL) � �������� ���������� � ����� "S"
select name from ships 
where class is null and name like 'S%'
--task6 (lesson5)
-- ������������ �����: ������� ��� �������� ������������� = 'A' �� ���������� ���� ������� �� ��������� ������������� = 'C' � ��� ����� ������� (����� ������� �������). ������� model
select *, row_number() over(order by price) as pri from (
select p.*,pr.maker from printer as p join product as pr using(model) where price >(
select avg(price ) from printer as p 
join product as pr using(model)
where  maker ='C') and maker ='A'
) h