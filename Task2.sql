-- Task 2
-- 1. Insert at least 10 sample records into each of the following tables.
-- Customers

INSERT INTO Customers (customer_id, first_name, last_name, DOB ,email ,phone_number ,address)
VALUES ('1', 'Tanishq', 'Lambhate','2002-08-15','tanulambhate@gmail.com','9644730922','Indore'),
       ('2', 'Ramesh', 'Sharma','2002-09-15','rameshsharma@gmail.com','9340421111','Bhopal'),
       ('3', 'Priya', 'Patel', '1995-03-20', 'priyapatel@gmail.com', '9876543210', 'Mumbai'),
        ('4', 'Sandeep', 'Singh', '1990-07-12', 'sandeepsingh@gmail.com', '8765432109', 'Delhi'),
        ('5', 'Ananya', 'Gupta', '1988-11-05', 'ananyagupta@gmail.com', '7654321098', 'Kolkata'),
        ('6', 'Rahul', 'Joshi', '1993-04-30', 'rahuljoshi@gmail.com', '6543210987', 'Chennai'),
        ('7', 'Kiran', 'Kumar', '1985-09-22', 'kirankumar@gmail.com', '5432109876', 'Hyderabad'),
        ('8', 'Swati', 'Sharma', '1982-12-10', 'swatisharma@gmail.com', '4321098765', 'Pune'),
        ('9', 'Vikram', 'Verma', '1979-06-15', 'vikramverma@gmail.com', '3210987654', 'Jaipur'),
        ('10', 'Neha', 'Thakur', '1976-01-25', 'nehathakur@gmail.com', '2109876543', 'Ahmedabad');

Select * from Customers;

-- Accounts
INSERT INTO Accounts (account_id,customer_id, account_type, balance)
VALUES ('101', '1', 'savings','100000'),
        ('102', '2', 'current', '50000'),
        ('103', '3', 'savings', '75000'),
        ('104', '4', 'current', '120000'),
        ('105', '5', 'savings', '25000'),
        ('106', '6', 'current', '80000'),
        ('107', '7', 'savings', '300000'),
        ('108', '8', 'current', '60000'),
        ('109', '9', 'savings', '200000'),
        ('110', '10', 'zero_balance', '90000');

Select * from Accounts;
-- Transactions
INSERT INTO Transactions (transaction_id,account_id,transaction_type, amount, transaction_date)
VALUES ('10101', '101', 'deposit','1000','2024-04-26'),
        ('10102', '102', 'withdrawal', '500', '2024-04-27'),
        ('10103', '103', 'deposit', '2000', '2024-04-27'),
        ('10104', '104', 'withdrawal', '1000', '2024-04-26'),
        ('10105', '105', 'transfer', '500', '2024-04-25'),
        ('10106', '106', 'deposit', '1500', '2024-04-25'),
        ('10107', '107', 'withdrawal', '2000', '2024-04-24'),
        ('10108', '108', 'transfer', '1000', '2024-04-23'),
        ('10109', '109', 'deposit', '3000', '2024-04-22'),
        ('10110', '110', 'withdrawal', '700', '2024-04-21'),
        ('10111', '101', 'deposit', '2500', '2024-04-20');

Select * from Transactions;
--2. Write SQL queries for the following tasks:
--1. Write a SQL query to retrieve the name, account type and email of all customers. 
		Select first_name + last_name as name,email,account_type from customers inner join Accounts on customers.customer_id=accounts.customer_id;
		
--2. Write a SQL query to list all transaction corresponding customer.
		Select * from Transactions inner join Accounts on transactions.account_id=Accounts.account_id inner join Customers on Accounts.customer_id=Customers.customer_id ;
--3. Write a SQL query to increase the balance of a specific account by a certain amount.
		Update Accounts set balance=balance+200 where account_id=101;
		Select * from Accounts;
--4. Write a SQL query to Combine first and last names of customers as a full_name.
		Select first_name +' '+ last_name as full_name from Customers;
--5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
Update Accounts set balance=0 where account_id=109;
		Select * from Transactions;
		Select account_id from Accounts where balance=0 AND account_type='savings';
		Select * from Transactions where account_id=(Select account_id from Accounts where balance=0 AND account_type='savings');
		
		Delete from Transactions where account_id=(Select account_id from Accounts where balance=0 AND account_type='savings');
		Delete from Accounts where balance=0 AND account_type='savings';
--6. Write a SQL query to Find customers living in a specific city.
		Select * from customers where address='pune' ;
--7. Write a SQL query to Get the account balance for a specific account.
		select balance from Accounts where account_id=102;
--8. Write a SQL query to List all current accounts with a balance greater than $1,000.
		select * from Accounts where account_type='current' AND balance>1000;
--9. Write a SQL query to Retrieve all transactions for a specific account.
		Select * from transactions where account_id=108;
--10.Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
		Select (balance*15)/100 from Accounts where account_type='savings';
--11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.
		Select * from Accounts where balance<100000;
--12. Write a SQL query to Find customers not living in a specific city
		Select * from Customers where address!='pune';