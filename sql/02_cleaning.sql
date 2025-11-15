-- Remove duplicates from staging
WITH Deduped AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY AccountOpenDate DESC) AS rn
    FROM Staging_Customers
)
DELETE FROM Deduped WHERE rn > 1;

-- Standardize gender values
UPDATE Customers
SET Gender = CASE 
    WHEN Gender IN ('M', 'Male') THEN 'Male'
    WHEN Gender IN ('F', 'Female') THEN 'Female'
    ELSE 'Unknown'
END;

-- Fill missing dates with default or null handling
UPDATE Customers
SET DateOfBirth = '1900-01-01'
WHERE DateOfBirth IS NULL;

-- Correct account status inconsistencies
UPDATE Customers
SET AccountStatus = 'Closed'
WHERE AccountStatus IN ('Inactive', 'Dormant');
