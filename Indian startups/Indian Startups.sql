select * from startups1
 


-- How many companies have more than 500 employees?
select company, sum(No_of_Employees) from startups1
where no_of_employees > 500
group by company
 
-- Which companies received funding rounds of more than $10 million?
select company, Funding_Amount_in_$ from startups1
where Funding_Amount_in_$ > 10000000

-- Which companies have more than 5 founders?
 select * from (SELECT company, founders, LENGTH(founders) - LENGTH(REPLACE(founders, ',', '')) + 1 AS cnt FROM startups1) as Cm
 where cnt > 5


-- Which companies have less than 3 investors?
select * from startups1

select No_of_Investors from startups1
where No_of_Investors < 3

-- Which industries do companies in the dataset belong to? (List each unique industry only once)


-- Which city has the highest number of companies in the dataset?
select City, count(company) as CC from startups1
group by city 
order by CC desc
limit 1


-- Which company has the highest amount of funding?
select * from startups1
 select company, max(Funding_Amount_in_$) as MF from startups1
group by company 
order by MF desc 
limit 1

-- How many companies were founded before the year 2000?

select * from startups1

select Starting_Year, count(company) from startups1
where Starting_Year < 2000
group by Starting_Year

select Starting_Year, company from startups1
where Starting_Year < 2000
 

-- Which companies have the word "tech" in their description?
select count(*) from (select company, description from startups1
where Description like '%tech%') as sai


--  Which companies received funding in the year 2020 and have less than 5 founders?
select * from startups1
select * from(SELECT company, Starting_Year, founders, LENGTH(founders) - LENGTH(REPLACE(founders, ',', '')) + 1 AS cnt FROM startups1) as TA
where Starting_Year = 2020 and cnt < 5

-- Which companies have received more than 5 funding rounds and have more than 1000 employees?
select * from startups1

select company, No_of_Employees, Funding_Round from startups1
where No_of_Employees > 1000 and Funding_Round > 5

-- Which companies have the same number of founders and investors?
select * from startups1

select * from (select company, founders, length(founders) - length(replace(founders, ',','')) + 1 as FO, No_of_Investors from startups1) as abhi
where FO = No_of_Investors


-- Which cities have at least 3 companies with more than $10 million in funding?
select * from startups1

select city,dense_rank()over(partition by city )  from 
(select company, city, Funding_Amount_in_$ from startups1
where Funding_Amount_in_$ > 10000000 ) as CC


-- Which industries have companies with an average funding amount of more than $5 million?
select * from startups1

select Company, Industries, Funding_Amount_in_$ from startups1
where Funding_Amount_in_$ < 50000000

-- Which companies have a description that contains both "tech" and "healthcare"?

select Company, Description from startups1
where Description like '%tech%' or description like '%healthcare%'

-- Which company has the highest funding amount per employee?
select * from startups1

with my_cte as (select *, Funding_Amount_in_$/ max_employees as fund_emp from (SELECT company, Funding_Amount_in_$,
	 SUBSTRING_INDEX(No_of_Employees, '-', -1) AS max_employees from startups1) as abhi)
     select company, max_employees, fund_emp from my_cte
     order by fund_emp desc

-- SUBSTRING_INDEX(No_of_Employees, '-', 1) AS min_employees

-- Which cities have more than one company founded in the same year?

select * from (select distinct city, Starting_Year, count(company)over(partition by city, Starting_Year) as SY from startups1) as SS
where SY > 1
 


-- Which companies have a description that starts with a vowel (a, e, i, o, or u)?
select * from startups1
select Description from startups1
where description like '%a' or description like '%e'or description like '%i' or description like '%o' or description like '%u'


-- Which companies have more than 50 employees and have not received any funding?
select company, No_of_Employees, Funding_Amount_in_$ from startups1
where No_of_Employees < 50 and Funding_Amount_in_$ = 0

select company, No_of_Employees, Funding_Amount_in_$ from startups1
where No_of_Employees < 50 or Funding_Amount_in_$ = 0

