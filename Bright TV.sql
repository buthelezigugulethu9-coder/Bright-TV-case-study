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

SELECT
CASE
WHEN (email='' OR email IS NULL) THEN 'No email'
WHEN (email!='' AND email IS NOT NULL) THEN 'Has email'
END AS email_status
FROM brighttv.dataset.userprofiles;

SELECT 
CASE
WHEN Race="other" THEN "Unknown"
WHEN Race=" " THEN "Unknown"
WHEN Race IS NULL THEN "Unknown"
ELSE Race
END AS Race,
COUNT(*) AS count
FROM brighttv.dataset.userprofiles
GROUP BY Race
ORDER BY count DESC;

SELECT
CASE
WHEN `Social Media Handle`='' THEN 'No Social Media Handle'
WHEN `Social Media Handle`!='' THEN 'Has Social Media Handle'
END AS Social_Media_Handle_status
FROM brighttv.dataset.userprofiles;

SELECT *
FROM brighttv.dataset.viewership;

CREATE OR REPLACE TEMPORARY TABLE viewership AS
SELECT UserID0 AS userid,
RecordDate2 AS RecordDate,
Channel2 AS Channel,
`Duration 2` AS `Duration`
FROM brighttv.dataset.viewership;

SELECT *
FROM brighttv.dataset.viewership;

SELECT
COALESCE(A.userid4,B.UserID) AS sub_id,
A.RecordDate2,
A.Channel2,
A.`Duration 2`,
B.Name,
B.Surname,
B.Email,
B.Gender,
B.Race,
B.Age,
B.Province,
B.`Social Media Handle`
FROM brighttv.dataset.viewership AS A
LEFT JOIN brighttv.dataset.userprofiles B
ON A.userid4=B.UserID






