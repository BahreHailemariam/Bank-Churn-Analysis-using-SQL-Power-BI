-- Customer tenure in months
ALTER TABLE Customers ADD TenureMonths INT;

UPDATE Customers
SET TenureMonths = DATEDIFF(MONTH, AccountOpenDate, GETDATE());

-- Total transaction amount per customer
CREATE VIEW CustomerTransactionSummary AS
SELECT 
    CustomerID,
    COUNT(TransactionID) AS TotalTransactions,
    SUM(TransactionAmount) AS TotalAmount,
    AVG(TransactionAmount) AS AvgTransaction
FROM Transactions
GROUP BY CustomerID;

-- Transaction frequency (per month)
ALTER TABLE Customers ADD AvgMonthlyTransactions DECIMAL(10,2);

UPDATE Customers
SET AvgMonthlyTransactions = CTS.TotalTransactions * 1.0 / TenureMonths
FROM Customers C
JOIN CustomerTransactionSummary CTS
ON C.CustomerID = CTS.CustomerID;
