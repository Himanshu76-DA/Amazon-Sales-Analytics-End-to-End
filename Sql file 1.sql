CREATE TABLE Online_Amazon_Sales_Dataset (
    Order_ID VARCHAR(50),
    Date DATE,
    Status VARCHAR(30),
    Fulfilment VARCHAR(30),
    Sales_Channel VARCHAR(50),
    Ship_Service_Level VARCHAR(30),
    Style VARCHAR(100),
    SKU VARCHAR(100),
    Category VARCHAR(50),
    Size VARCHAR(50),
    Courier_Status VARCHAR(50),
    Qty INT,
    Currency VARCHAR(10),
    Amount DECIMAL(10,2),
    Ship_City VARCHAR(100),
    Ship_State VARCHAR(100),
    Ship_Postal_Code VARCHAR(20),
    Ship_Country VARCHAR(10),
    Promotion_Ids VARCHAR(255),
    B2B BOOLEAN,
    Fulfilled_By VARCHAR(50)
);



Select * from Online_Amazon_Sales_Dataset



ALTER TABLE online_amazon_sales_dataset
ALTER COLUMN promotion_ids TYPE TEXT;



COPY Online_Amazon_Sales_Dataset
FROM 'C:/Users/nikuj/OneDrive/Desktop/desktop/githiibprojects/14. End to end advance project/Project Data material+ notebooks/Online_Sales_Dataset.csv'
DELIMITER ','
CSV HEADER;



" Let's Analyze data by some questions "

"   Q1. Find the top 5 months with the worst order performance by calculating the monthly cancellation percentage.
For each month-year, compute total orders,cancelled orders, and the cancellation rate,
then return the five months with the highest cancellation percentage. "



with Month_year
		 as(
			Select Extract(month from date)as Months,
			Extract(year from date)as Years,
			order_id, status
			from Online_Amazon_Sales_Dataset
			),
my_cte
 		 as(
			Select Months,Years,
			Count(order_id) as Total_Orders,
			Count(Case when "status" = 'Cancelled' Then 1 end ) as cancelled_orders
			from Month_year
			group by "months","years"
			)

Select *,
Round((cancelled_orders:: decimal /Total_Orders:: decimal)* 100,2)as "Order_cancelled_in %"
from my_cte
Order by  "Order_cancelled_in %" desc
Limit 5;






"  Q2.    Analyze how each state performs compared to the national average revenue.
Using only non-cancelled orders, calculate the total revenue for every ship_state.
Then compute the average revenue across all states, and classify each state as Above Average, Below Average, or Around Average (within ±10% of the average).              "


Create view non_cancel_data as 
Select * from Online_Amazon_Sales_Dataset 
where  status != 'Cancelled'

with my_cte as(
			  Select ship_state, Sum(amount) as total_amount
			  from non_cancel_data
			  group by ship_state
			  ),
overall as(
			  Select Round(Avg(total_amount),2) as overall_avg from my_cte
),
overall_data as(
			  Select m.*,o.overall_avg from my_cte as m
			  cross join overall o
)
select *, Case
			when total_amount Between overall_avg* 0.9 and overall_avg * 1.1 Then 'Around avg'
			when total_amount > overall_avg then 'Above avg'
			Else 'Below Avg'
			End as Avg_Status
			from overall_data




"    Q3.For each ship_state and month-year, calculate the monthly total sales using
only non-cancelled orders. Then compute a running cumulative total of sales over time for each state,
ordered chronologically by year and month."


with 
	my_cte as (
		Select 
	  		    ship_state,
	   			Extract(month from date) as months,
	  		    Extract(year from date) as years,
	   			Sum(amount) as monthly_sales
		from non_cancel_data
	  		    Group by ship_state,
	   					  months,
						  years)

Select 
	   ship_state,
	   months,
	   years, 
	   monthly_sales,
	   Sum(monthly_sales) over(partition by ship_state
	   					order by years,months
						ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as cumulative_sum
from my_cte





"   Q4. Determine which ship_state generates exceptionally high revenue.
First, calculate the total sales for each state using non-cancelled orders.
Then compute the 75th percentile of these state-level totals.
Finally, classify each state as “High Value” if its total revenue exceeds the 75th percentile, otherwise label it as “Low Value.” "


with my_cte as(
    Select ship_state,
		   Sum(amount) as total_sale
		   from non_cancel_data
	group by ship_state
),
"75th_percentile_value" as(
			 Select percentile_cont(0.75) within group (order by total_sale) as "75th_p"
			 from my_cte
)
Select m.*,p."75th_p", Case 
		when total_sale > "75th_p" Then 'High value'
		else 'Low value' end as percentile_status
from my_cte as m
cross join "75th_percentile_value" as p



"    Q5. identify the most profitable sales channel and fulfillment combination
find which combination of sales channel and fulfilment method generates the highest total revenue and
order volume also calculate the average order value for each combination and rank them this will help understand
which channel-fulfillment strategy works best"


Select * from non_cancel_data

with profitable_sales_combo_fulfilment as (
	Select sales_channel, fulfilment,
			 Sum(amount) as Total_sale,
			 Count(Distinct order_id) as order_volume,
			 Round(Avg(amount),2) as avg_order_value
		     from non_cancel_data
    group by sales_channel, fulfilment)

Select *, Rank() over(order by Total_sale desc) as ranking
from profitable_sales_combo_fulfilment

























