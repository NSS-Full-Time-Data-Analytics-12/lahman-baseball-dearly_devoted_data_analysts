-- 3. Find all players in the database who played at 
-- Vanderbilt University. Create a list showing each 
-- player’s first and last names as well as the total
-- salary they earned in the major leagues. Sort this 
-- list in descending order by the total salary earned.
-- Which Vanderbilt player earned the most money in 
-- the majors?

SELECT *
FROM  schools
WHERE schoolname ILIKE 'Vanderbilt%';

SELECT 
FROM collegeplaying
WHERE schoolid ILIKE 'vandy';
--using intersect to narrow down to just vandy players on the people table.

(SELECT playerid
FROM collegeplaying
 WHERE schoolid ILIKE 'vandy')
INTERSECT
(SELECT playerid
FROM people);
--CTE for the vandy players

WITH vandy_players AS ((SELECT playerid
                       FROM collegeplaying
				       WHERE schoolid ILIKE 'vandy')
				       INTERSECT
				       (SELECT playerid
				       FROM people))
					  
SELECT namefirst, namelast
FROM people INNER JOIN vandy_players USING(playerid);

--bringing in salary table

WITH vandy_players AS ((SELECT playerid
                       FROM collegeplaying
				       WHERE schoolid ILIKE 'vandy')
				       INTERSECT
				       (SELECT playerid
				       FROM people))
					  
SELECT playerid,namefirst, namelast, SUM(salaries.salary) AS total_salary
FROM people INNER JOIN vandy_players USING(playerid)
			INNER JOIN salaries USING(playerid)
GROUP BY playerid
ORDER BY total_salary DESC;



















