
-- Clean and enrich the dataset
SELECT 
    ride_id,
    rideable_type,
    member_casual,
    start_station_name,
    end_station_name,
    started_at,
    ended_at,
    TIMESTAMPDIFF(MINUTE, started_at, ended_at) AS ride_duration_mins,
    DAYNAME(started_at) AS day_of_week,
    HOUR(started_at) AS hour_of_day
FROM 
    divvy_trips
WHERE 
    started_at < ended_at;

-- Aggregate ride patterns by user type, day, and hour
SELECT 
    member_casual,
    DAYNAME(started_at) AS day_of_week,
    HOUR(started_at) AS hour_of_day,
    COUNT(*) AS total_rides,
    AVG(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS avg_ride_duration
FROM 
    divvy_trips
WHERE 
    started_at < ended_at
GROUP BY 
    member_casual, day_of_week, hour_of_day
ORDER BY 
    member_casual, FIELD(day_of_week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'), hour_of_day;
