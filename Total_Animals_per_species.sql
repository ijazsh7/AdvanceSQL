-- Total Animals per species using co-related sub query
SELECT 	a1.species, 
		a1.name, 
		a1.primary_color, 
		a1.admission_date,
		(	SELECT 	COUNT (*) 
			FROM 	animals AS a2
			WHERE 	a2.species = a1.species
		) AS number_of_species_animals
FROM 	animals AS a1
ORDER BY 	a1.species ASC, 
			a1.admission_date ASC;



-- Total Animals per species using Window function

select distinct *,
count(*) over (partition by species) as TotalAnimal_per_Species
from animals