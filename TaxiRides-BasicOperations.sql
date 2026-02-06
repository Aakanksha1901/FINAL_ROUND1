CREATE DATABASE taxirides;
USE taxirides;

-- Display the first 10 records from the taxi trips table.
SELECT * FROM taxirides_data LIMIT 10;

-- Show only trip_id, trip_miles, and trip_total from the table.
SELECT trip_id as ID , 
       trip_miles AS Miles ,
       trip_total AS Total 
FROM taxirides_data;

-- List all distinct payment types used for trips.
SELECT DISTINCT payment_type FROM taxirides_data;

-- Find the total number of trips in the dataset using COUNT().
SELECT COUNT(*) AS Total_Trips FROM taxirides_data;

-- Display trips where trip_miles > 5.
SELECT * FROM taxirides_data WHERE trip_miles > 5 ;

-- Show trips where payment_type = 'Cash'.
SELECT * FROM taxirides_data WHERE payment_type = "cash" ;

-- Display trips where trip_total BETWEEN 10 AND 30.
SELECT * FROM taxirides_data WHERE trip_total BETWEEN 10 AND 30 ;

-- COunt trips where company is not 'Flash Cab'.
SELECT COUNT(*) AS Total_trips FROM taxirides_data WHERE  company != "Flash Cab";

-- Show trips that occurred in trip_month in December , November.
SELECT * FROM taxirides_data WHERE trip_month IN ( "December" ,"November") ;

-- Display the first 20 trips ordered by trip_total in descending order.
SELECT * FROM taxirides_data 
ORDER BY trip_total DESC LIMIT 20;

-- Show total trips grouped by payment type.
SELECT payment_type as Type , COUNT(*) AS Total_trips
FROM taxirides_data
GROUP BY payment_type;

-- Find total revenue (SUM(trip_total)) for each company.
SELECT company  AS company , 
	   SUM(trip_total) as Total_Revenue
FROM taxirides_data 
GROUP BY company ;

-- Display average trip distance by distance label.
SELECT distance_label AS DistanceLabel ,
       AVG(trip_miles) AS AvgTrip_miles
FROM taxirides_data 
GROUP BY distance_label ;

-- Show minimum and maximum fare using MIN() and MAX().
SELECT MIN(fare) AS MinimumFare ,
       MAX(fare) AS MaximumFare
From taxirides_data ;

-- Display total trips by trip hour.
SELECT trip_hour AS Hours ,
	   COUNT(*) AS TotalTrips
FROM taxirides_data
GROUP BY trip_hour ;
       
-- Show companies having average fare greater than 25.
SELECT company AS Company ,
	   AVG(fare) AS AvgFare
FROM taxirides_data 
GROUP BY company
HAVING AVG(fare) > 25 ;

-- Display trips where trip_miles > 3 AND trip_total > 20.
SELECT * FROM taxirides_data 
WHERE trip_miles BETWEEN  3 AND 20 ;

-- Show trips where payment_type = 'Cash' OR payment_type = 'Credit Card'.
SELECT * FROM taxirides_data 
WHERE payment_type = "Cash" OR payment_type = "Credit Card" ;

-- Display trips where company name Taxi.
SELECT * FROM taxirides_data 
WHERE company LIKE '%Taxi%' ;

-- Display trips where NOT payment_type = 'No Charge'.
SELECT * FROM taxirides_data
WHERE payment_type != "No Charge" ;

-- Display all distinct distance labels available in the dataset.
SELECT DISTINCT distance_label AS Distance_Type
FROM taxirides_data ;

-- Find the total number of trips for each month.
SELECT trip_month AS Month ,
	   COUNT(*) AS total_trips 
FROM taxirides_data 
GROUP BY trip_month ;

-- Show trips where trip_minutes < 10.
SELECT * FROM taxirides_data WHERE trip_minutes < 10 ;

-- Display trips where trip_total < 50.
SELECT * FROM taxirides_data WHERE trip_total < 50 ;

-- Show total trips for each distance label ordered by trip count descending.
SELECT distance_label AS DistanceLabels,
	   COUNT(*) AS TotalTrips 
FROM taxirides_data
GROUP BY DistanceLabels
ORDER BY TotalTrips DESC ;

-- Find the minimum and maximum trip miles for each company.
SELECT company AS Company ,
	   MIN(trip_miles) AS MinimumDistance ,
       MAX(trip_miles)  AS MaximumDistance
FROM taxirides_data
GROUP BY company;