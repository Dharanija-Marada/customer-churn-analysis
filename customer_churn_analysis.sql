CREATE DATABASE customer_churn_analysis;

USE customer_churn_analysis;

CREATE TABLE churn_data (
    CustomerID VARCHAR(50),
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50),
    Zip_Code VARCHAR(20),
    Latitude FLOAT,
    Longitude FLOAT,
    
    Gender VARCHAR(10),
    Senior_Citizen VARCHAR(10),
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    
    Tenure_Months INT,
    Contract VARCHAR(30),
    
    Phone_Service VARCHAR(20),
    Internet_Service VARCHAR(30),
    Multiple_Lines VARCHAR(30),
    
    Streaming_TV VARCHAR(30),
    Streaming_Movies VARCHAR(30),
    Online_Security VARCHAR(30),
    Tech_Support VARCHAR(30),
    Online_Backup VARCHAR(30),
    Device_Protection VARCHAR(30),
    
    Paperless_Billing VARCHAR(10),
    Payment_Method VARCHAR(50),
    
    Monthly_Charges FLOAT,
    Total_Charges FLOAT,
    CLTV FLOAT,
    
    Churn_Label VARCHAR(10),
    Churn_Value INT,
    Churn_Score INT,
    
    Churn_Reason VARCHAR(255)
);

SELECT COUNT(*) FROM churn_data;

SELECT * FROM churn_data LIMIT 5;

SELECT 
    COUNT(*) AS total_customers,
    SUM(Churn_Value) AS churned,
    ROUND(SUM(Churn_Value)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data;

SELECT 
    Contract,
    COUNT(*) AS total,
    SUM(Churn_Value) AS churned,
    ROUND(SUM(Churn_Value)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY Contract
ORDER BY churn_rate DESC;

SELECT 
    Tech_Support,
    COUNT(*) AS total,
    SUM(Churn_Value) AS churned
FROM churn_data
GROUP BY Tech_Support;

SELECT 
    Churn_Reason,
    COUNT(*) AS total_churn
FROM churn_data
WHERE Churn_Value = 1
GROUP BY Churn_Reason
ORDER BY total_churn DESC;

