CREATE TABLE [Vehicle] (
  [vehicleID] INT,
  [make] VARCHAR(255),
  [model] VARCHAR(255),
  [year] VARCHAR(255),
  [dailyRate] float,
  [status] int,
  [passengerCapacity] int,
  [engineCapacity] int,
  PRIMARY KEY ([vehicleID])
);

CREATE TABLE [Customer] (
  [customerID] INT,
  [firstName] VARCHAR(255),
  [lastName] VARCHAR(255),
  [email] VARCHAR(255),
  [phoneNumber] VARCHAR(255),
  PRIMARY KEY ([customerID])
);

CREATE TABLE [Lease] (
  [leaseID] INT,
  [vehicleID] INT,
  [customerID] INT,
  [startDate] DATE,
  [endDate] DATE,
  [type] VARCHAR(255),
  PRIMARY KEY ([leaseID]),
  Foreign Key ([vehicleID]) References Vehicle([vehicleID]),
  Foreign Key ([customerID]) References Customer([customerID])
);

CREATE TABLE [Payment] (
  [paymentID] INT,
  [leaseID] INT,
  [paymentDate] DATE,
  [amount] FLOAT,
  PRIMARY KEY ([paymentID]),
    Foreign Key ([leaseID]) References Lease([leaseID]),
);

INSERT INTO Vehicle (vehicleID,make, model, year,dailyRate,status,passengerCapacity,engineCapacity)
VALUES('1', 'Toyota', 'Camry', '2022', 50.00 ,1 ,4 ,1450),
('2', 'Honda' ,'Civic' ,'2023', 45.00 ,1, 7, 1500),
('3', 'Ford', 'Focus', '2022', 48.00, 0 ,4 ,1400),
('4', 'Nissan' ,'Altima' ,'2023', 52.00, 1 ,7 ,1200),
('5', 'Chevrolet', 'Malibu', '2022', 47.00, 1, 4, 1800),
('6', 'Hyundai', 'Sonata', '2023', 49.00 ,0 ,7 ,1400),
('7', 'BMW' ,'3 Series' ,'2023', 60.00, 1, 7, 2499),
('8' ,'Mercedes', 'C-Class', '2022', 58.00, 1, 8, 2599),
('9' ,'Audi' ,'A4', '2022', 55.00 ,0 ,4 ,2500),
('10' ,'Lexus', 'ES' ,'2023', 54.00, 1, 4, 250)
select * from Vehicle


INSERT INTO Customer (customerID, firstName, lastName, email, phoneNumber)
VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '555-555-5555'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
(3, 'Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
(5, 'David', 'Lee', 'david@example.com', '555-987-6543'),
(6, 'Laura', 'Hall', 'laura@example.com', '555-234-5678'),
(7, 'Michael', 'Davis', 'michael@example.com', '555-876-5432'),
(8, 'Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
(9, 'William', 'Taylor', 'william@example.com', '555-321-6547'),
(10, 'Olivia', 'Adams', 'olivia@example.com', '555-765-4321');

select * from Customer

INSERT INTO Lease (leaseID, vehicleID, customerID, startDate, endDate, type)
VALUES
(1, 1, 1, '2023-01-01', '2023-01-05', 'Daily'),
(2, 2, 2, '2023-02-15', '2023-02-28', 'Monthly'),
(3, 3, 3, '2023-03-10', '2023-03-15', 'Daily'),
(4, 4, 4, '2023-04-20', '2023-04-30', 'Monthly'),
(5, 5, 5, '2023-05-05', '2023-05-10', 'Daily'),
(6, 4, 3, '2023-06-15', '2023-06-30', 'Monthly'),
(7, 7, 7, '2023-07-01', '2023-07-10', 'Daily'),
(8, 8, 8, '2023-08-12', '2023-08-15', 'Monthly'),
(9, 3, 3, '2023-09-07', '2023-09-10', 'Daily'),
(10, 10, 10, '2023-10-10', '2023-10-31', 'Monthly');

select * from lease

INSERT INTO Payment (paymentID, leaseID, paymentDate, amount)
VALUES
(1, 1, '2023-01-03', 200.00),
(2, 2, '2023-02-20', 1000.00),
(3, 3, '2023-03-12', 75.00),
(4, 4, '2023-04-25', 900.00),
(5, 5, '2023-05-07', 60.00),
(6, 6, '2023-06-18', 1200.00),
(7, 7, '2023-07-03', 40.00),
(8, 8, '2023-08-14', 1100.00),
(9, 9, '2023-09-09', 80.00),
(10, 10, '2023-10-25', 1500.00);

select * from payment

--1. Update the daily rate for a Mercedes car to 68.
	update Vehicle set dailyRate=68 where make='Mercedes';
	
--2. Delete a specific customer and all associated leases and payments.
	--select * from customer where customerID=10
	delete from payment where leaseID=10
	delete from lease where customerID=10
	delete from Customer where customerID=10
--3. Rename the "paymentDate" column in the Payment table to "transactionDate".

	exec sp_rename 'payment.paymentDate' ,'transactionDate'
--4. Find a specific customer by email.
	select * from customer where email='johndoe@example.com'
--5. Get active leases for a specific customer.
	select * from lease where customerID=5 and endDate>=GETDATE()
	
--6. Find all payments made by a customer with a specific phone number.
	select * from Payment as p inner join lease as l on p.leaseID=l.leaseID inner join customer as c on l.customerID=c.customerID where phoneNumber='555-555-5555'
--7. Calculate the average daily rate of all available cars.
	select AVG(dailyRate) from Vehicle where status=1
--8. Find the car with the highest daily rate.
	select * from vehicle where dailyRate=(select max(dailyRate) from vehicle)
--9. Retrieve all cars leased by a specific customer.
	--step 1
	select * from lease where customerID=3
	--step 2
	select * from vehicle where vehicleID in(select vehicleID from lease where customerID=3)
--10. Find the details of the most recent lease.
	select * from lease where endDate=(select max(endDate) from lease)
--11. List all payments made in the year 2023.
	select * from Payment where year(transactionDate)=2023
--12. Retrieve customers who have not made any payments.

	select * from Payment as p full outer join lease as l on p.leaseID=l.leaseID full outer join customer as c on l.customerID=c.customerID where p.paymentID is null
--13. Retrieve Car Details and Their Total Payments.
	select * from Vehicle as v inner join lease as l on v.vehicleID=l.vehicleID inner join Payment as p on l.leaseID=p.leaseID

--14. Calculate Total Payments for Each Customer.
	select c.customerID,c.firstName,c.lastName,sum(p.amount) as totalPayments from customer as c 
	 join lease as l on c.customerID=l.customerID  join Payment as p on l.leaseID=p.leaseID  
	group by c.customerID,c.firstName,c.lastName
--15. List Car Details for Each Lease.
	select l.leaseID ,v.* from lease as l inner join vehicle as v on l.vehicleID=v.vehicleID
--16. Retrieve Details of Active Leases with Customer and Car Information.
	select l.leaseId ,l.startDate,l.endDate,l.type,v.*,c.* from lease as l join vehicle as v on l.vehicleID=v.vehicleID join customer as c on l.customerID=c.customerID
	where l.endDate>=GETDATE()
	
--17. Find the Customer Who Has Spent the Most on Leases.
	Select c.customerID,c.firstName,c.lastName,sum(p.amount) as totalpayments from customer as c join lease as l on c.customerID=l.customerID 
	join Payment as p on l.leaseID=p.leaseID group by c.customerID,c.firstName,c.lastName
	order by totalpayments desc offset 0 rows fetch next 1 row only 
--18. List All Cars with Their Current Lease Information
	select v.*,l.* from Vehicle as v left join lease as l on v.vehicleID=l.vehicleID and l.endDate>=GETDATE()