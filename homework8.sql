--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

--task1  (lesson7)
-- sqlite3: Сделать тестовый проект с БД (sqlite3, project name: task1_7). В таблицу table1 записать 1000 строк с случайными значениями (3 колонки, тип int) от 0 до 1000.
-- Далее построить гистаграмму распределения этих трех колонко

--task2  (lesson7)
-- oracle: https://leetcode.com/problems/duplicate-emails/
select distinct(email) from (
select email,dense_rank ()  over(order by email) as num

from Person )
where num = 1 

--task3  (lesson7)
-- oracle: https://leetcode.com/problems/employees-earning-more-than-their-managers/
select e.name as Employee
from employee e
left join employee m
on e.managerid=m.id
where e.salary>m.salary

--task4  (lesson7)
-- oracle: https://leetcode.com/problems/rank-scores/
select score ,dense_rank() over (order by score desc) as Rank
from Scores

--task5  (lesson7)
-- oracle: https://leetcode.com/problems/combine-two-tables/
select FirstName, LastName, City, State 
from person
left join address using(personid)