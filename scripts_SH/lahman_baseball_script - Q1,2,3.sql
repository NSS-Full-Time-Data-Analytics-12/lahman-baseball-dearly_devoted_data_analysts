-- 1. What range of years for baseball games played does the provided database cover? 

--                   (MAX - 2016) (MIN -1871) 

SELECT MAX(yearid), MIN(yearid)
FROM teams;

SELECT MAX(year), MIN(year)
FROM homegames;

SELECT MAX(yearid), MIN(yearid)
FROM pitching;

SELECT MAX (yearid), MIN(yearid)     
FROM collegeplaying



-- 2.Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?

-- -------------    (EDDIE GAEDEL played in 1 game for SLA)   ------------
	  
	  
	  
SELECT namefirst AS first_name, namelast AS last_name
FROM people
WHERE height = (SELECT MIN(height)
                 FROM people)

SELECT namefirst AS first_name, namelast AS last_name, g_all AS games_played, appearances.teamid AS team_id
FROM people
INNER JOIN appearances
USING (playerid)
INNER JOIN teams
USING (yearid)
WHERE height =(SELECT MIN(height)
				FROM people)
GROUP BY first_name, last_name, games_played, team_id


-- 3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?


SELECT namefirst AS first_name, namelast AS last_name, SUM(salary)::numeric::money AS total_salary
FROM people
INNER JOIN collegeplaying
USING(playerid)
INNER JOIN schools
USING (schoolid)
INNER JOIN salaries
USING (playerid)
WHERE schoolname ILIKE '%Vanderbilt University%'
GROUP BY first_name, last_name
ORDER BY total_salary DESC;


-- ------------------------------- ANSWER DAVID PRICE $245,553,888-----------------------------------

-- SELECT *
-- FROM people
-- SELECT *
-- FROM teams
-- SELECT *
-- FROM pitching
-- SELECT *
-- FROM appearances






