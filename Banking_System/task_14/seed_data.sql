INSERT INTO Customers (CustomerID, Name, Address) VALUES (1, 'John Doe', '123 Main St');
INSERT INTO Customers (CustomerID, Name, Address) VALUES (2, 'Jane Smith', '456 Oak Ave');

INSERT INTO Accounts (AccountNumber, AccountType, Balance, CustomerID, InterestRate) VALUES (1, 'Savings', 1000, 1, 0.04);
INSERT INTO Accounts (AccountNumber, AccountType, Balance, CustomerID, OverdraftLimit) VALUES (2, 'Current', 500, 2, 1000);
INSERT INTO Accounts (AccountNumber, AccountType, Balance, CustomerID) VALUES (3, 'ZeroBalance', 0, 1);

INSERT INTO Transactions (AccountNumber, Description, TransactionType, TransactionAmount) VALUES (1, 'Initial Deposit', 'Deposit', 1000);
INSERT INTO Transactions (AccountNumber, Description, TransactionType, TransactionAmount) VALUES (2, 'Initial Deposit', 'Deposit', 500);
INSERT INTO Transactions (AccountNumber, Description, TransactionType, TransactionAmount) VALUES (1, 'ATM Withdrawal', 'Withdraw', 100);
