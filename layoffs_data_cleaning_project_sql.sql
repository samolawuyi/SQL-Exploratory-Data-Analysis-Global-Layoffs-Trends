-- Data Cleaning


select *
from layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null values or blank values
-- 4. Remove any Columns or rows


create table layoffs_staging
like layoffs;


select *
from layoffs_staging;

insert layoffs_staging
select *
from layoffs;



select *,
row_number() over(
partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
from layoffs_staging;

with duplicate_cte as
(
select *,
row_number() over(
partition by company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage, country,funds_raised_millions) as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num > 1;

select *
from layoffs_staging
where company = 'Casper';

with duplicate_cte as
(
select *,
row_number() over(
partition by company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage, country,funds_raised_millions) as row_num
from layoffs_staging
)
delete
from duplicate_cte
where row_num > 1;

CREATE TABLE `layoffs_staging4` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging4
where row_num > 1;

insert into layoffs_staging4
select *,
row_number() over(
partition by company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage, country,funds_raised_millions) as row_num
from layoffs_staging;


delete
from layoffs_staging4
where row_num > 1;

select *
from layoffs_staging4;


-- Standardizing Data

select company, trim(company) 
from layoffs_staging4;

update layoffs_staging4
set company = trim(company);


select distinct industry 
from layoffs_staging4
;


update layoffs_staging4
set industry = 'crypto'
where industry like 'crypto%';


select distinct country, trim(trailing '.' from country)
from layoffs_staging4
order by 1;

update layoffs_staging4
set country = trim(trailing '.' from country)
where country like 'United States%';


select `date`
from layoffs_staging4;

update layoffs_staging4
set `date` = str_to_date(`date`, '%m/%d/%Y');

alter table layoffs_staging4
modify `date` date;


select *
from layoffs_staging4
where total_laid_off is null
and percentage_laid_off is null;

update layoffs_staging4
set industry = null
where industry = '' or industry = '';


select *
from layoffs_staging4
where industry is null
or industry = '';


select *
from layoffs_staging4
where company = 'airbnb';

select t1.industry, t2.industry
from layoffs_staging4 t1
join layoffs_staging4 t2
	on t1.company = t2.company
where t1.industry is null 
and t2.industry is not null;

update layoffs_staging4 t1
join layoffs_staging4 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null 
and t2.industry is not null;


select company, industry
from layoffs_staging4
where industry is null;


select distinct company
from layoffs_staging4
where industry is null
	or industry = ''
order by company;

update layoffs_staging4
set industry = case
	when company like 'Bally%' then
'Entertainment'
	when company like 'Airbnb%' then 'Travel'
    when company like 'Carvana' then
    'Transportation'
-- Add more as needed
end
where company in ('Bally\'s Interactive', 'Airbnb', 'Carvana');

select company, industry
from layoffs_staging4
where company in ('Bally\'s Interactive', 'Airbnb', 'Carvana');


select *
from layoffs_staging4;

select *
from layoffs_staging4
where total_laid_off is null
and percentage_laid_off is null;


delete
from layoffs_staging4
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging4;

alter table layoffs_staging4
drop column row_num;




