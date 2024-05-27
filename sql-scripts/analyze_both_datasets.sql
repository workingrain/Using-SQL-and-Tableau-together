-- most utilized services vs the leading cause of deaths per state
WITH most_utilized_services AS (
    SELECT l.state, s.services,
           ROW_NUMBER() OVER (PARTITION BY l.state ORDER BY COUNT(*) DESC) AS service_rank
    FROM location l
    JOIN patient p ON l.location_id = p.location_id
    JOIN servicesaddon s ON p.patient_id = s.patient_id
    GROUP BY l.state, s.services
),
leading_causes_per_state AS (
    SELECT state_initials, cause,
           ROW_NUMBER() OVER (PARTITION BY state_initials ORDER BY SUM(deaths) DESC) AS cause_rank
    FROM leading_causes
    WHERE cause != 'All causes'
    GROUP BY state_initials, cause
)
SELECT m.state,
       m.services AS most_utilized_service,
       lc.cause AS leading_cause_of_death
FROM most_utilized_services m
JOIN leading_causes_per_state lc ON m.state = lc.state_initials
WHERE m.service_rank = 1 AND lc.cause_rank = 1;
