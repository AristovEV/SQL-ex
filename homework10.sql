
--task1  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/the-report/problem
select
   case when G.Grade < 8 then 'NULL'  
   else  S.Name 
   end AS flag, G.Grade, S.Marks
from Students S
join Grades G on S.Marks between G.Min_Mark and G.Max_Mark
order by G.Grade desc, flag , S.Marks ;
--task2  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/occupations/problem
with cte as ( select row_number() OVER (PARTITION BY Occupation ORDER BY Name) as Rank, 
             case when Occupation='Doctor' then Name else null end as doctor,
             case when Occupation='Professor' then Name else null end as prof,
             case when Occupation='Singer' then Name else null end as singer, 
             case when Occupation='Actor' then Name else null end as actor from Occupations) select min(doctor), min(prof), min(singer), min(actor) from cte group by Rank
             order by rank;
--task3  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-9/problem
select distinct city
from station
where city not like 'A%' and  city not like 'E%' and city not like 'I%' and city not like 'O%' and city not LIKE 'U%';
--task4  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-10/problem
select distinct city
from station
where city not like '%a' and  city not like '%e' and city not like '%i' and city not like '%o' and city not LIKE '%u';
--task5  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-11/problem
select distinct city
from station
where city not like 'A%' and  city not like 'E%' and city not like 'I%' and city not like 'O%' and city not LIKE 'U%'
union 
select distinct city
from station
where city not like '%a' and  city not like '%e' and city not like '%i' and city not like '%o' and city not LIKE '%u';
--task6  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-12/problem
select distinct city
from station
where city not like 'A%' and  city not like '%a' and city not like 'E%'and  city not like '%e' and city not like 'I%' and city not like '%i' and city not like 'O%' and city not like '%o' and city not LIKE 'U%'and city not LIKE '%u';

--task7  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/salary-of-employees/problem
select name from employee
where salary > 2000 and months <10
order by employee_id;
--task8  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/the-report/problem
select
   case when G.Grade < 8 then 'NULL'  
   else  S.Name 
   end AS flag, G.Grade, S.Marks
from Students S
join Grades G on S.Marks between G.Min_Mark and G.Max_Mark
order by G.Grade desc, flag , S.Marks ;
