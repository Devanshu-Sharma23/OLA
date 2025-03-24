create database ola;
use ola;

-- 1. Retrieve all successful bookings:
create view successful_bookings as

SELECT 
    *
FROM
    bookings
WHERE
    Booking_Status = 'Success';

select * from successful_bookings;

-- 2. Find the average ride distance for each vehicle type:
create view average_ride_distance_for_each_vehicle as

SELECT 
    Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM
    bookings
GROUP BY Vehicle_Type;

select * from  average_ride_distance_for_each_vehicle;

-- 3.  Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as

SELECT 
    COUNT(*)
FROM
    bookings
WHERE
    Booking_Status = 'Canceled by Customer';

select * from cancelled_rides_by_customers;


-- 4. List the top 5 customers who booked the highest number of rides:
	create view booked_the_highest_numbe as
    
SELECT 
    Customer_ID, COUNT(Booking_ID) AS total_rides
FROM
    bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

select * from booked_the_highest_numbe;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view  rides_cancelled_by_drivers as

SELECT 
    COUNT(*)
FROM
    bookings
WHERE
    Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from rides_cancelled_by_drivers;

--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 create view  maximum_and_minimum_driver_ratings_for_Prime_Sedan as

SELECT 
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM
    bookings
WHERE
    Vehicle_Type = 'Prime Sedan';

select * from maximum_and_minimum_driver_ratings_for_Prime_Sedan;

-- 7. Retrieve all rides where payment was made using UPI:
create view  payment_was_made_using_UPI as

SELECT 
    *
FROM
    bookings
WHERE
    Payment_Method = 'UPI';

select * from payment_was_made_using_UPI;

-- 8. Find the average customer rating per vehicle type:
create view  average_customer_rating_per_vehicle_type as 

SELECT 
    Vehicle_Type, AVG(Customer_Rating) AS avg_Customer_Rating
FROM
    bookings
GROUP BY Vehicle_Type;

select * from average_customer_rating_per_vehicle_type;


-- 9. Calculate the total booking value of rides completed successfully:

create view  total_booking_value_of_rides_completed_successfully as


 SELECT 
    SUM(Booking_Value) AS total_successful_value
FROM
    bookings
WHERE
    Booking_Status = 'Success';
    
select * from  total_booking_value_of_rides_completed_successfully; 


-- 10. List all incomplete rides along with the reason:

 create view  all_incomplete_rides_along_with_the_reason as
 
SELECT 
    Booking_ID, Incomplete_Rides_Reason
FROM
    bookings
WHERE
    Incomplete_Rides = 'Yes';
 
 select * from all_incomplete_rides_along_with_the_reason;