use Animal_Shelter;
-- number of animals per species using co-related subquery
select
a1.Name, a1.Species, 
(select count(a2.Species) from Animals a2 where a2.Species = a1.Species) as Animal_Count_Per_Species
from Animals a1
order by a1.Species 


-- number of animals per species using window function over species 
select 
 a.name,
 a.Species,
 count(*) over (PARTITION By a.species)
from 
Animals a
order by a.Species, name


-- number of animals per species using regualr aggregate function 
select 
 max(a.name) as Name,
 a.Species,
 count(a.species) Species_Count
from 
Animals a
group by a.Species
order by a.Species

