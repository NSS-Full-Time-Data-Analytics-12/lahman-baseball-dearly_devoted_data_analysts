-- 12. In this question, you will explore the connection between number of wins and attendance.
--     <ol type="a">
--       <li>Does there appear to be any correlation between attendance at home games and number of wins? </li>
--       <li>Do teams that win the world series see a boost in attendance the following year? 
-- What about teams that made the playoffs? Making the playoffs means either being a division winner or a wild card winner.</li>
-- --     </ol>

SELECT*
FROM teams;

SELECT *
FROM homegames; 

SELECT *
FROM parks;

SELECT year,SUM(homegames.attendance), teams.w
FROM teams INNER JOIN homegames ON teams.teamid = homegames.team 
								AND teams.yearid = homegames.year
			INNER JOIN parks ON homegames.park = parks.park
WHERE homegames.attendance >0
GROUP BY homegames.year, teams.w


			
			
















