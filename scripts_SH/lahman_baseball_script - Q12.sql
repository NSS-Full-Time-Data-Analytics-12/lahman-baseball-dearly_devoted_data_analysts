-- 12.In this question, you will explore the connection between number of wins and attendance. Does there appear to be any correlation between attendance at home games and number of wins. Do teams that win the world series see a boost in attendance the following year? What about teams that made the playoffs? Making the playoffs means either being a division winner or a wild card winner.

SELECT *
FROM homegames

SELECT teams.wswin, SUM(homegames.attendance), teamid
FROM teams
INNER JOIN homegames
ON teams.yearid = homegames.year
WHERE wswin = 'Y'
GROUP BY teams.wswin, teamid



SELECT *
FROM teams