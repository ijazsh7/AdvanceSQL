-- query to return if the animals heart rate per species is at or above the average heartrate per species
select 
a.name, 
a.species,
r.heart_rate,
r.checkup_time,
Cast(AVG(r.heart_rate) over(PARTITION BY r.species) as decimal(5,2)) as avg_species_HR,
CASE 
    WHEN r.heart_rate >=  AVG(r.heart_rate) over(PARTITION BY r.species) THEN 'TRUE'
    ELSE 'False'
END as Is_HR_at_or_above_AVG
from animals a
inner join routine_checkups r on a.species = r.species and a.name = r.name

