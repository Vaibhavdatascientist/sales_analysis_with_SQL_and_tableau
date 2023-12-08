-- Create DataBase
create database sales;

-- Use That DataBase
use sales;

-- Inspecting Data
select * from sales_data_sample;

-- Checking unique values
select distinct(status) from sales_data_sample;  -- Nice one to plot
select distinct(year_id) from sales_data_sample;
select distinct(ProductLine) from sales_data_sample;
select distinct(COUNTRY) from sales_data_sample;
select distinct(DEALSIZE) from sales_data_sample;
select distinct(TERRITORY) from sales_data_sample;



-- ANALYSIS
-- Let's start by grouping sales by productline
select ProductLine, sum(sales) as Revenue
from sales_data_sample
group by ProductLine
order by Revenue desc;  -- Classic Cars has generated more revenue comparing to another product


select year_id, sum(sales) as Revenue
from sales_data_sample
group by year_id
order by Revenue desc;   -- They have made more sales in 2004

select distinct(MONTH_ID) from sales_data_sample
where year_id = 2005; -- As we can see here in 2005 they just for 5 months

select DEALSIZE, sum(sales) as Revenue
from sales_data_sample
group by DEALSIZE
order by Revenue desc;  -- Medium size generated more revenue


-- What was the best month for sales in a specific year? How much was earned that month? 

select  MONTH_ID, sum(sales) as  Revenue, count(ORDERNUMBER) as Frequency
from sales_data_sample
where YEAR_ID = 2004   -- change year to see the rest
group by  MONTH_ID
order by Revenue desc;

-- Inference
-- 1) In 2003, November Month is the best as it generated more revenue
-- 2) In 2004, November Month is the best as it generated more revenue
-- 3) In 2005, May Month Month is the best as it generated more revenue


-- November seems to be the month, what product do they sell in November, Classic Cars I believe
select  MONTH_ID, PRODUCTLINE, sum(sales) as Revenue, count(ORDERNUMBER)
from sales_data_sample
where YEAR_ID = 2004 and MONTH_ID = 11       -- change year to see the rest
group by  MONTH_ID, PRODUCTLINE
order by Revenue desc;



-- What city has the highest number of sales in a specific country
select city, sum(sales) as Revenue
from sales_data_sample
where country = 'UK'
group by city
order by Revenue desc;



-- What is the best product in United States?
select country, YEAR_ID, PRODUCTLINE, sum(sales) as Revenue
from sales_data_sample
where country = 'USA'
group by  country, YEAR_ID, PRODUCTLINE
order by Revenue desc;

  




