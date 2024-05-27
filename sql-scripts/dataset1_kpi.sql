-- WGU KPIs
-- Average Total Charges + Additional Charges by Gender
SELECT
    Gender,
    AVG(TotalCharges) AS "Average Total Charges"
FROM (
    SELECT
        Gender,
        (TotalCharge + Additional_charges) AS TotalCharges
    FROM
        patient
) as TotalCharges
GROUP BY Gender
ORDER BY "Average Total Charges" DESC;
	
-- Services Utilization
SELECT Services, COUNT(Services) AS "Service Utilization"
FROM servicesaddon
GROUP BY Services
ORDER BY "Service Utilization" DESC;

-- Readmission Status by Complication Risk
SELECT
    Complication_risk,
    COUNT(CASE WHEN ReAdmis = 'Yes' THEN 1 END) AS Readmission_Yes,
    COUNT(CASE WHEN ReAdmis = 'No' THEN 1 END) AS Readmission_No
FROM
    medical_data
GROUP BY
    Complication_risk;


-- Most Prevalent Medical Condition
SELECT
    'highblood' AS Condition,
    SUM(CASE WHEN highblood = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    patient
UNION ALL
SELECT
    'Stroke' AS Condition,
    SUM(CASE WHEN Stroke = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    patient
UNION ALL
SELECT
    'Overweight' AS Condition,
    SUM(CASE WHEN Overweight = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    servicesaddon
UNION ALL
SELECT
    'Arthritis' AS Condition,
    SUM(CASE WHEN Arthritis = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    servicesaddon
UNION ALL
SELECT
    'Diabetes' AS Condition,
    SUM(CASE WHEN Diabetes = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    servicesaddon
UNION ALL
SELECT
    'Hyperlipidemia' AS Condition,
    SUM(CASE WHEN Hyperlipidemia = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    servicesaddon
UNION ALL
SELECT
    'BackPain' AS Condition,
    SUM(CASE WHEN BackPain = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    servicesaddon
UNION ALL
SELECT
    'Anxiety' AS Condition,
    SUM(CASE WHEN Anxiety = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    servicesaddon
UNION ALL
SELECT
    'Allergic_rhinitis' AS Condition,
    SUM(CASE WHEN Allergic_rhinitis = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    servicesaddon
UNION ALL
SELECT
    'Reflux_esophagitis' AS Condition,
    SUM(CASE WHEN Reflux_esophagitis = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    servicesaddon
UNION ALL
SELECT
    'Asthma' AS Condition,
    SUM(CASE WHEN Asthma = 'Yes' THEN 1 ELSE 0 END) AS Yes_Count
FROM
    servicesaddon
ORDER BY
    Yes_Count DESC;



