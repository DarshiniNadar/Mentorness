SELECT *
  FROM [MENTORNESS].[dbo].[Corona Virus Dataset]
 --find the null values
   select 
Sum(case when Province is null then 1 else 0 end) as Province_1,
Sum(case when [Country Region] is null then 1 else 0 end) as Country_Region_1,
Sum(case when Latitude is null then 1 else 0 end) as Latitude_1,
Sum(case when Longitude is null then 1 else 0 end) as Longitude_1,
Sum(case when Date is null then 1 else 0 end) as Date_1,
Sum(case when Confirmed is null then 1 else 0 end) as Confirmed_1,
Sum(case when Deaths is null then 1 else 0 end) as Deaths_1,
Sum(case when Recovered is null then 1 else 0 end) as Recovered_1
from [Corona Virus Dataset];
--Checking the total no. of rows in the dataset
SELECT COUNT(*) AS Row_num
FROM [Corona Virus Dataset];
--Checking the Start date and the End date.
SELECT MIN(Date) AS START_DATE
FROM [Corona Virus Dataset];
SELECT MAX(Date) AS END_DATE
FROM [Corona Virus Dataset];
--Total no. of months present in the Dataset
select Year(Date) as Year, count(Distinct Month(Date)) as Num_Of_Months_Present
from [Corona Virus Dataset] 
group by Year(Date);
--To find the monthly average for confirmed, deaths, recovered
SELECT 
    year(Date) AS year,
    MONTH(Date) AS Month,
    AVG(Confirmed) AS AvgConfirmed,
    AVG(Deaths) AS AvgDeaths,
	AVG(Recovered) AS AvgRecovered
FROM [Corona Virus Dataset]
GROUP BY MONTH(Date),YEAR(Date)
ORDER BY Month,YEAR;
--To find the most frequent value for confirmed, deaths, recovered each month

--To find the minimum values for confirmed, deaths, recovered per year
SELECT 
    Year(Date) AS Year,
    MIN(Confirmed) AS MinConfirmed,
    MIN(Deaths) AS MinDeaths,
	MIN(Recovered) AS MinRecovered
FROM [Corona Virus Dataset]
GROUP BY YEAR(Date)
ORDER BY Year;
--To find the maximum values of confirmed, deaths, recovered per year
SELECT 
    Year(Date) AS Year,
	MAX(Confirmed) AS MaxConfirmed,
    MAX(Deaths) AS MaxDeaths,
	MAX(Recovered) AS MaxRecovered
FROM [Corona Virus Dataset]
GROUP BY YEAR(Date)
ORDER BY Year;
--To find the total number of case of confirmed, deaths, recovered each month
SELECT 
    Year(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(Confirmed) AS TotalConfirmed,
    SUM(Deaths) AS TotalDeaths,
    SUM(Recovered) AS TotalRecovered
FROM [Corona Virus Dataset]
GROUP BY  MONTH(Date),YEAR(Date)
ORDER BY Month,Year;
--To check how corona virus spread out with respect to confirmed case
SELECT 
    SUM(Confirmed) AS TotalConfirmed,
    AVG(Confirmed) AS AverageConfirmed,
    VAR(Confirmed) AS VarianceConfirmed,
    STDEV(Confirmed) AS StdevConfirmed
FROM [Corona Virus Dataset]
--To check how corona virus spread out with respect to death case per month
SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(Deaths) AS TotalDeaths,
    AVG(Deaths) AS AverageDeaths,
    VAR(Deaths) AS VarianceDeaths,
    STDEV(Deaths) AS StdevDeaths
FROM [Corona Virus Dataset]
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year,Month;
--To check how corona virus spread out with respect to recovered case
SELECT 
    SUM(Recovered) AS TotalRecovered,
    AVG(Recovered) AS AverageRecovered,
    VAR(Recovered) AS VarianceRecovered,
    STDEV(Recovered) AS StdevRecovered
FROM [Corona Virus Dataset];
--To find Country having highest number of the Confirmed case
SELECT TOP 1
    [Country Region],
    SUM(Confirmed) AS TotalConfirmed
FROM [Corona Virus Dataset]
GROUP BY [Country Region]
ORDER BY TotalConfirmed DESC;
--To find Country having lowest number of the death case
SELECT TOP 1
    [Country Region],
    SUM(Deaths) AS TotalDeaths
FROM [Corona Virus Dataset]
GROUP BY [Country Region]
ORDER BY TotalDeaths ASC;
--To find the top 5 countries having highest recovered case
SELECT TOP 5
    [Country Region],
    SUM(Recovered) AS TotalRecovered
FROM [Corona Virus Dataset]
GROUP BY [Country Region]
ORDER BY TotalRecovered DESC;
