select 
species
,count(*) as GroupT
--,sum(count(name)) over () as Window1
,sum(count(name)) over () as Window2
from animals
group by species



