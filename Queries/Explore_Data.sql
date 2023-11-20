-- Active: 1696705379244@@127.0.0.1@5432@cyclysticstudy@public


SELECT * FROM bike;

-- How many NULLS are in each column
select 
  sum(case when ride_id IS NULL then 1 else 0 end) rideid
  ,sum(case when rideable_type is null then 1 else 0 end) ridetype
  ,sum(case when started_at is null then 1 else 0 end) startat
  ,sum(case when ended_at is null then 1 else 0 end) endat
  ,sum(case when start_station_name is null then 1 else 0 end) startstation
  ,sum(case when start_station_id is null then 1 else 0 end) startid
  ,sum(case when end_station_name is null then 1 else 0 end) endtstation
  ,sum(case when end_station_id is null then 1 else 0 end) endid
  ,sum(case when start_lat is null then 1 else 0 end) startlat
  ,sum(case when start_lng is null then 1 else 0 end) startlng
  ,sum(case when end_lat is null then 1 else 0 end) endlat
  ,sum(case when end_lng is null then 1 else 0 end) endlng
  ,sum(case when member_casual is null then 1 else 0 end) membercasual
from bike;

-- number of for duplicate rows 
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM bike;

-- Make sure that there are only 2 rider types
SELECT COUNT(DISTINCT member_casual) as number_of_rider_types
FROM bike;

-- What are the 2 rider types
SELECT DISTINCT member_casual FROM bike;

-- Select the number of trips for each rider type
SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM bike
GROUP BY member_casual;

-- The 3 ridable types and amount of each type
SELECT DISTINCT rideable_type, COUNT(rideable_type) AS no_of_trips
FROM bike
GROUP BY rideable_type;


-- Get the time of use for each ride
SELECT started_at, ended_at
FROM bike
LIMIT 1000;
SELECT EXTRACT(HOUR FROM (ended_at - started_at)) * 60 as hour, 
        EXTRACT(MINUTE FROM (ended_at - started_at)) as minutes, 
        EXTRACT(SECOND FROM (ended_at - started_at)) / 60 as seconds
FROM bike
LIMIT 1000;

-- Number of all rides with invalid start and/or end times
SELECT COUNT(ride_id) AS number_of_invalid_ride_times
FROM bike
WHERE started_at IS NULL OR ended_at IS NULL;
