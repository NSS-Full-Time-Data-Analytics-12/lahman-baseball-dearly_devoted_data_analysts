-- 13. It is thought that since left-handed pitchers are more rare, causing batters to face them less often, that they are more effective. Investigate this claim and present evidence to either support or dispute this claim. First, determine just how rare left-handed pitchers are compared with right-handed pitchers. Are left-handed pitchers more likely to win the Cy Young Award? Are they more likely to make it into the hall of fame?

SELECT people.playerid, namefirst, namelast, awardid, throws
FROM people
INNER JOIN awardsplayers
USING (playerid)
INNER JOIN halloffame
USING (playerid)
WHERE awardid = 'Cy Young Award'
GROUP BY namefirst, namelast, people.playerid, awardid



SELECT (CASE WHEN throws = 'R' THEN 'right_handed'
			       WHEN throws = 'L' THEN 'left_handed' END) AS right_or_left, namefirst, namelast, awardid
FROM people
LEFT JOIN awardsplayers
USING (playerid)
INNER JOIN halloffame
USING (playerid)
WHERE awardid = 'Cy Young Award'
GROUP BY namefirst, namelast, throws, awardid



SELECT DISTINCT people.playerid, namefirst, namelast, awardid, throws
FROM people
INNER JOIN awardsplayers
USING (playerid)
INNER JOIN halloffame
USING (playerid)
WHERE awardid = 'Cy Young Award' AND throws ='R'
GROUP BY namefirst, namelast, people.playerid, awardid



SELECT DISTINCT people.playerid, namefirst, namelast, awardid, throws
FROM people
INNER JOIN awardsplayers
USING (playerid)
INNER JOIN halloffame
USING (playerid)
WHERE awardid = 'Cy Young Award' AND throws ='L'
GROUP BY namefirst, namelast, people.playerid, awardid

