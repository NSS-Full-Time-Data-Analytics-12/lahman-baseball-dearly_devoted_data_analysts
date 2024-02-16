-- 13. It is thought that since left-handed pitchers are more rare, 
-- causing batters to face them less often, that they are more effective. 
-- Investigate this claim and present evidence to either support or dispute
-- this claim. First, determine just how rare left-handed pitchers are compared 
-- with right-handed pitchers. Are left-handed pitchers more likely to win the 
-- Cy Young Award? Are they more likely to make it into the hall of fame?

SELECT *
FROM pitching;

SELECT *
FROM halloffame;

SELECT yearid, playerid
FROM awardsplayers
WHERE awardid ILIKE 'CY%';

WITH left_throwers AS(SELECT *
					  FROM people
					  WHERE throws = 'L')

SELECT *
FROM left_throwers LEFT JOIN pitching USING(playerid)
                   INNER JOIN awardsplayers USING(playerid,yearid)
WHERE awardid ILIKE 'Cy Young%';


WITH right_throwers AS(SELECT *
					  FROM people
					  WHERE throws = 'R')

SELECT namefirst,namelast,yearid
FROM right_throwers LEFT JOIN pitching USING(playerid)
                    LEFT JOIN awardsplayers USING(playerid,yearid)
WHERE awardid ILIKE 'Cy Young%'
ORDER BY yearid



























