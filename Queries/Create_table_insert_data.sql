CREAT TABLE bike (
    ride_id text,
    rideable_type text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    started_station_name text,
    started_station_id text,
    end_station_name text,
    end_station_id text
    start_lat double precision,
    tart_lng double precision,
    end_lat double precision,
    end_lng double precision,
    member_casual text
);

COPY bike
--FROM 'D:\Cyclystic case study\input\202201-divvy-tripdata.csv' 
--FROM 'D:\Cyclystic case study\input\202202-divvy-tripdata.csv'
--FROM 'D:\Cyclystic case study\input\202203-divvy-tripdata.csv'
--FROM 'D:\Cyclystic case study\input\202204-divvy-tripdata.csv'
--FROM 'D:\Cyclystic case study\input\202205-divvy-tripdata.csv'
--FROM 'D:\Cyclystic case study\input\202206-divvy-tripdata.csv'
--FROM 'D:\Cyclystic case study\input\202207-divvy-tripdata.csv'
--FROM 'D:\Cyclystic case study\input\202208-divvy-tripdata.csv'
--FROM 'D:\Cyclystic case study\input\202209-divvy-publictripdata.csv'
--FROM 'D:\Cyclystic case study\input\202210-divvy-tripdata.csv'
--FROM 'D:\Cyclystic case study\input\202211-divvy-tripdata.csv'
FROM 'D:\Cyclystic case study\input\202212-divvy-tripdata.csv'
DELIMITER ','
CSV Header;

SELECT * FROM bike;