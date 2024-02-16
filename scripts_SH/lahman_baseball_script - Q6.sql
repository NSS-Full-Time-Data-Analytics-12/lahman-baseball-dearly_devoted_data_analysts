-- 6.Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.


SELECT p.namefirst AS first_name, p.namelast AS last_name, (b.sb*100/(b.sb+b.cs)) AS stolen_bases_perc
FROM batting AS b
INNER JOIN people AS p
USING (playerid)
WHERE b.yearid = '2016' AND (b.cs+b.sb)>20
GROUP BY first_name, last_name, b.sb, b.cs
ORDER BY stolen_bases_perc DESC
LIMIT 1;

------------------- ANSWER CHRIS OWINGS - 91% ------------------------
