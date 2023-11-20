# Google Cyclistic Case Study Data Analytics Capstone Project
Course: [Google Data Analytics Capstone: Complete a Case Study](https://grow.google/certificates/data-analytics/#?modal_active=none)
## Introduction
In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: [Ask](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/edit/main/README.md#ask), [Prepare](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/edit/main/README.md#prepare), [Process](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/edit/main/README.md#process), [Analyze](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/edit/main/README.md#analyze-and-share), [Share](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/edit/main/README.md#analyze-and-share), and [Act](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/edit/main/README.md#act).
### Quick links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)
  
SQL Queries:  
[01. Creating Table and Combining Data](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Queries/Create_table_insert_data.sql)  
[02. Data Exploration](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Queries/Explore_Data.sql)  
[03. Data Cleaning](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Queries/Clean_table.sql)  
[04. Data Analysis](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Queries/Data_Analysis.sql)  

Data Visualizations: [Microsoft Power BI Interactive Dashboard (Download)](https://drive.google.com/uc?export=download&id=10rXojQVI8I0J9-gEtDt-GrLljqRZVQy1)  
## Background

### Scenario
I am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes dierently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

Characters and teams
Cyclistic: A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also oering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.
Lily Moreno: The director of marketing and your manager. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.
Cyclistic marketing analytics team: A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy. You joined this team six months ago and have been busy learning about Cyclistic’s mission and business goals — as well as how you, as a junior data analyst, can help Cyclistic achieve them.
Cyclistic executive team: The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.

## Ask
### Business Task
Devise marketing strategies to convert casual riders to members.
### Analysis Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

The main objective is to determine a way to build a profile for annual members and the best marketing strategies to turn casual bike riders into annual members.

The insights will help the marketing team to increase annual members.
## Prepare
### Data Source
The Project will use the Google Dataset provided [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)
  
This is public data that can be used to explore how different customer types are using Cyclistic bikes.
### Data Organization
There are 12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Process
I will use PostgreSQL to combine the various datasets into one dataset and clean it.    
Reason:  
A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Cyclysic Dataset has many rows, using a PostgreSQL Database will be more profecient and effective. 
PostgreSQL is the preferred choice over Microsoft Excel in projects that require scalable, secure, and collaborative data management with complex data types and advanced automation capabilities.
### Creating the table and combining all of the data from the dataset
SQL Query: [01. Creating Table and Combining Data](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Queries/Create_table_insert_data.sql)  
12 csv files are uploaded as tables in the dataset. A table bike is created to store all of the data from the CSV files. There is 4,529,095 rows of data for the entire year.
### Data Exploration
SQL Query: [02. Data Exploration](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Queries/Explore_Data.sql)  
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.  

Observations:  
1. The following table shows number of __null values__ in each column.  
   
   ![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/Nulls_in_each_column.png)

2. We will use ride_id to check for duplicates, as that is the primary key and has no NULL values.  

   ![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/sql_for_duplicate_rows.png)

   Running the query we get this result.

   ![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/duplicate_rows_result.png)

   We can see that there are 103,770 duplicate rows.
  
3. Make sure that there are only 2 unique Rider Types in the Data.

   ![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/make_sure_that_there_are_only_two_rider_types.png)

   Running that SQL query we can see that the result is a count of 2, which is what we want.

   What are the rider types?

   ![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/what_are_the_rider_types.png)

   Number of trips for each rider type (__member_casual__)

   ![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/cc4.png)

5. The ridable types (bike types) in the Data (3 types) and the amount of trips for each type.

   ![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/cc1.png)

   Result after running query

   ![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/cc2.png)

6. The __started_at__ and __ended_at__ shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format.

  ![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/cc3.png)

7. Amount of rows with invalid start and/or end times

  ![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/cc5.png)

  Running this query we get an amount of __0__ rows with invalid start and/or end times


### Data Cleaning
SQL Query: [Data Cleaning](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Queries/Clean_table.sql)  
1. All the rows having missing values are deleted.  
2. Added 3 more columns to the data. __ride_length__ for duration of the trip and __month__.  
3. Trips with duration less than a minute and longer than a day are excluded.

A new clean table is created in the database called __bike_clean__ . This table will be used to analyze the data for the rest of the project.

Here is what the new table is looking like after all of the cleaning

![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/cc6.png)

Total __#__ rows are removed in this step.
  
## Analyze and Share
SQL Query: [Data Analysis](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Queries/Data_Analysis.sql)  
Data Visualization: [Microsoft Power BI Interactive Dashboard (Download)](https://drive.google.com/uc?export=download&id=10rXojQVI8I0J9-gEtDt-GrLljqRZVQy1) 

Now that the data is clean and ready to be analyzed, let's focud on the analysis question that we discussed in the beginning of this project.

__How do annual members and casual riders use Cyclistic bikes differently?__

First let's look at the distruibution of riders by type

![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/cc8.png)
  
Here we can see that casual riders make up 39.05% of the total riders and members contitute the rest of the total (60.95%). 
  
Next the number of trips distributed by months are looked at
  
![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/cc7.png)
  
Looking at the visual, when rider trips are distributed by month, we can see that members make up a lot of the rides, with trips increasing late spring, most during the summer, some early fall and fewer in the winter. The gap between casuals and members is closest in the month of July in summmer. July also seems to be the month with the most rides.   
  
Average ride duration of the trips are compared by month to find the differences in the behavior of casual and member riders.  
  
![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/cc10.png)  

Here we can clearly see that casual riders tend to spend more time cycling than members do on average. We cab also see that the average length of riding seems to be fairly consistent throughout the months for members. Furthermore, we can observe that there are some varions for casual riders throughout the months. Rides seem to be longer in the spring and summer months and tends to decrease in the fall and winter months.

Casual riders seem to travel longer than members in total, but looking at the previous visual, they ride less frequent than members. As mentioned before, they tend to ride longer in the spring and summer season and average ride length decreases for the other seasons. 

Looking at the start locations for riders can also bring more insight.

![image](https://github.com/Romeeeo/Google_Cyclystic_Case_Study_Capstone_Project/blob/main/Images/cc9.png)

Here we can see that Casual riders ten to start their rides near museums, parks, and near the coast. Observing this we can assume that they usually ride bikes for leisure and/or leisure activities. Members on the other hand tend to start their bike rides near universities, and commercial areas.

Summary:
  
|Casual|Member|
|------|------|
|Prefer to use bikes in summer and spring for leisure.|Prefer riding bikes in summer and spring with an assumption of using them for work.|
|Tend to travel longer than member riders.|Travel more frequently than casual rider, but rides tend to be shorter.|
|Start bike rides near museums, parks, and near the coast.|Start trips near close to universities and commercial areas.|  
  
## Act
After analyzing the difference between casual and member riders, we can suggest recommendations to casual riders to possibly persuade them to become members.

1. Cyclystic can offer different memberships to possibly conform to casual riders. Casual riders seem to ride more bikes in the spring and summer season, so a suggestion could be seasonal membersips, or different locational memberships near leisure areas.
2. Can have more direct marketing campaigns to casual riders in the spring and summer months at leisure/recreational areas that are popular riding areas to casual riders.
3. Another insight that we had is that casual riders tend to ride longer than members in general, so maybe providing memberships to riders that ride an certain average amount of time. 
