-- 1. What range of years for baseball games
-- played does the provided database cover? 
SELECT min(year), max(year) --1871-2016
FROM homegames;

SELECT min(yearid), max(yearid) --1871-2016
FROM teams;

SELECT min(yearid), max(yearid)--1864-2014 college
FROM collegeplaying;

SELECT min(yearid),max(yearid) --1871-2016
FROM managers;

SELECT min(yearid), max(yearid) --1871-2016
FROM batting;

SELECT min(yearid), max(yearid) --1933-2016
FROM allstarfull;

SELECT min(yearid), max(yearid) --1871-2016
FROM appearances;










