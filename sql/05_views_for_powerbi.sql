-- View: Customer Overview
CREATE OR ALTER VIEW vw_CustomerOverview AS
SELECT 
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Gender,
    C.AccountStatus,
    C.TenureMonths,
    CTS.TotalTransactions,
    CTS.TotalAmount,
    CTS.AvgTransaction,
    C.AvgMonthlyTransactions,
    CH.ChurnFlag,
    CH.ChurnDate
FROM Customers C
LEFT JOIN CustomerTransactionSummary CTS ON C.CustomerID = CTS.CustomerID
LEFT JOIN Churn CH ON C.CustomerID = CH.CustomerID;

-- View: Churn Metrics by Gender
CREATE OR ALTER VIEW vw_ChurnByGender AS
SELECT 
    Gender,
    COUNT(CustomerID) AS TotalCustomers,
    SUM(ChurnFlag) AS ChurnedCustomers,
    CAST(SUM(ChurnFlag) AS FLOAT)/COUNT(CustomerID) AS ChurnRate
FROM vw_CustomerOverview
GROUP BY Gender;

-- View: Churn Metrics by Tenure
CREATE OR ALTER VIEW vw_ChurnByTenure AS
SELECT 
    CASE 
        WHEN TenureMonths < 6 THEN '<6 months'
        WHEN TenureMonths BETWEEN 6 AND 12 THEN '6-12 months'
        WHEN TenureMonths BETWEEN 13 AND 24 THEN '13-24 months'
        ELSE '>24 months'
    END AS TenureBucket,
    COUNT(CustomerID) AS TotalCustomers,
    SUM(ChurnFlag) AS ChurnedCustomers,
    CAST(SUM(ChurnFlag) AS FLOAT)/COUNT(CustomerID) AS ChurnRate
FROM vw_CustomerOverview
GROUP BY 
    CASE 
        WHEN TenureMonths < 6 THEN '<6 months'
        WHEN TenureMonths BETWEEN 6 AND 12 THEN '6-12 months'
        WHEN TenureMonths BETWEEN 13 AND 24 THEN '13-24 months'
        ELSE '>24 months'
    END;
