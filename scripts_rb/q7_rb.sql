-- 7.  From 1970 – 2016, what is the largest number of wins for a team that did 
-- not win the world series? What is the smallest number of wins for a team that 
-- did win the world series? Doing this will probably result in an unusually small
-- number of wins for a world series champion – determine why this is the case. 
-- Then redo your query, excluding the problem year. How often from 1970 – 2016 was it the 
-- case that a team with the most wins also won the world series? What percentage of the time?

--116 wins was the highest that did not win world series.
SELECT yearid, teamid, wswin, w,g
FROM teams
WHERE yearid BETWEEN 1970 AND 2016
	  AND wswin ='N'
ORDER BY w DESC
LIMIT 1;

--63 wins was the lowest, occuring in 1981.
SELECT yearid,teamid, wswin, w
FROM teams
WHERE yearid BETWEEN 1970 AND 2016
	  AND wswin ='Y'
ORDER BY w
LIMIT 1;

SELECT g
FROM teams
WHERE yearid = 1981
ORDER BY g desc;

--A normal mlb season has 162 games. 1981 was shut down for part of the year. They only highest games played was 111.

--THE next lowest wins to have won a world series were 83.
SELECT yearid,teamid, wswin, w
FROM teams
WHERE wswin ='Y'
      AND yearid BETWEEN 1970 AND 2016
	  AND yearid <> 1981
ORDER BY w
LIMIT 1;


--How often from 1970 – 2016 was it the 
-- case that a team with the most wins also won the world series? What percentage of the time?
--26.66%
(SELECT yearid, w
FROM teams
WHERE yearid >=1970 AND wswin = 'Y'
GROUP BY yearid,w
ORDER BY yearid)
INTERSECT
(SELECT yearid, MAX(w)
FROM teams
WHERE yearid >=1970 
GROUP BY yearid
ORDER BY yearid)
ORDER BY yearid DESC

















































