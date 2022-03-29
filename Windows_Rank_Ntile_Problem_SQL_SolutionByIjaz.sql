
WITH Animals_with_temperatures 
AS 
(
    select 
    species, name, temperature,
    avg(temperature) over (PARTITION by species) as Avg_Temp_per_Species,
    cast((temperature - avg(temperature) over (PARTITION by species) ) as decimal(5,4)) as temp_diff_from_avg,
    cast ((avg(temperature) over (PARTITION by species) * 5 )/1000 as decimal(5,4)) as temp_excepion_percentage
    from routine_checkups
)
select * FROM
(
    select
    *, 
    abs(temp_diff_from_avg) - abs(temp_excepion_percentage) as temp_diff_from_temp_percentage,
    ntile(4) over (order by abs(temp_diff_from_avg) - abs(temp_excepion_percentage)) as quartile
    from Animals_with_temperatures
) B
where quartile = 1




