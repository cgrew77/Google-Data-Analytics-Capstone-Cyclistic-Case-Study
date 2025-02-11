# Google-Data-Analytics-Capstone-Cyclistic-Case-Study
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)
## Introduction
In this case study, I will perform many required tasks of a real-world junior data analyst at Cyclistic, a fictional company. In order to answer the key business questions, I will follow the steps of the data analysis process: [Ask](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/README.md#ask), [Prepare](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/README.md#prepare), [Process](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/README.md#process), [Analyze](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/README.md#analyze-and-share), [Share](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/README.md#analyze-and-share), and [Act](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study#act).
### Quick links:
Data Source: [divvy_tripdata]() [accessed on 02/10/25]  
  
SQL Queries:  
[01. Data Combining](https://github.com/cgrew77/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Combining%20Data.sql)  
[02. Data Exploration](https://github.com/cgrew77/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Exploration%20of%20Data.sql)  
[03. Data Cleaning](https://github.com/cgrew77/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Cleaning%20Data.sql)  
[04. Data Analysis](https://github.com/cgrew77/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Analysis%20of%20Data.sql)  
  
Data Visualizations: [Tableau](https://public.tableau.com/app/profile/christian.grewal/viz/Cyclistic-2024Tripdata-Casestudy/BikeTypes)
## Background
### Cyclistic
A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.   
  
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.  
  
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.  

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.  

### Scenario
I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask
### Business Task
Devise marketing strategies to convert casual riders to annual members.
### Analysis Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

Moreno has assigned me the first given question to answer: How do annual members and casual riders use Cyclistic bikes differently?
## Prepare
### Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2024 to Dec 2024 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).

This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we will not have access to credit card numbers to connect to pass purchases to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.
### Data Organization
There are 12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Process
BigQuery is used to combine the various datasets into one dataset and clean it.    
Reason:  
A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Cyclistic dataset has more than 5.6 million rows, it is essential to use a platform like BigQuery that supports huge volumes of data.
### Combining the Data
SQL Query: [Data Combining](https://github.com/cgrew77/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Combining%20Data.sql)
12 csv files are uploaded as tables in the dataset '2024_tripdata'. Another table named "combined_data" is created, containing 5,680,568 rows of data for the entire year.
### Data Exploration
SQL Query: [Data Exploration](https://github.com/cgrew77/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Exploration%20of%20Data.sql)  
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.  

Observations:
1. The table below shows the all column names and their data types. The __ride_id__ column is our primary key.  

   ![image](https://github.com/user-attachments/assets/0946becc-5e58-4fb4-8675-a0c320f18d91)  

2. The following table shows number of __null values__ in each column.  
   
   ![image](https://github.com/user-attachments/assets/92068a0e-2841-4d10-9760-9024e27b3ba8)

   Note that some columns have same number of missing values. This may be due to missing information in the same row i.e. station's name and id for the same station and latitude and longitude for the same ending station.  
3. As ride_id has no null values, let's use it to check for duplicates.  

   ![image](https://github.com/user-attachments/assets/cbc1e013-76ea-4cb3-a3e8-c312ac8be56d)

   There are 211 __duplicate__ rows in the data.  
   
4. All __ride_id__ values have length of 16 so no need to clean it.
5. There are 3 unique types of bikes(__rideable_type__) in our data.

   ![image](https://github.com/user-attachments/assets/225a3d5e-2a10-40b3-86b7-d68fce9cf7c9)

6. The __started_at__ and __ended_at__ shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format. New column ride_length can be created to find the total trip duration. There are 7596 trips which has duration longer than a day and 132644 trips having less than a minute duration or having end time earlier than start time so need to remove them. Other columns day_of_week and month can also be helpful in analysis of trips at different times in a year.
7. Total of 1073951 rows have both __start_station_name__ and __start_station_id__ missing which needs to be removed.  
8. Total of 1104653 rows have both __end_station_name__ and __end_station_id__ missing which needs to be removed.
9. Total of 7232 rows have both __end_lat__ and __end_lng__ missing which needs to be removed.
10. __member_casual__ column has 2 uniqued values as member or casual rider.

    ![image](https://github.com/user-attachments/assets/29922b98-54ff-498d-b4ad-2584194d26e9)

11. Columns that need to be removed are start_station_id and end_station_id as they do not add value to analysis of our current problem. Longitude and latitude location columns may not be used in analysis but can be used to visualise a map.

### Data Cleaning
SQL Query: [Data Cleaning](https://github.com/cgrew77/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Cleaning%20Data.sql)  
1. All the rows having missing values are deleted.  
2. 3 more columns ride_length for duration of the trip, day_of_week and month are added.  
3. Trips with duration less than a minute and longer than a day are excluded.
4. Total 1,512,411 rows are removed in this step.

## Analyze and Share
SQL Query: [Data Analysis](https://github.com/cgrew77/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/Analysis%20of%20Data.sql)  
Data Visualization: [Tableau](https://public.tableau.com/app/profile/christian.grewal/viz/Cyclistic-2024Tripdata-Casestudy/BikeTypes)
The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Tableau.  
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?  

First of all, member and casual riders are compared by the type of bikes they are using.  

![tab1](https://github.com/user-attachments/assets/2112c036-8021-479d-9cfb-3bcc96ed4f6b)
  
The members make 59.7% of the total while remaining 40.3% constitutes casual riders. Each bike type chart shows percentage from the total. The most used bike is the classic bike followed by the electric bike. Electric scooters are used the least, only by casual riders. 
  
Next the number of trips distributed by the months, days of the week and hours of the day are examined.  
  
![tab2](https://github.com/user-attachments/assets/2e25d672-7baf-490e-be7d-51bd128b075e)
  
__Months:__ When it comes to monthly trips, both casual and members exhibit comparable behavior, with more trips in the spring and summer and fewer in the winter. The gap between casuals and members is closest in summer, during the month of July.   
__Days of Week:__ When the days of the week are compared, it is discovered that casual riders make more journeys on the weekends while members show a decline over the weekend in contrast to the other days of the week.  
__Hours of the Day:__ The members shows 2 peaks throughout the day in terms of number of trips. One is early in the morning at around 6 am to 8 am and other is in the evening at around 4 pm to 8 pm while number of trips for casual riders increase consistently over the day till evening and then decrease afterwards.  
  
We can infer from the previous observations that member may be using bikes for commuting to and from the work in the week days while casual riders are using bikes throughout the day, more frequently over the weekends for leisure purposes. Both are most active in summer and spring.  
  
Ride duration of the trips are compared to find the differences in the behavior of casual and member riders.  
  
![tab3](https://github.com/user-attachments/assets/4a4a810c-7264-4eb5-93c0-fe76d7f861d4)
  
Take note that casual riders tend to cycle longer than members do on average. The length of the average journey for members doesn't change throughout the year, week, or day. However, there are variations in how long casual riders cycle. In the spring and summer, on weekends, and from 10 am to 2 pm during the day, they travel greater distances. Between five and eight in the morning, they have brief trips.
  
These findings lead to the conclusion that casual commuters travel longer (approximately 2x more) but less frequently than members. They make longer journeys on weekends and during the day outside of commuting hours and in spring and summer season, so they might be doing so for recreation purposes.    
  
To further understand the differences in casual and member riders, locations of starting and ending stations can be analysed. Stations with the most trips are considered using filters to draw out the following conclusions.  
  
![tab4](https://github.com/user-attachments/assets/63137224-0838-4f9b-b627-0816e44eb6ce)
  
Casual riders have frequently started their trips from the stations in vicinity of museums, parks, beach, harbor points and aquarium while members have begun their journeys from stations close to universities, residential areas, restaurants, hospitals, grocery stores, theatre, schools, banks, factories, train stations, parks and plazas.  
  
![tab5](https://github.com/user-attachments/assets/07dac130-f985-4c90-bf35-a9894d365283)
  
Similar trends can be observed in ending station locations. Casual riders end their journay near parks, museums and other recreational sites whereas members end their trips close to universities, residential and commmercial areas. So this proves that casual riders use bikes for leisure activities while members extensively rely on them for daily commute.  
  
Summary:
  
|Casual|Member|
|------|------|
|Prefer using bikes throughout the day, more frequently over the weekends in summer and spring for leisure activities.|Prefer riding bikes on week days during commute hours (8 am / 5pm) in summer and spring.|
|Travel 2 times longer but less frequently than members.|Travel more frequently but shorter rides (approximately half of casual riders' trip duration).|
|Start and end their journeys near parks, museums, along the coast and other recreational sites.|Start and end their trips close to universities, residential and commercial areas.|  
  
## Act
After identifying the differences between casual and member riders, marketing strategies to target casual riders can be developed to persuade them to become members.  
Recommendations:  
1. Marketing campaigns might be conducted in spring and summer at tourist/recreational locations popular among casual riders.
2. Casual riders are most active on weekends and during the summer and spring, thus they may be offered seasonal or weekend-only memberships.
3. Casual riders use their bikes for longer durations than members. Offering discounts for longer rides may incentivize casual riders and entice members to ride for longer periods of time.
