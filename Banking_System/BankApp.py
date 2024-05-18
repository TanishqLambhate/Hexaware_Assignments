#Task 11 and Task 12
from dao.BankServiceProviderImpl import BankServiceProviderImpl
from entity.Customer import Customer
from exceptions import InsufficientFundException, InvalidAccountException, OverDraftLimitExcededException
class BankApp:
    @staticmethod
    def start():
        bank = BankServiceProviderImpl("My Bank", "123 Main St")
        
        while True:
            try:
                print("Welcome to the Banking System")
                print("1. Create Account")
                print("2. Deposit")
                print("3. Withdraw")
                print("4. Get Balance")
                print("5. Transfer")
                print("6. Get Account Details")
                print("7. List Accounts")
                print("8. Exit")

                choice = input("Enter your choice: ")

                if choice == "1":
                    customer = Customer(customer_id="12345", first_name="John", last_name="Doe",
                                        email="john.doe@example.com", phone_number="1234567890", address="123 Elm Street")
                    acc_type = input("Enter account type (Savings/Current/ZeroBalance): ")
                    balance = float(input("Enter initial balance: "))
                    accNo = bank.generate_account_number()
                    account = bank.create_account(customer, accNo, acc_type, balance)
                    print("Account created successfully.")
                
                elif choice == "2":
                    accNo = int(input("Enter account number: "))
                    amount = float(input("Enter amount to deposit: "))
                    new_balance = bank.deposit(accNo, amount)
                    print(f"New balance: {new_balance}")
                
                elif choice == "3":
                    accNo = int(input("Enter account number: "))
                    amount = float(input("Enter amount to withdraw: "))
                    new_balance = bank.withdraw(accNo, amount)
                    print(f"New balance: {new_balance}")

                elif choice == "4":
                    accNo = int(input("Enter account number: "))
                    balance = bank.get_account_balance(accNo)
                    print(f"Current balance: {balance}")

                elif choice == "5":
                    from_accNo = int(input("Enter source account number: "))
                    to_accNo = int(input("Enter destination account number: "))
                    amount = float(input("Enter amount to transfer: "))
                    bank.transfer(from_accNo, to_accNo, amount)
                    print("Transfer completed.")

                elif choice == "6":
                    accNo = int(input("Enter account number: "))
                    details = bank.getAccountDetails(accNo)
                    print(details)

                elif choice == "7":
                    accounts = bank.listAccounts()
                    for account in accounts:
                        print(account)

                elif choice == "8":
                    print("Exiting...")
                    break

                else:
                    print("Invalid choice. Please try again.")
            
            except InsufficientFundException as e:
                print(f"Error: {e.message}")
            except InvalidAccountException as e:
                print(f"Error: {e.message}")
            except OverDraftLimitExcededException as e:
                print(f"Error: {e.message}")
            except Exception as e:
                print(f"An unexpected error occurred: {e}")
BankApp.start()
# task 14
