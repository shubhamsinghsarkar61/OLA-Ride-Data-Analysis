Create Database Ola;
Use Ola;

-- OLA Data Analyst Project (SQL)

-- 1. Retrieve all successful bookings:
SELECT Booking_ID, Customer_ID, Vehicle_Type, Booking_Value
FROM bookings
WHERE Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type:
SELECT Vehicle_Type, ROUND(AVG(Ride_Distance), 2) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type
limit 15;


-- 3. Get the total number of cancelled rides by customers:
SELECT COUNT(*) AS total_cancelled_by_customer
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';


-- 4. List the top 5 customers who booked the highest number of rides:
SELECT Customer_ID, COUNT(*) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) AS driver_cancel_personal_issue
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT 
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan'
and driver_ratings >0;


-- 7. Retrieve all rides where payment was made using UPI:
SELECT Booking_ID, Customer_ID, Booking_Value
FROM bookings
WHERE Payment_Method = 'UPI';


-- 8. Find the average customer rating per vehicle type:
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating), 2) AS avg_customer_rating
FROM bookings where customer_Rating>0
GROUP BY Vehicle_Type;


-- 9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) AS total_success_value
FROM bookings
WHERE Booking_Status = 'Success';


-- 10. List all incomplete rides along with the reason:
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes'
limit 10 ;