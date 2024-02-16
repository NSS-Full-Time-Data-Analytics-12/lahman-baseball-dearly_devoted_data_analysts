-- 5. Find the average number of strikeouts per game 
-- by decade since 1920. Round the numbers you report 
-- to 2 decimal places. Do the same for home runs per 
-- game. Do you see any trends?

SELECT *
FROM pitching;
 --1 broken down by team. My thought process was multiple players would be on the same team
 --so there would be multiple entries for the same games.
WITH decade_breakdown AS(SELECT teamid
	   						    ,sum(g) AS total_games 
	   							,sum(so) AS total_strikeouts
	  						    ,CASE WHEN yearid BETWEEN 1920 AND 1929 THEN '1920s'
			  						  WHEN yearid BETWEEN 1930 AND 1939 THEN '1930s'
			  						  WHEN yearid BETWEEN 1940 AND 1949 THEN '1940s'
			  						  WHEN yearid BETWEEN 1950 AND 1959 THEN '1950s'
			 						  WHEN yearid BETWEEN 1960 AND 1969 THEN '1960s'
			 						  WHEN yearid BETWEEN 1970 AND 1979 THEN '1970s'
									  WHEN yearid BETWEEN 1980 AND 1989 THEN '1980s'
									  WHEN yearid BETWEEN 1990 AND 1999 THEN '1990s'
									  WHEN yearid BETWEEN 2000 AND 2009 THEN '2000s'
									  WHEN yearid BETWEEN 2010 AND 2019 THEN '2010s'
									  END AS Decade
						FROM pitching
						WHERE yearid >=1920
						GROUP BY teamid,pitching.yearid
						ORDER BY  decade)
						
						
						
SELECT decade
	  ,ROUND(total_strikeouts::numeric/total_games::numeric,2) AS avg_strikeouts
FROM decade_breakdown;

-- WITH decade_breakdown AS
-- (SELECT SUM(pitching.g) AS pitching_games
-- 	   ,SUM(pitching.so) AS pitching_so
-- 	   ,CASE WHEN pitching.yearid BETWEEN 1920 AND 1929 THEN '1920s'
-- 			  						  WHEN pitching.yearid BETWEEN 1930 AND 1939 THEN '1930s'
-- 			  						  WHEN pitching.yearid BETWEEN 1940 AND 1949 THEN '1940s'
-- 			  						  WHEN pitching.yearid BETWEEN 1950 AND 1959 THEN '1950s'
-- 			 						  WHEN pitching.yearid BETWEEN 1960 AND 1969 THEN '1960s'
-- 			 						  WHEN pitching.yearid BETWEEN 1970 AND 1979 THEN '1970s'
-- 									  WHEN pitching.yearid BETWEEN 1980 AND 1989 THEN '1980s'
-- 									  WHEN pitching.yearid BETWEEN 1990 AND 1999 THEN '1990s'
-- 									  WHEN pitching.yearid BETWEEN 2000 AND 2009 THEN '2000s'
-- 									  WHEN pitching.yearid BETWEEN 2010 AND 2019 THEN '2010s'
-- 									  END AS pitching_decade
-- 		,SUM(batting.so) AS batting_so	
-- 		,SUM(batting.g) AS batting_games
-- 	   ,CASE WHEN batting.yearid BETWEEN 1920 AND 1929 THEN '1920s'
-- 			  						  WHEN batting.yearid BETWEEN 1930 AND 1939 THEN '1930s'
-- 			  						  WHEN batting.yearid BETWEEN 1940 AND 1949 THEN '1940s'
-- 			  						  WHEN batting.yearid BETWEEN 1950 AND 1959 THEN '1950s'
-- 			 						  WHEN batting.yearid BETWEEN 1960 AND 1969 THEN '1960s'
-- 			 						  WHEN batting.yearid BETWEEN 1970 AND 1979 THEN '1970s'
-- 									  WHEN batting.yearid BETWEEN 1980 AND 1989 THEN '1980s'
-- 									  WHEN batting.yearid BETWEEN 1990 AND 1999 THEN '1990s'
-- 									  WHEN batting.yearid BETWEEN 2000 AND 2009 THEN '2000s'
-- 									  WHEN batting.yearid BETWEEN 2010 AND 2019 THEN '2010s'
-- 									  END AS batting_decade
-- FROM pitching INNER JOIN batting USING(playerid)
-- WHERE pitching.yearid >= 1920 OR batting.yearid >=1920
-- GROUP BY pitching.yearid, batting.yearid)

-- SELECT pitching_decade
-- 	  ,ROUND(pitching_so::numeric/pitching_games::numeric,2) AS avg_pitching_so
-- 	  ,batting_decade
-- 	  ,ROUND(batting_so::numeric/batting_games::numeric,2) AS avg_batting_so
-- FROM decade_breakdown
-- GROUP BY pitching_decade, batting_decade;

--2 was just doing it by decade no team separation.
WITH decade_breakdown AS(SELECT sum(g) AS total_games 
	   							,sum(so) AS total_strikeouts
	  						    ,CASE WHEN yearid BETWEEN 1920 AND 1929 THEN '1920s'
			  						  WHEN yearid BETWEEN 1930 AND 1939 THEN '1930s'
			  						  WHEN yearid BETWEEN 1940 AND 1949 THEN '1940s'
			  						  WHEN yearid BETWEEN 1950 AND 1959 THEN '1950s'
			 						  WHEN yearid BETWEEN 1960 AND 1969 THEN '1960s'
			 						  WHEN yearid BETWEEN 1970 AND 1979 THEN '1970s'
									  WHEN yearid BETWEEN 1980 AND 1989 THEN '1980s'
									  WHEN yearid BETWEEN 1990 AND 1999 THEN '1990s'
									  WHEN yearid BETWEEN 2000 AND 2009 THEN '2000s'
									  WHEN yearid BETWEEN 2010 AND 2019 THEN '2010s'
									  END AS p_decade
						FROM pitching
						WHERE yearid >=1920
						GROUP BY p_decade
						ORDER BY p_decade)
						
						
						
SELECT p_decade
	  ,ROUND(total_strikeouts::numeric/total_games::numeric,2) AS avg_strikeouts
FROM decade_breakdown
ORDER BY p_decade, avg_strikeouts;
--2nd attempt joining the tables to bring in so from batting also
WITH decade_breakdown AS(SELECT sum(pitching.g) AS total_games 
	   							,sum(pitching.so) AS total_strikeouts
	  						    ,CASE WHEN pitching.yearid BETWEEN 1920 AND 1929 THEN '1920s'
			  						  WHEN pitching.yearid BETWEEN 1930 AND 1939 THEN '1930s'
			  						  WHEN pitching.yearid BETWEEN 1940 AND 1949 THEN '1940s'
			  						  WHEN pitching.yearid BETWEEN 1950 AND 1959 THEN '1950s'
			 						  WHEN pitching.yearid BETWEEN 1960 AND 1969 THEN '1960s'
			 						  WHEN pitching.yearid BETWEEN 1970 AND 1979 THEN '1970s'
									  WHEN pitching.yearid BETWEEN 1980 AND 1989 THEN '1980s'
									  WHEN pitching.yearid BETWEEN 1990 AND 1999 THEN '1990s'
									  WHEN pitching.yearid BETWEEN 2000 AND 2009 THEN '2000s'
									  WHEN pitching.yearid BETWEEN 2010 AND 2019 THEN '2010s'
									  END AS p_decade
						 		,CASE WHEN batting.yearid BETWEEN 1920 AND 1929 THEN '1920s'
			  						  WHEN batting.yearid BETWEEN 1930 AND 1939 THEN '1930s'
			  						  WHEN batting.yearid BETWEEN 1940 AND 1949 THEN '1940s'
			  						  WHEN batting.yearid BETWEEN 1950 AND 1959 THEN '1950s'
			 						  WHEN batting.yearid BETWEEN 1960 AND 1969 THEN '1960s'
			 						  WHEN batting.yearid BETWEEN 1970 AND 1979 THEN '1970s'
									  WHEN batting.yearid BETWEEN 1980 AND 1989 THEN '1980s'
									  WHEN batting.yearid BETWEEN 1990 AND 1999 THEN '1990s'
									  WHEN batting.yearid BETWEEN 2000 AND 2009 THEN '2000s'
									  WHEN batting.yearid BETWEEN 2010 AND 2019 THEN '2010s'
									  END AS b_decade
						FROM pitching INNER JOIN batting USING(playerid)
						WHERE pitching.yearid >=1920 OR batting.yearid >=1920
						GROUP BY p_decade,b_decade
						ORDER BY p_decade)
						
						
						
SELECT p_decade
	  ,ROUND(total_strikeouts::numeric/total_games::numeric,2) AS avg_p_strikeouts
	  ,b_decade
	  ,ROUND(total_strikeouts::numeric/total_games::numeric,2) AS avg_b_strikeouts
FROM decade_breakdown
GROUP BY p_decade, b_decade,decade_breakdown.total_strikeouts,decade_breakdown.total_games
ORDER BY p_decade, b_decade;











--HOMERUNS broken up by team and decade.


WITH decade_breakdown AS(SELECT teamid
	   						    ,sum(g) AS total_games 
	   							,sum(hr) AS total_homeruns
	  						    ,CASE WHEN yearid BETWEEN 1920 AND 1929 THEN '1920s'
			  						  WHEN yearid BETWEEN 1930 AND 1939 THEN '1930s'
			  						  WHEN yearid BETWEEN 1940 AND 1949 THEN '1940s'
			  						  WHEN yearid BETWEEN 1950 AND 1959 THEN '1950s'
			 						  WHEN yearid BETWEEN 1960 AND 1969 THEN '1960s'
			 						  WHEN yearid BETWEEN 1970 AND 1979 THEN '1970s'
									  WHEN yearid BETWEEN 1980 AND 1989 THEN '1980s'
									  WHEN yearid BETWEEN 1990 AND 1999 THEN '1990s'
									  WHEN yearid BETWEEN 2000 AND 2009 THEN '2000s'
									  WHEN yearid BETWEEN 2010 AND 2019 THEN '2010s'
									  END AS Decade
						FROM pitching
						WHERE yearid >=1920
						GROUP BY teamid,pitching.yearid
						ORDER BY  decade)
						
						
						
SELECT decade
	  ,ROUND(total_homeruns::numeric/total_games::numeric,2) AS avg_homeruns
FROM decade_breakdown;

--broken down just by decade

WITH decade_breakdown AS(SELECT sum(g) AS total_games 
	   							,sum(hr) AS total_homeruns
	  						    ,CASE WHEN yearid BETWEEN 1920 AND 1929 THEN '1920s'
			  						  WHEN yearid BETWEEN 1930 AND 1939 THEN '1930s'
			  						  WHEN yearid BETWEEN 1940 AND 1949 THEN '1940s'
			  						  WHEN yearid BETWEEN 1950 AND 1959 THEN '1950s'
			 						  WHEN yearid BETWEEN 1960 AND 1969 THEN '1960s'
			 						  WHEN yearid BETWEEN 1970 AND 1979 THEN '1970s'
									  WHEN yearid BETWEEN 1980 AND 1989 THEN '1980s'
									  WHEN yearid BETWEEN 1990 AND 1999 THEN '1990s'
									  WHEN yearid BETWEEN 2000 AND 2009 THEN '2000s'
									  WHEN yearid BETWEEN 2010 AND 2019 THEN '2010s'
									  END AS Decade
						FROM pitching
						WHERE yearid >=1920
						GROUP BY decade
						ORDER BY  decade)
						
						
						
SELECT decade
	  ,ROUND(total_homeruns::numeric/total_games::numeric,2) AS avg_homeruns
FROM decade_breakdown
ORDER BY avg_homeruns;












