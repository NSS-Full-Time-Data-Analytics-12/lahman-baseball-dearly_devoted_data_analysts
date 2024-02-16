-- 9. Which managers have won the TSN Manager of the Year award 
-- in both the National League (NL) and the American League (AL)?
-- Give their full name and the teams that they were managing 
-- when they won the award.

SELECT *
FROM awardsmanagers;

(SELECT *
FROM awardsmanagers
WHERE awardid ILIKE 'TSN Manager of the Year' AND lgid = 'AL')
UNION 
(SELECT *
FROM awardsmanagers
WHERE awardid ILIKE 'TSN Manager of the Year' AND lgid = 'NL')
ORDER BY yearid;


SELECT *
FROM awardsmanagers;
--filtering down to AL awards
SELECT *
FROM awardsmanagers
WHERE awardid = 'TSN Manager of the Year' AND lgid = 'AL';

--USING previous query as a CTE to combine the table with itself.
--That way I'll have to columns with the lgid to easily compare the two.
WITH AL AS (SELECT *
			FROM awardsmanagers
			WHERE awardid = 'TSN Manager of the Year' AND lgid = 'AL')
SELECT AL.awardid,AL.playerid, AL.yearid, AL.lgid
		, awardsmanagers.yearid, awardsmanagers.lgid
FROM awardsmanagers FULL JOIN AL USING(playerid)
WHERE awardsmanagers.awardid = 'TSN Manager of the Year' AND awardsmanagers.lgid = 'NL'
														 AND AL.lgid = 'AL';

--GOING to bring in the people table and the team table to get the name of the teams.












































