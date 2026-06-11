-- =====================================
-- Feature Engineering
-- Create new fields for analysis
-- =====================================

EXTRACT(YEAR FROM ARREST_DATE) AS arrest_year,

EXTRACT(MONTH FROM ARREST_DATE) AS arrest_month,

CASE
    WHEN ARREST_BORO='B' THEN 'Bronx'
    WHEN ARREST_BORO='K' THEN 'Brooklyn'
    WHEN ARREST_BORO='M' THEN 'Manhattan'
    WHEN ARREST_BORO='Q' THEN 'Queens'
    WHEN ARREST_BORO='S' THEN 'Staten Island'
END AS borough_name
