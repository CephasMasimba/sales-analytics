--SALES ANALYSIS - SALES CASE STUDY

--Exploratory Data Analysis

--OBJECTIVES :

--Develop the following metrics :

--(1)daily sales price per unit
--(2)average unit sales price of the product
--(3)daily percentage gross profit
--(4)daily gross profit per unit.

--(5)pick any 3 periods during which the product was on special / promotion.
-- At the end of this project, I will give an analysis of the product to consider whether the product performed 
--better or worse when sold at a promotional price.


--PREPARED BY CEPHAS MASIMBA

------------------------------------------------------------------------------

--My first task is to check all my columns in the table


------------------------------------------------------------------------------

SELECT SALES,
    DATE,
      sum (SALES) AS daily_revenue,
      sum(sales) as total_sales,
      sum(sales-cost_of_sales)as
      daily_gross_profit,
      sum(sales)as daily_sales,
      sum(cost_of_sales)as daily_cost,
      sum(sales) / sum(quantity_sold) as
       avg_price,
      sum(quantity_sold)as total_units,
      sum(sales-cost_of_sales)as
      daily_gross_profit,
      sum(quantity_sold) AS total_quantity_sold,
     sum(sales) -sum(cost_of_sales) AS daily_gross_profit,
     ROUND(
           (SUM(sales)-
           SUM(cost_of_sales)) /
           nullif (SUM(sales) ,0) *100,
           2
           ) AS gross_profit_margin_percent,
    sum(sales) / sum(quantity_sold)
    as avg_price,
         sum(cost_of_sales)as daily_cost,
       (SALES*QUANTITY_SOLD)AS
         revenue,
         CASE
             WHEN QUANTITY_SOLD >=9000 THEN
            '01.first special'
            WHEN QUANTITY_SOLD >=5000 THEN 
            '02.second special'
            WHEN QUANTITY_SOLD >=2000 THEN 
            '03.third special'
            ELSE'04.-regular'
        END as promotion_day
        FROM products,
        GROUP BY DATE, SALES, COST_OF_SALES, QUANTITY_SOLD
        ORDER BY DATE, SALES, COST_OF_SALES, QUANTITY_SOLD;
    
      
     
    
------------------------------------------------------------------------------

