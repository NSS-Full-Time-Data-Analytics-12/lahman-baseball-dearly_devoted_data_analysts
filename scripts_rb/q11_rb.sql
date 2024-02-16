-- 11. Is there any correlation between number of wins and team salary? 
-- Use data from 2000 and later to answer this question. As you do 
-- this analysis, keep in mind that salaries across 
-- the whole league tend to increase together, so you may want to look on a year-by-year basis.
SELECT *
FROM salaries;

SELECT DISTINCT teamid
FROM teams 
WHERE yearid >= 2000;



WITH team_salary AS(SELECT teamid,yearid, SUM(salary)::numeric::money AS total_salary
					FROM salaries
					WHERE yearid >=2000
					GROUP BY teamid,yearid
					ORDER BY teamid, yearid)
					
SELECT teamid,team_salary.yearid, team_salary.total_salary
		,teams.w, teams.name
FROM teams INNER JOIN team_salary USING (teamid, yearid)
ORDER BY teamid, yearid DESC;
 -- TRYING A CASE WHEN TO HAVE ON COLUMN PER YEAR.
 
 
 
 












