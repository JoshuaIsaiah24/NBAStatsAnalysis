
SELECT *
FROM NBA..NbaStats

-- Shot distribution Analysis (3PTs vs 2PTs attempts) changed over the seasons.

WITH LeagueAverages AS (
    SELECT 
        YearSeason,
        AVG([2PA] / FGA) AS LeagueAverageTwoPointPercentage,
		AVG([3PA] / FGA) AS LeagueAverageThreePointPercentage
    FROM 
        NBA..NBAStats
    GROUP BY 
        YearSeason
)
SELECT
    s.Team,
    s.FGA, 
    s.[2PA],
	s.[3PA],
    (s.[2PA] / s.FGA) AS TwoPointPercentageShare,
	(s.[3PA] / s.FGA) AS ThreePointPercentageShare,
    la.LeagueAverageTwoPointPercentage,
	la.LeagueAverageThreePointPercentage,
    s.YearSeason
FROM 
    NBA..NBAStats s
JOIN
    LeagueAverages la
    ON s.YearSeason = la.YearSeason
ORDER BY 
    s.YearSeason DESC, 
	ThreePointPercentageShare DESC,
    TwoPointPercentageShare DESC


-- What Percentage of Total Points now comes from 3 pointers (and 2 pointers) compared to previous seasons.

WITH LeagueAverage as (
	SELECT
		YearSeason,
		AVG(([2P] * 2) / PTS) as LeagueTwoPointAverage,
		AVG(([3P] * 3) / PTS) as LeagueThreePointAverage
	FROM
		NBA..NBAStats
	GROUP BY
		YearSeason
)
SELECT
	s.Team,
	s.FG,
	s.[2P],
	s.[3P],
	(s.[2P] * 2) / PTS AS TwoPointShare,
	(s.[3P] * 3) / PTS AS ThreePointShare,
	s.PTS,
	la.LeagueTwoPointAverage,
	la.LeagueThreePointAverage,
	s.YearSeason
FROM NBA..NBAStats s
JOIN LeagueAverage la ON s.YearSeason = la.YearSeason
ORDER BY S.YearSeason DESC, ThreePointShare DESC, TwoPointShare DESC

-- Efficiency Metrics: How has the field goal percentage, 3pt, 2pts and FT evolved over time?

SELECT
	YearSeason,
	AVG([FG%]) as FieldGoalLeagueAve,
	AVG([2P%]) as TwoPointLeagueAve,
	AVG([3P%]) as ThreePointLeagueAve,
	AVG([FT%]) as FTLeagueAve
FROM NBA..NBAStats
GROUP BY
	YearSeason
ORDER BY
	YearSeason DESC

-- League's "True Shooting (TS%)" percentage trend over seasons

SELECT
    YearSeason,
    AVG(PTS) AS LeagueAvePts,
    AVG(FGA) AS LeagueFGAve,
   AVG(FTA) AS LeagueFTAve,
   (AVG(PTS) / (2 * (AVG(FGA) + 0.44 * AVG(FTA)))) AS LeagueTrueShootingPercentage
FROM
    NBA..NBAStats
GROUP BY
	YearSeason
ORDER BY
	YearSeason DESC