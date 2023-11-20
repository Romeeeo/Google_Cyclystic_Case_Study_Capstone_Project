-- Active: 1696705379244@@127.0.0.1@5432@cyclysticstudy@public

CREATE TABLE IF NOT EXISTS bike_clean AS (
  SELECT 
    a.ride_id, rideable_type, started_at, ended_at, 
    ride_length,
    CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    start_station_name, end_station_name, 
    start_lat, start_lng, end_lat, end_lng, member_casual
  FROM bike a
  JOIN (
    SELECT ride_id, (
      EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
      EXTRACT(MINUTE FROM (ended_at - started_at)) +
      EXTRACT(SECOND FROM (ended_at - started_at)) / 60) AS ride_length
    FROM bike
  ) b 
  ON a.ride_id = b.ride_id
  WHERE 
    start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    ride_length > 1 AND ride_length < 1440  
);


-- Number of rows in new clean data
SELECT COUNT(ride_id) AS no_of_rows
FROM bike_clean;

-- Number of rows in old data
SELECT COUNT(ride_id) as no_of_rows
FROM bike;

-- Number of the rows deleted from the clean table
SELECT COUNT(b.ride_id) - COUNT(bc.ride_id) as number_of_rows_removed
FROM bike b, bike_clean bc;

SELECT * FROM bike;

SELECT * FROM bike_clean;

-- Test  month column
SELECT * FROM bike_clean
WHERE month = 'MAY'
LIMIT 100;

