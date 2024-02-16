-- 5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends?




SELECT ROUND(AVG(so),2) AS avg_strikeout, ROUND(AVG(hr),2) AS avg_homerun,
     CASE WHEN yearid BETWEEN 1920 AND 1929 THEN '1920s'
          WHEN yearid BETWEEN 1930 AND 1939 THEN '1930s'
	      WHEN yearid BETWEEN 1940 AND 1949 THEN '1940s'
	      WHEN yearid BETWEEN 1950 AND 1959 THEN '1950s'
	      WHEN yearid BETWEEN 1960 AND 1969 THEN '1960s'
          WHEN yearid BETWEEN 1970 AND 1979 THEN '1970s'
	      WHEN yearid BETWEEN 1980 AND 1989 THEN '1980s'
	      WHEN yearid BETWEEN 1990 AND 1999 THEN '1990s'
	      WHEN yearid BETWEEN 2000 AND 2009 THEN '2000s'
	      WHEN yearid BETWEEN 2010 AND 2019 THEN '2010s' END AS decade
FROM batting
GROUP BY decade

	 


-- SELECT AVG(so)
-- FROM batting


-- SELECT *
-- FROM batting





