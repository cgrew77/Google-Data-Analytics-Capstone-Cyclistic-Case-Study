-- Data Exploration

-- Checking data types of all columns

SELECT column_name, data_type
FROM `2024_tripdata`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'combined_data';

-- Checking for number of null values in all columns

SELECT COUNT(*) - COUNT(ride_id) ride_id,
  COUNT(*) - COUNT(rideable_type) rideable_type,
  COUNT(*) - COUNT(started_at) started_at,
  COUNT(*) - COUNT(ended_at) ended_at,
  COUNT(*) - COUNT(start_station_name) start_station_name,
  COUNT(*) - COUNT(start_station_id) start_station_id,
  COUNT(*) - COUNT(end_station_name) end_station_name,
  COUNT(*) - COUNT(end_station_id) end_station_id,
  COUNT(*) - COUNT(start_lat) start_lat,
  COUNT(*) - COUNT(start_lng) start_lng,
  COUNT(*) - COUNT(end_lat) end_lat,
  COUNT(*) - COUNT(end_lng) end_lng,
  COUNT(*) - COUNT(member_casual) member_casual,
FROM `2024_tripdata.combined_data`;

-- Checking for duplicate rows

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `2024_tripdata.combined_data`;

-- ride_id: All have length of 16

SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS num_rows
FROM `2024_tripdata.combined_data`
GROUP BY length_ride_id;

-- rideable_type: Three unique bike types

SELECT DISTINCT rideable_type, COUNT(rideable_type) AS num_trips
FROM `2024_tripdata.combined_data`
GROUP BY rideable_type;

-- started_at, ended_at: TIMESTAMP: YYYY-MM-DD hh:mm:ss UTC

SELECT started_at, ended_at
FROM `2024_tripdata.combined_data`
LIMIT 10;

SELECT COUNT(*) AS longer_than_day
FROM `2024_tripdata.combined_data`
WHERE (
  EXTRACT(HOUR FROM(ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM(ended_at - started_at)) + 
  EXTRACT(SECOND FROM(ended_at - started_at)) / 60) >= 1440;      -- Longer than a day: total rows = 7596

SELECT COUNT(*) AS less_than_minute
FROM `2024_tripdata.combined_data`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1;        -- Less than a minute: total rows = 132644

-- start_station_name, start_station_id: total 1073951 rows missing both start station name and id

SELECT DISTINCT start_station_name
FROM `2024_tripdata.combined_data`
ORDER BY start_station_name;

SELECT COUNT(ride_id) AS rows_with_null_start_station             -- Returns 1073951 rows
FROM `2024_tripdata.combined_data`
WHERE start_station_name IS NULL OR start_station_id IS NULL;

-- end_station_name, end_station_id: total 1104653 rows missing both end station name and id

SELECT DISTINCT end_station_name
FROM `2024_tripdata.combined_data`
ORDER BY end_station_name;

SELECT COUNT(ride_id) AS rows_with_null_end_station          -- return 1104653 rows
FROM `2024_tripdata.combined_data`
WHERE end_station_name IS NULL OR end_station_id IS NULL;

-- end_lat, end_lng: total 7232 rows missing both end latitude and longitude

SELECT COUNT(ride_id) AS rows_with_null_end_loc
FROM `2024_tripdata.combined_data`
WHERE end_lat IS NULL OR end_lng IS NULL;

-- member_casual: Two unique values: member and casual riders

SELECT DISTINCT member_casual, COUNT(member_casual) AS num_trips
FROM `2024_tripdata.combined_data`
GROUP BY member_casual;