--Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:
--1. Write a SQL query to Find the average account balance for all customers.
		select  AVG(balance),customer_id from Accounts group by customer_id;
		--Alter table transactions alter column amount int;
--2. Write a SQL query to Retrieve the top 10 highest account balances.
		select * from accounts order by balance desc;
--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
		select  distinct(transaction_date),sum(amount)as total_deposits from transactions where transaction_type='deposit' group by transaction_date ;
--4. Write a SQL query to Find the Oldest and Newest Customers.
		select max(DOB)as newest_customer,min(DOB)as oldest_customer from customers  ;
--5. Write a SQL query to Retrieve transaction details along with the account type.
		select * from Transactions left join accounts on transactions.account_id=accounts.account_id; 
--6. Write a SQL query to Get a list of customers along with their account details.
		select * from Customers inner join accounts on Customers.customer_id=accounts.customer_id; 
--7. Write a SQL query to Retrieve transaction details along with customer information for a specific account.
		select * from Transactions left join accounts on transactions.account_id=accounts.account_id where accounts.account_id=102; 
--8. Write a SQL query to Identify customers who have more than one account.
		--insert into Accounts values('113','7','current','4994')
		select * from customers where customer_id in (select customer_id from accounts group by customer_id having count(customer_id)>1)
--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.
		insert into Transactions values('10113','113','withdrawal',799,'2024-04-28');
		select transactions.amount-transaction2.amount as difference_amount from  Transactions inner join transactions as transaction2 on  transactions.account_id=transaction2.account_id where transactions.transaction_type='withdrawal' and transaction2.transaction_type='deposit';
		--doubt
--10. Write a SQL query to Calculate the average daily balance for each account over a specified period.
		--doubt
--11. Calculate the total balance for each account type.
		select sum(balance)as total_balance,account_type  from accounts group by account_type
--12. Identify accounts with the highest number of transactions order by descending order.
		select count(account_id),account_id from transactions group by account_id order by count(account_id) desc;
--13. List customers with high aggregate account balances, along with their account types.
		select c.first_name,c.last_name,sum(a.balance) as aggregate_balance,a.account_type from Customers as c inner join Accounts as a on c.customer_id=a.customer_id 
		group by c.first_name,c.last_name,a.balance ,a.account_type
		order by a.balance desc;
		
--14. Identify and list duplicate transactions based on transaction amount, date, and account.
		--doubt