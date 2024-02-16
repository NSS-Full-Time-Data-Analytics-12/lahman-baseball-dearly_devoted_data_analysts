-- 7. From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? What is the smallest number of wins for a team that did win the world series? Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. Then redo your query, excluding the problem year. How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?

SELECT *
FROM teams

SELECT teamid, yearid, w, wswin
FROM teams 
WHERE wswin = 'N' AND yearid >1970
ORDER BY w DESC
LIMIT 1;
-- ----------SEA with 116 wins - YEAR 2001

SELECT teamid, yearid, w, wswin
FROM teams 
WHERE wswin = 'Y' AND yearid >1970
ORDER BY w
LIMIT 1;
-- --------LAN with 63 wins - YEAR 1981


WITH max_win AS (SELECT yearid, MAX(w) AS highest_win
	   			FROM teams
	   			WHERE yearid >= 1970
	   			GROUP BY yearid)
SELECT teamid,yearid, w, wswin
FROM max_win
INNER JOIN teams 
USING (yearid)
WHERE wswin = 'Y' AND w = highest_win
ORDER BY w DESC;








-- SELECT teamid, yearid, SUM(w) AS total_wins, wswin
-- FROM teams
-- WHERE wswin = 'Y' AND yearid <> 1981 AND yearid >1970
-- GROUP BY teamid, yearid, wswin
-- ORDER BY total_wins


-- SELECT teamid, yearid, MAX(wins) AS max_wins, teamidwinner
-- FROM teams
-- INNER JOIN seriespost AS sp
-- USING (yearid)
-- WHERE wswin = 'Y' AND yearid <>1981 AND yearid >1970
-- GROUP BY teamid, yearid, teamidwinner
-- ORDER BY max_wins DESC;


-- SELECT teamid, yearid, MAX(w) AS max_win, wswin
-- FROM teams
-- WHERE wswin='Y' AND yearid <>1981 AND yearid >=1970 
-- GROUP BY teamid, yearid, wswin
-- ORDER BY max_win DESC;






Percentage : 26.6%