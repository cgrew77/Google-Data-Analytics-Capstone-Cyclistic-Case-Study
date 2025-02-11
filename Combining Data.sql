-- Data Combining

DROP TABLE IF EXISTS `2024_tripdata.combined_data`;

-- Combining data from all 12 months into a single table containing data from Jan 2024 to Dec 2024.

CREATE TABLE IF NOT EXISTS `2024_tripdata.combined_data` AS (
  
  SELECT * FROM `2024_tripdata.202401_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202402_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202403_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202404_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202405_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202406_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202407_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202408_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202409_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202410_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202411_tripdata`
  UNION ALL
  SELECT * FROM `2024_tripdata.202412_tripdata`
  
);

-- Checking number of rows which is 5860568

SELECT COUNT(*)
FROM `2024_tripdata.combined_data`;