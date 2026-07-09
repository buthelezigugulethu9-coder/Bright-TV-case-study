-- Databricks notebook source
SELECT *
FROM brighttv.dataset.userprofiles;

SELECT DISTINCT gender
FROM brighttv.dataset.userprofiles;

SELECT DISTINCT
CASE
   WHEN gender='None' THEN 'Unknown'
   WHEN gender=' ' THEN 'Unknown'
   WHEN gender IS NULL THEN 'Unknown'
END AS gender
FROM brighttv.dataset.userprofiles










