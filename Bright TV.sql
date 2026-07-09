-- Databricks notebook source
-- SELECT *
-- FROM brighttv.dataset.userprofiles;

-- SELECT DISTINCT gender
-- FROM brighttv.dataset.userprofiles;

SELECT DISTINCT
CASE
   WHEN gender = 'None' THEN 'Unknown'
   WHEN gender = ' ' THEN 'Unknown'
   WHEN gender IS NULL THEN 'Unknown'
   ELSE gender
END AS sex
FROM brighttv.dataset.userprofiles;

-- SELECT DISTINCT race
-- FROM brighttv.dataset.userprofiles;

SELECT COUNT(DISTINCT userid) AS subs,
CASE
   WHEN race = 'other' THEN 'Unknown'
   WHEN race = 'None' THEN 'Unknown'
   WHEN race = ' ' THEN 'Unknown'
   WHEN race IS NULL THEN 'Unknown'
   ELSE race
END AS ethnicity
FROM brighttv.dataset.userprofiles
GROUP BY ethnicity;

SELECT DISTINCT province
FROM brighttv.dataset.userprofiles;

SELECT DISTINCT
CASE
WHEN province = ' ' THEN 'Unknown'
WHEN province IS NULL THEN 'Unknown'
ELSE province
END AS province
FROM brighttv.dataset.userprofiles;

SELECT DISTINCT Age
FROM brighttv.dataset.userprofiles;

SELECT MIN(Age) AS min_age,
MAX(Age) AS max_age,
AVG(Age) AS mean_age
FROM brighttv.dataset.userprofiles;

SELECT 
CASE
WHEN age=0 THEN "INFANT"
WHEN age BETWEEN 1 AND 12 THEN "CHILD"
WHEN age BETWEEN 13 AND 19 THEN "TEENAGER"
WHEN age BETWEEN 20 AND 35 THEN "YOUNG ADULT"
WHEN age BETWEEN 36 AND 50 THEN "ADULT"
WHEN age > 50 AND Age <=60 THEN "ELDERLY"
END AS Age_group
FROM brighttv.dataset.userprofiles;

