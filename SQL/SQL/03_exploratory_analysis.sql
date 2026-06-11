-- Total arrests by borough

SELECT
    borough_name,
    COUNT(*) AS total_arrests
FROM final_nypd_arrests
GROUP BY borough_name
ORDER BY total_arrests DESC;

-- Arrests by age group

SELECT
    AGE_GROUP,
    COUNT(*) AS arrests
FROM final_nypd_arrests
GROUP BY AGE_GROUP
ORDER BY arrests DESC;

-- Arrests by race

SELECT
    perp_race,
    COUNT(*) AS arrests
FROM final_nypd_arrests
GROUP BY perp_race
ORDER BY arrests DESC;
