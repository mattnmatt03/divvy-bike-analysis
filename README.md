
# 🚲 Divvy Bike User Behavior Analysis

## 📊 Objective
Analyze rider behavior using 300K+ records from the Divvy Bike dataset to uncover usage patterns by time, day, and user type.

## 📁 Repository Structure
- `SQL/`: SQL queries used for data cleaning, enrichment, and analysis.
- `visuals/`: Visual outputs (charts, heatmaps) created using Tableau or Power BI.
- `README.md`: Project documentation and findings.

## 🛠 Tools Used
- SQL (MySQL syntax)
- Tableau / Power BI
- Excel

## 📈 Key Analysis: Ride Patterns by Hour & Day
```sql
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
```

## 🌐 Insights
- **Casual users** ride most often on weekends, especially during late mornings and afternoons.
- **Members** ride primarily on weekdays, peaking during typical commute hours (7–9 AM, 4–6 PM).
- Casual users have **longer average ride durations** compared to members.

## 📷 Visuals
![Heatmap](visuals/peak_hour_heatmap.png)

## 📎 Future Work
- Analyze top stations by ride frequency
- Monthly trends and seasonality patterns
- Distance-based analysis (if GPS or trip length data available)
