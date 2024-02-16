-- 9.Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won the award.

-- SELECT *
-- FROM managers

-- SELECT *
-- FROM awardsmanagers


-- SELECT *
-- FROM awardssharemanagers

WITH award_winner AS (SELECT playerid, awardid
                      FROM awardsmanagers
                      WHERE awardid ILIKE '%TSN%' AND lgid = 'AL'
                      INTERSECT
                      SELECT playerid, awardid
                      FROM awardsmanagers
                      WHERE awardid ILIKE '%TSN%' AND lgid = 'NL')
SELECT namefirst AS first_name, namelast AS last_name, awardsmanagers.awardid, teamid
FROM people
INNER JOIN managers
USING (playerid)
INNER JOIN award_winner
USING (playerid)
INNER JOIN awardsmanagers
USING (playerid)
WHERE awardsmanagers.awardid = 'TSN Manager of the Year' AND managers.lgid IN ('AL', 'NL')
GROUP BY first_name, last_name, awardsmanagers.awardid, teamid








-- SELECT DISTINCT namefirst AS first_name, namelast AS last_name, teams.teamid, teams.name
-- FROM managers
-- INNER JOIN awardsmanagers
-- USING (playerid)
-- INNER JOIN people
-- USING (playerid)
-- INNER JOIN teams
-- ON teams.lgid = awardsmanagers.lgid
-- WHERE awardid ILIKE '%TSN%' AND awardsmanagers.playerid IN (SELECT playerid
--                                                             FROM awardsmanagers
--                                                             WHERE awardid ILIKE '%TSN%' AND lgid = 'AL'
--                                                             INTERSECT
--                                                             SELECT playerid
--                                                             FROM awardsmanagers
--                                                             WHERE awardid ILIKE '%TSN%' AND lgid = 'NL')
-- GROUP BY first_name, last_name, awardid, teams.name, teams.teamid








