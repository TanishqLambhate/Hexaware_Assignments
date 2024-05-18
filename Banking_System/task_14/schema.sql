CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Address NVARCHAR(255)
);
CREATE TABLE Accounts (
    AccountNumber INT PRIMARY KEY,
    AccountType NVARCHAR(50),
    Balance FLOAT,
    CustomerID INT,
    InterestRate FLOAT DEFAULT NULL,
    OverdraftLimit FLOAT DEFAULT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    AccountNumber INT,
    Description NVARCHAR(255),
    DateTime DATETIME DEFAULT GETDATE(),
    TransactionType NVARCHAR(50),
    TransactionAmount FLOAT,
    FOREIGN KEY (AccountNumber) REFERENCES Accounts(AccountNumber)
);
