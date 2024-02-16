-- 10. Find all players who hit their career highest number of home runs in 2016. 
-- Consider only players who have played in the league for at least 10 years
-- ,and who hit at least one home run in 2016.
-- Report the players' first and last names and the number of home runs they hit in 2016.

SELECT *
FROM batting;

SELECT *
FROM people;

SELECT *
FROM batting
WHERE yearid = 2016;

WITH decade_players AS(SELECT playerid,namefirst,namelast, max(hr) 
					FROM batting INNER JOIN people USING(playerid)
					WHERE debut <='2006-01-01' 
					GROUP BY namefirst, namelast, playerid
				   ORDER BY max DESC)
SELECT yearid, namefirst, namelast, hr, max 
FROM batting INNER JOIN decade_players USING(playerid)
WHERE yearid = 2016 AND max = hr AND hr >=1



							 













































