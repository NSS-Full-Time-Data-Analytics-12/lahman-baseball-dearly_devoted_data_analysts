-- 6. Find the player who had the most success stealing bases in 2016,
-- where __success__ is measured as the percentage of stolen base 
-- attempts which are successful. (A stolen base attempt results either
-- in a stolen base or being caught stealing.) Consider only players who 
-- attempted _at least_ 20 stolen bases.



WITH stealing_bases AS(SELECT sb, cs, sb+cs AS steal_attempts
					   FROM batting
					   WHERE yearid = 2016
					   ORDER By sb DESC)
SELECT namefirst
		,namelast
		,yearid
		,sb
	   ,stealing_bases.cs
	   ,steal_attempts
	   , ROUND(sb::numeric/steal_attempts::numeric,4) AS percent_successful
FROM stealing_bases INNER JOIN batting USING(sb)
					INNER JOIN people USING(playerid)
WHERE steal_attempts >=20 AND yearid =2016
ORDER BY percent_successful DESC