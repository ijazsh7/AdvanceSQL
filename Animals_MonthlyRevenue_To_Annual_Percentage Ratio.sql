--SELECT * from adoptions

with adoptionsCTE(month, year, Monthly_Revenue, Annual_Percentage)
AS 
(
    SELECT 
    DATEPART("month", adoption_date) as Month,
    DATEPART("year", adoption_date) as year,
    sum (adoption_fee) as Monthly_Revenue,
    cast ((( sum (adoption_fee) * 100) / sum ( sum (adoption_fee)) over (partition by DATEPART("year", adoption_date)))  as decimal(5,2))as Annual_Percentage
    FROM adoptions
    group by DATEPART("month", adoption_date), DATEPART("year", adoption_date)
)
select 
*
,cast (((Monthly_Revenue * 100) / sum (Monthly_Revenue) over (partition by year))  as decimal(5,2))as Annual_Percentage1
 from adoptionsCTE

 