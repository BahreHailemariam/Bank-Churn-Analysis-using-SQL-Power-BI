-- Churn rate overall
SELECT CAST(SUM(ChurnFlag) AS FLOAT)/COUNT(*) AS OverallChurnRate
FROM Churn;

-- Churn by gender
SELECT C.Gender, CAST(SUM(CH.ChurnFlag) AS FLOAT)/COUNT(*) AS ChurnRate
FROM Customers C
JOIN Churn CH ON C.CustomerID = CH.CustomerID
GROUP BY C.Gender;

-- Churn by tenure bucket
SELECT 
    CASE 
        WHEN TenureMonths < 6 THEN '<6 months'
        WHEN TenureMonths BETWEEN 6 AND 12 THEN '6-12 months'
        WHEN TenureMonths BETWEEN 13 AND 24 THEN '13-24 months'
        ELSE '>24 months'
    END AS TenureBucket,
    CAST(SUM(CH.ChurnFlag) AS FLOAT)/COUNT(*) AS ChurnRate
FROM Customers C
JOIN Churn CH ON C.CustomerID = CH.CustomerID
GROUP BY
    CASE 
        WHEN TenureMonths < 6 THEN '<6 months'
        WHEN TenureMonths BETWEEN 6 AND 12 THEN '6-12 months'
        WHEN TenureMonths BETWEEN 13 AND 24 THEN '13-24 months'
        ELSE '>24 months'
    END;
