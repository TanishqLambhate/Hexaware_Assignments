--Tasks 4: Subquery and its type:
--1. Retrieve the customer(s) with the highest account balance.
		--insert into Accounts values('114','8','current','300000')
		
--2. Calculate the average account balance for customers who have more than one account.
		--select avg(balance),customer_id from accounts group by customer_id,balance having count(customer_id)>1;
		--doubt--step-1:
		select customer_id from accounts where balance=(select max(balance) from accounts);
		--step-2:
		select * from customers where customer_id in(select customer_id from accounts where balance=(select max(balance) from accounts));
		select customer_id from accounts group by customer_id having count(customer_id)>1;
		select avg(balance),customer_id from accounts where customer_id in(select customer_id from accounts group by customer_id having count(customer_id)>1) group by customer_id;
--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.
		select avg(amount) from transactions;
		select account_id from transactions where amount>(select avg(amount) from transactions);
		select * from accounts where account_id in(select account_id from transactions where amount>(select avg(amount) from transactions));
--4. Identify customers who have no recorded transactions.
		select * from customers where customer_id in(select a.customer_id from accounts as a full outer join transactions as t on a.account_id=t.account_id where t.transaction_id is null);
--5. Calculate the total balance of accounts with no recorded transactions.
		select * from accounts;
		select distinct(account_id) from transactions;
		select sum(balance)as total_balance,account_id from accounts where account_id not in(select distinct(account_id) from transactions) group by account_id;
--6. Retrieve transactions for accounts with the lowest balance.
		select account_id from accounts where balance=(select min(balance) from accounts);
		select * from transactions where account_id in (select account_id from accounts where balance=(select min(balance) from accounts));
		--insert into transactions values('10114','115','deposit','300','2024-04-28')
--7. Identify customers who have accounts of multiple types.
		select customer_id from accounts group by customer_id having count(customer_id)>1;
		select * from customers where customer_id in(select customer_id from accounts group by customer_id having count(customer_id)>1);
--8. Calculate the percentage of each account type out of the total number of accounts.
		select (count(account_id)*100)/(select count(account_id) from accounts),account_type from accounts group by account_type;
--9. Retrieve all transactions for a customer with a given customer_id.
		select * from transactions where account_id in(select account_id from accounts where customer_id=3)
--10. Calculate the total balance for each account type, including a subquery within the SELECT clause
		select sum(balance),account_type as total_balance from accounts group by account_type;
		select sum(balance) from accounts where account_type='savings';
		select sum(balance) from accounts where account_type='current';
		select sum(balance) from accounts where account_type='zero_balance';
		select (select sum(balance) from accounts where account_type='savings') as savings,
		(select sum(balance) from accounts where account_type='current')as current_balance,
		(select sum(balance) from accounts where account_type='zero_balance')as zero_balance