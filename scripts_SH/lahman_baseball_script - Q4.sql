-- 4. Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these three groups in 2016.

SELECT  playerid, pos, po,
        (CASE WHEN pos= 'SS' OR pos= '1B' OR pos= '2B' OR pos= '3B' THEN 'Infield'
		 WHEN pos= 'P' OR pos= 'C' THEN 'Battery'
		 ELSE 'Outfield' END) AS pos_group
FROM fielding


		 
WITH position_group AS (SELECT  playerid, pos, po,
        (CASE WHEN pos= 'SS' OR pos= '1B' OR pos= '2B' OR pos= '3B' THEN 'Infield'
		 WHEN pos= 'P' OR pos= 'C' THEN 'Battery'
		 ELSE 'Outfield' END) AS pos_group
         FROM fielding)	 
SELECT pos_group, SUM(fielding.po) AS total_putout
FROM fielding
INNER JOIN position_group
USING (playerid)
WHERE fielding.yearid = '2016'
GROUP BY pos_group



SELECT SUM(po) as total_putout,
                         (CASE WHEN pos = 'P' OR pos ='C' THEN 'Battery'
                              WHEN pos = '1B' OR pos = '2B' OR pos = 'SS' OR pos = '3B' THEN 'Infield'
                              ELSE 'Outfield' END) AS position_group
FROM fielding
WHERE yearid = '2016'
GROUP BY position_group;











		 
