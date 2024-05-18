# Task 1: Conditional Statements
# In a bank, you have been given the task is to create a program that checks if a customer is eligible for 
# a loan based on their credit score and income. The eligibility criteria are as follows:
# • Credit Score must be above 700.
# • Annual Income must be at least $50,000.
# Tasks:
# 1. Write a program that takes the customer's credit score and annual income as input.
# 2. Use conditional statements (if-else) to determine if the customer is eligible for a loan.
# 3. Display an appropriate message based on eligibility.
def elgibility_for_loan():
    credit_score=int(input("Input your credit score = "))
    annual_income=int(input("Input your Annual Income = "))
    if credit_score>700 and annual_income>=50000:
        print(f"You are eligible for loan")
    else:
        print("You are not eligible")

# elgibility_for_loan()

# Task 2: Nested Conditional Statements
# Create a program that simulates an ATM transaction. Display options such as "Check Balance," 
# "Withdraw," "Deposit,". Ask the user to enter their current balance and the amount they want to 
# withdraw or deposit. Implement checks to ensure that the withdrawal amount is not greater than the 
# available balance and that the withdrawal amount is in multiples of 100 or 500. Display appropriate 
# messages for success or failure.


class bank:
    def __init__(self,acc_no,name,balance):
        self.acc_no=acc_no
        self.name=name
        self.balance=balance
    def check_balance(self):
        return f"{self.name} has ₹ {self.balance} in account"
    def withdraw(self,amount):
        if self.balance-amount>=0:
            self.balance=self.balance-amount
            return f"Success Your balance is {self.check_balance()}"
        else:
            return f"Insufficient funds. {self.check_balance()}"
    def deposit(self,amount):
        if amount>=0:
            self.balance=self.balance+amount
            return f"Success {self.check_balance()}"
        else:
            return f"Invalid amount {self.check_balance()}"
    

Tanishq=bank(101,"Tanishq",10000000000000)
print(Tanishq.name,Tanishq.acc_no)
print (Tanishq.check_balance())
print(Tanishq.withdraw(10_000))         
print (Tanishq.check_balance())
print (Tanishq.deposit(459))

# Task 3: Loop Structures
# You are responsible for calculating compound interest on savings accounts for bank customers. You 
# need to calculate the future balance for each customer's savings account after a certain number of years.
# Tasks:
# 1. Create a program that calculates the future balance of a savings account.
# 2. Use a loop structure (e.g., for loop) to calculate the balance for multiple customers.
# 3. Prompt the user to enter the initial balance, annual interest rate, and the number of years.
# 4. Calculate the future balance using the formula: 
# future_balance = initial_balance * (1 + annual_interest_rate/100)^years.
# 5. Display the future balance for each customer.

def calculate_future_balance():
    num_customers = int(input("Enter the number of customers: "))
    for i in range(1, num_customers + 1):
        initial_balance=int(input("Enter your initial balance = "))
        annual_interest_rate=int(input("Enter Annual Rate  = "))
        number_of_years=int(input("Enter number of years  = "))
        future_balance=initial_balance*(1+annual_interest_rate/100)**number_of_years
        print(f"Future balance of customer{i} after {number_of_years} will be {future_balance}")

# calculate_future_balance()


#Dictionary to store acc no and balance
customer_accounts = {
    '123456': 1000.00,
    '789012': 1500.00,
    '345678': 2000.00,
    # Add more accounts as needed
}
def check_balance():
    print("Welcome to the Bank!")
    while True:
        account_number = input("Enter your account number: ")

        # Validate the account number
        if account_number in customer_accounts:
            balance = customer_accounts[account_number]
            print(f"Your account balance is: ${balance:.2f}")
        else:
            print("Invalid account number. Please try again.")
        choice = input("Do you want to check another balance? (yes/no): ").lower()
        if choice != 'yes':
            break    
    print("Thank you for using the bank!")

# check_balance()

# Task 5: Password Validation
# Write a program that prompts the user to create a password for their bank account. Implement if 
# conditions to validate the password according to these rules:
# • The password must be at least 8 characters long.
# • It must contain at least one uppercase letter.
# • It must contain at least one digit.
# • Display appropriate messages to indicate whether their password is valid or not
def password_validation():
    password = input("Enter password: ")
    if len(password) >= 8:
        has_uppercase = False
        has_digit = False
        for char in password:
            if char.isupper():
                has_uppercase = True
            elif char.isdigit():
                has_digit = True

        if has_uppercase and has_digit:
            print("Password Validated")
        elif not has_uppercase:
            print("Invalid password, should contain at least 1 uppercase letter")
        elif not has_digit:
            print("Invalid password, should contain at least 1 digit")
    else:
        print("The password must be at least 8 characters long")

# password_validation()

# bank_transaction=[{"withdraw":500},{"deposit":100}]

# Task 6
def transaction_historry():
    bank_transactions = []

    while True:
        transaction_type = input("Enter transaction type (deposit or withdrawal), or type 'exit' to end: ").lower()   
        if transaction_type == 'exit':
            print("Exiting...")
            break

        if transaction_type not in ['deposit', 'withdrawal']:
            print("Invalid transaction type. Please enter 'deposit' or 'withdrawal'.")
            continue
        
        amount = float(input("Enter amount: "))
        bank_transactions.append((transaction_type, amount))
        print(f"Transaction {transaction_type} of ${amount:.2f} added.")

    print("\nTransaction History:")
    for transaction in bank_transactions:
        transaction_type, amount = transaction
        print(f"{transaction_type.capitalize()}: ${amount:.2f}")

# transaction_historry()
# Task 7
class Customer:
    def __init__(self,customer_id,first_name,last_name,email,phone,address):
        self.customer_id=customer_id
        self.first_name=first_name
        self.last_name=last_name
        self.email=email
        self.phone=phone
        self.address=address
    
    def display(self):
        print("Customer ID:", self.customer_id)
        print("First Name:", self.first_name)
        print("Last Name:", self.last_name)
        print("Email Address:", self.email)
        print("Phone Number:", self.phone)
        print("Address:", self.address)

    def get_customer_id(self):
        return self.customer_id

    def set_customer_id(self, customer_id):
        self.customer_id = customer_id

    def get_first_name(self):
        return self.first_name

    def set_first_name(self, first_name):
        self.first_name = first_name

    def get_last_name(self):
        return self.last_name

    def set_last_name(self, last_name):
        self.last_name = last_name

    def get_email(self):
        return self.email

    def set_email(self, email):
        self.email = email

    def get_phone(self):
        return self.phone

    def set_phone(self, phone):
        self.phone = phone

    def get_address(self):
        return self.address

    def set_address(self, address):
        self.address = address

customer=Customer("1","Tanishq","Lambhate","tanulambhate@gmial.com","3433434444","Indore")
# customer.display()
# print(customer.get_address())

class Account:
    def __init__(self, account_number=None, account_type=None, account_balance=0):
        self.account_number = account_number
        self.account_type = account_type
        self.account_balance = account_balance

    def get_account_number(self):
        return self.account_number

    def set_account_number(self, account_number):
        self.account_number = account_number

    def get_account_type(self):
        return self.account_type

    def set_account_type(self, account_type):
        self.account_type = account_type

    def get_account_balance(self):
        return self.account_balance

    def set_account_balance(self, account_balance):
        self.account_balance = account_balance

    def print_account_info(self):
        print("Account Number:", self.account_number)
        print("Account Type:", self.account_type)
        print("Account Balance: $", self.account_balance)

    def deposit(self, amount):
        if amount > 0:
            self.account_balance += amount
            print(f"Deposited ${amount:.2f} successfully.")
        else:
            print("Invalid deposit amount. Please enter a positive value.")

    def withdraw(self, amount):
        if amount > 0:
            if amount <= self.account_balance:
                self.account_balance -= amount
                print(f"Withdrawn ${amount:.2f} successfully.")
            else:
                print("Insufficient balance.")
        else:
            print("Invalid withdrawal amount. Please enter a positive value.")

    def calculate_interest(self):
        interest_rate = 0.045  # 4.5% interest rate
        interest_amount = self.account_balance * interest_rate
        return interest_amount



account1 = Account("A001", "Savings", 1000.00)
account1.print_account_info()  # Print initial account info

account1.deposit(500.00)  # Deposit $500
account1.withdraw(200.00)  # Withdraw $200
account1.print_account_info()  # Print updated account info

interest = account1.calculate_interest()
print(f"Interest earned: ${interest:.2f}")

class bank:
    interest_rate=5
    def __init__(self,acc_no,name,balance):
        self.acc_no=acc_no
        self.name=name
        self.balance=balance
    def display_balance(self):
        return f"{self.name} has ₹ {self.balance} in account"
    def withdraw(self,amount):
        if self.balance-amount>=0:
            self.balance=self.balance-amount
            return f"Success Your balance is {self.display_balance()}"
        else:
            return f"Insufficient funds. {self.display_balance()}"
    def deposit(self,amount):
        if amount>=0:
            self.balance=self.balance+amount
            return f"Success {self.display_balance()}"
        else:
            return f"Invalid amount {self.display_balance()}"
    
    def calculate_interest(self):
        accumulated_interest_amt = self.balance * bank.interest_rate
        self.balance += accumulated_interest_amt
        return f"Interest received. ₹{accumulated_interest_amt}"
 


Tanishq=bank(101,"Tanishq",10000000000000)
print(Tanishq.name,Tanishq.acc_no)
# print (Tanishq.display_balance())
# print(Tanishq.withdraw(10_000))         #success.Your balance is :60000
# print (Tanishq.display_balance())
# print (Tanishq.deposit(459))
# print(Tanishq.calculate_interest())

# Task 8: Inheritance and polymorphism

class Account:
    def __init__(self, account_number, account_type, account_balance=0):
        self.account_number = account_number
        self.account_type = account_type
        self.account_balance = account_balance

    def deposit(self, amount):
        if isinstance(amount, (int, float)):
            self.account_balance += amount
            print(f"Deposited ${amount:.2f} successfully.")
        else:
            print("Invalid deposit amount. Please enter a valid number.")

    def withdraw(self, amount):
        if isinstance(amount, (int, float)):
            if amount <= self.account_balance:
                self.account_balance -= amount
                print(f"Withdrawn ${amount:.2f} successfully.")
            else:
                print("Insufficient balance.")
        else:
            print("Invalid withdrawal amount. Please enter a valid number.")

    def print_account_info(self):
        print("Account Number:", self.account_number)
        print("Account Type:", self.account_type)
        print("Account Balance: $", self.account_balance)
    
    def get_account_number(self):
        return self.account_number


account = Account("A001", "Savings", 1000.00)
# there is no double datatype in python
# deposit and withdraw using different data types
# account.deposit(500)       # int
# account.withdraw(200.50)   # float
# account.deposit(1000.25)   # float
# account.withdraw(200)      # int


# account.print_account_info()

class SavingsAccount(Account):
    interest_rate = 0.05
 
    def calculate_interest(self):
        interest_amount = self.account_balance * self.interest_rate
        self.account_balance += interest_amount
        return interest_amount
 
 
sabesh = SavingsAccount(131, "Sabesh", 80_000)
 
# print(sabesh.calculate_interest())  # 5%

class CurrentAccount(Account):
    overdraft_limit = 1000 

    def __init__(self, account_number, customer_name, balance=0, overdraft_limit=1000):
        super().__init__(account_number, customer_name, balance)
        self._overdraft_limit = overdraft_limit

    def get_overdraft_limit(self):
        return self._overdraft_limit

    def set_overdraft_limit(self, value):
        self._overdraft_limit = value

    def withdraw(self, amount):
        available_balance = self._balance + self._overdraft_limit
        if amount > available_balance:
            print("Withdrawal amount exceeds available balance and overdraft limit.")
        else:
            self._balance -= amount

    def __str__(self):
        return super().__str__() + f"\nOverdraft Limit: {self._overdraft_limit}"


class Bank:
    def __init__(self):
        self.accounts = []

    def display_menu(self):
        print("Menu:")
        print("1. Create Savings Account")
        print("2. Create Current Account")
        print("3. Deposit")
        print("4. Withdraw")
        print("5. Calculate Interest")
        print("6. Exit")

    def create_account(self, account_type):
        account_number = input("Enter account number: ")
        initial_balance = float(input("Enter initial balance: "))
        if account_type.lower() == 'savings':
            account = SavingsAccount(account_number, initial_balance)
            self.accounts.append(account)
            print("Savings Account created successfully.")
        elif account_type.lower() == 'current':
            account = CurrentAccount(account_number, initial_balance)
            self.accounts.append(account)
            print("Current Account created successfully.")
        else:
            print("Invalid account type.")

    def deposit(self, account_number, amount):
        account = self.find_account(account_number)
        if account:
            account.deposit(amount)
        else:
            print("Account not found.")

    def withdraw(self, account_number, amount):
        account = self.find_account(account_number)
        if account:
            account.withdraw(amount)
        else:
            print("Account not found.")

    def calculate_interest(self):
        for account in self.accounts:
            if isinstance(account, SavingsAccount):
                account.calculate_interest()

    def find_account(self, account_number):
        for account in self.accounts:
            if account.get_account_number() == account_number:
                return account
        return None


# Example usage:
bank = Bank()

while True:
    bank.display_menu()
    choice = input("Enter your choice: ")

    if choice == '1':
        bank.create_account("Savings")
    elif choice == '2':
        bank.create_account("Current")
    elif choice == '3':
        account_number = input("Enter account number: ")
        amount = float(input("Enter amount to deposit: "))
        bank.deposit(account_number, amount)
    elif choice == '4':
        account_number = input("Enter account number: ")
        amount = float(input("Enter amount to withdraw: "))
        bank.withdraw(account_number, amount)
    elif choice == '5':
        bank.calculate_interest()
    elif choice == '6':
        print("Exiting")
        break
    else:
        print("Invalid choice. Please try again.")
