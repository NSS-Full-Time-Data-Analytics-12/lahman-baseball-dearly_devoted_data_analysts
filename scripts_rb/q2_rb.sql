-- 2. Find the name and height of the shortest player in 
-- the database. How many games did he play in? What is 
-- the name of the team for which he played?
SELECT *
FROM people; 

SELECT *
FROM appearances;

SELECT *
FROM teams;

SELECT height, namefirst, namelast
FROM people
ORDER BY height
LIMIT 1;

SELECT namefirst, namelast,height,  g_all,teamid
FROM people INNER JOIN appearances USING(playerid)
			INNER JOIN teams USING(teamid)
ORDER BY height
LIMIT 1;




