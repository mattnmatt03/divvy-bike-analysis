#  Divvy Bike User Behavior Analysis

##  Mission
Analyze rider behavior using 300K+ records from the Divvy Bike dataset to uncover usage patterns by time, day, and user type.

## Repository Structure
- `SQL/`: All SQL queries used for cleaning, enrichment, and aggregation.
- `visuals/`: Charts and heatmaps for visual interpretation.
- `README.md`: Project overview and key findings.

## Application Used
- SQL (MySQL syntax)
- Tableau / Power BI
- Excel

## Key Analysis: Ride Patterns by Hour & Day
```sql
-- SQL snippet showing cleaned + aggregated ride data
SELECT member_casual, DAYNAME(started_at) AS day_of_week, ...
