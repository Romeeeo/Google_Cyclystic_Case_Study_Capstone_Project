-- Active: 1696904028854@@127.0.0.1@5432@cyclysticstudy@public
SELECT * FROM bike_clean;

-- Number of trips per month
SELECT month, member_casual, COUNT(ride_id) as total_trips
FROM bike_clean
GROUP BY month, member_casual
ORDER BY member_casual, total_trips;

-- Average ride length per month for each rider
SELECT month, member_casual, ROUND(AVG(ride_length),3) as avg_ride_length
FROM bike_clean
GROUP BY month, member_casual
ORDER BY member_casual, avg_ride_length;

-- Average ride length per month for all riders (in seconds)
SELECT month, ROUND(AVG(ride_length),3) as avg_ride_length
FROM bike_clean
GROUP BY month
ORDER BY avg_ride_length;

--  percentage of trips by riders
SELECT member_casual,
    COUNT(ride_id) AS total_trips,
    (COUNT(ride_id) * 100.0 / SUM(COUNT(ride_id)) OVER ()) AS percentage
FROM bike_clean
GROUP BY member_casual
ORDER BY percentage asc;

-- bikes types used by riders
SELECT member_casual, rideable_type, COUNT(*) AS total_trips
FROM bike_clean
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips;


--  percentage of trips by ride type
SELECT rideable_type,
    COUNT(ride_id) AS total_trips,
    (COUNT(ride_id) * 100.0 / SUM(COUNT(ride_id)) OVER ()) AS percentage
FROM bike
GROUP BY rideable_type
ORDER BY percentage asc;


-- Percent of trips by ride type casual riders
SELECT rideable_type,
    COUNT(ride_id) AS total_trips,
    (COUNT(ride_id) * 100.0 / SUM(COUNT(ride_id)) OVER ()) AS percentage
FROM (
        SELECT *
        FROM bike_clean
        WHERE member_casual = 'casual'
    )
GROUP BY rideable_type
ORDER BY percentage asc;


-- Percent of trips by ride type member riders
SELECT rideable_type,
    COUNT(ride_id) AS total_trips,
    (COUNT(ride_id) * 100.0 / SUM(COUNT(ride_id)) OVER ()) AS percentage
FROM (
        SELECT *
        FROM bike_clean
        WHERE member_casual = 'member'
    )
GROUP BY rideable_type
ORDER BY percentage asc;

-- Average ride length for each rider
SELECT member_casual, ROUND(AVG(ride_length),3) AS avg_ride_length
FROM bike_clean
GROUP BY member_casual
ORDER BY avg_ride_length;

-- Average ride length per rideble type for each rider
SELECT rideable_type, member_casual, ROUND(AVG(ride_length),3) AS avg_ride_length
FROM bike_clean
GROUP BY rideable_type, member_casual
ORDER BY member_casual, avg_ride_length;

