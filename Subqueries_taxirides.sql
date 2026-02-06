USE taxirides;

-- Find all trips whose fare is higher than the average fare across all trips.
select * from taxirides_data 
where fare > (
	  select avg(fare)
      from taxirides_data) ;
	

-- Display trips that have a trip_total equal to the minimum fare in the dataset.
SELECT  * FROM taxirides_data
WHERE trip_total = (
       SELECT MIN(fare)
       FROM taxirides_data
       ) ;

-- Show trips where trip_minutes is greater than the average trip_minutes.
SELECT * FROM taxirides_data
WHERE trip_minutes > (
	SELECT AVG(trip_minutes)
    FROM taxirides_data) ;
    
-- Find trips made by companies whose average fare is greater than 25.
SELECT company ,
       COUNT(*) AS Total_Trips
FROM taxirides_data
WHERE company In  (
       SELECT company 
       FROM taxirides_data
	   GROUP BY company
       HAVING AVG(fare) > 25)
GROUP BY company;

-- Display trips where payment_type is the most frequently used payment type.
SELECT *
FROM taxirides_data
WHERE payment_type = (
    SELECT payment_type
    FROM taxirides_data
    GROUP BY payment_type
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

SELECT *
FROM taxirides_data
WHERE trip_total >
(
    SELECT AVG(fare)
    FROM taxirides_data
    WHERE payment_type = 'Cash'
);



