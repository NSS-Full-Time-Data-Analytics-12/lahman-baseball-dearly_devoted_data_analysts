-- 11. Is there any correlation between number of wins and team salary? Use data from 2000 and later to answer this question. As you do this analysis, keep in mind that salaries across the whole league tend to increase together, so you may want to look on a year-by-year basis.


SELECT teamid, salaries.yearid, w, SUM(salary)::numeric::money AS team_salary
FROM teams
INNER JOIN salaries
USING (teamid)
WHERE salaries.yearid >= 2000
GROUP BY teamid, salaries.yearid, w
ORDER BY teamid



