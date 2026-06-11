-- ============================================================
-- Project: NYC Arrests & Unemployment Rates Analysis
-- File: 01_clean_arrests_data.sql
-- Author: Camila Aguero
-- Purpose:
--   Create a cleaned NYPD arrests dataset for analysis
--   and Tableau visualization.
-- ============================================================

CREATE OR REPLACE TABLE `arrests-496406.arrests.final_nypd_arrests` AS

SELECT
    -- Unique record identifier
    ARREST_KEY,

    -- Date fields
    ARREST_DATE,
    EXTRACT(YEAR FROM ARREST_DATE) AS arrest_year,
    EXTRACT(MONTH FROM ARREST_DATE) AS arrest_month,

    -- Convert borough abbreviations into readable borough names
    CASE
        WHEN ARREST_BORO = 'B' THEN 'Bronx'
        WHEN ARREST_BORO = 'K' THEN 'Brooklyn'
        WHEN ARREST_BORO = 'M' THEN 'Manhattan'
        WHEN ARREST_BORO = 'Q' THEN 'Queens'
        WHEN ARREST_BORO = 'S' THEN 'Staten Island'
        ELSE 'Unknown'
    END AS borough_name,

    -- Recategorize missing law category values tied to KY_CD = 995
    CASE
        WHEN LAW_CAT_CD IS NULL
             AND KY_CD = 995
        THEN 'Other Authority'
        ELSE LAW_CAT_CD
    END AS cleaned_law_category,

    -- Demographic fields
    TRIM(PERP_RACE) AS perp_race,
    PERP_SEX,
    AGE_GROUP,

    -- Crime/offense fields
    OFNS_DESC,
    PD_DESC,
    LAW_CODE,

    -- Location fields
    Latitude,
    Longitude

FROM `arrests-496406.arrests.arrests`

-- Remove records with invalid NYC coordinates
WHERE Latitude BETWEEN 40.4 AND 41.0
  AND Longitude BETWEEN -74.3 AND -73.6;
