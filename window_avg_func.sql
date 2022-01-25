select 
* ,
case 
    when b.heart_rate >= b.avg_species_HR
    then 'True'
    else 'False'
end as Is_Above_Avg
from
(
select 
a.name, 
a.species,
r.heart_rate,
r.checkup_time,
AVG(r.heart_rate) over(PARTITION BY r.species) as avg_species_HR
from animals a
inner join routine_checkups r on a.species = r.species and a.name = r.name
) b 
--where b.heart_rate >= b.avg_species_HR
