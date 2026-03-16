
-- Create Database
CREATE DATABASE strava_analysis;
USE strava_analysis;

-- Create Tables

CREATE TABLE dailyActivity (
Id BIGINT,
ActivityDate DATE,
TotalSteps INT,
TotalDistance FLOAT,
TrackerDistance FLOAT,
LoggedActivitiesDistance FLOAT,
VeryActiveDistance FLOAT,
ModeratelyActiveDistance FLOAT,
LightActiveDistance FLOAT,
SedentaryActiveDistance FLOAT,
VeryActiveMinutes INT,
FairlyActiveMinutes INT,
LightlyActiveMinutes INT,
SedentaryMinutes INT,
Calories INT
);

CREATE TABLE sleepDay (
Id BIGINT,
SleepDay DATETIME,
TotalSleepRecords INT,
TotalMinutesAsleep INT,
TotalTimeInBed INT
);

CREATE TABLE dailyCalories (
Id BIGINT,
ActivityDay DATE,
Calories INT
);

CREATE TABLE dailySteps (
Id BIGINT,
ActivityDay DATE,
StepTotal INT
);

CREATE TABLE dailyIntensities (
Id BIGINT,
ActivityDay DATE,
SedentaryMinutes INT,
LightlyActiveMinutes INT,
FairlyActiveMinutes INT,
VeryActiveMinutes INT,
SedentaryActiveDistance FLOAT,
LightActiveDistance FLOAT,
ModeratelyActiveDistance FLOAT,
VeryActiveDistance FLOAT
);

-- 1. Total number of records in each table
SELECT COUNT(*) FROM dailyActivity;
SELECT COUNT(*) FROM sleepDay;
SELECT COUNT(*) FROM dailyCalories;
SELECT COUNT(*) FROM dailySteps;
SELECT COUNT(*) FROM dailyIntensities;

-- 2. Average steps per user
SELECT Id, AVG(TotalSteps) AS AvgSteps
FROM dailyActivity
GROUP BY Id
ORDER BY AvgSteps DESC;

-- 3. Average calories burned per user
SELECT Id, AVG(Calories) AS AvgCalories
FROM dailyActivity
GROUP BY Id
ORDER BY AvgCalories DESC;

-- 4. Total distance covered by each user
SELECT Id, SUM(TotalDistance) AS TotalDistanceCovered
FROM dailyActivity
GROUP BY Id
ORDER BY TotalDistanceCovered DESC;

-- 5. Users with highest activity minutes
SELECT Id,
SUM(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes) AS TotalActiveMinutes
FROM dailyActivity
GROUP BY Id
ORDER BY TotalActiveMinutes DESC;

-- 6. Average sleep time of users
SELECT Id, AVG(TotalMinutesAsleep) AS AvgSleepMinutes
FROM sleepDay
GROUP BY Id
ORDER BY AvgSleepMinutes DESC;

-- 7. Top 10 days with highest steps
SELECT ActivityDate, TotalSteps
FROM dailyActivity
ORDER BY TotalSteps DESC
LIMIT 10;

-- 8. Relationship between steps and calories
SELECT TotalSteps, Calories
FROM dailyActivity
ORDER BY TotalSteps DESC;

-- 9. Sedentary minutes analysis
SELECT Id, AVG(SedentaryMinutes) AS AvgSedentaryMinutes
FROM dailyActivity
GROUP BY Id
ORDER BY AvgSedentaryMinutes DESC;

-- 10. Total sleep records count
SELECT SUM(TotalSleepRecords) AS TotalSleepRecords
FROM sleepDay;
