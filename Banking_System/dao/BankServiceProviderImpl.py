#Task 13
from .CustomerServiceProviderImpl import CustomerServiceProviderImpl
from .IBankServiceProvider import IBankServiceProvider
from entity.Account import Account
from entity.CurrentAccount import CurrentAccount
from entity.SavingsAccount import SavingsAccount
from entity.ZeroBalanceAccount import ZeroBalanceAccount
from typing import List,Dict,Set


from exceptions import InsufficientFundException, InvalidAccountException, OverDraftLimitExcededException


class BankServiceProviderImpl:
    def __init__(self, branchName, branchAddress):
        self.branchName = branchName
        self.branchAddress = branchAddress
        self.accountList = []
        # self.accounts: Dict[int, Account] = {}
        # self.accounts: Set[Account] = set()
        # self.accounts: List[Account] = []
        self.account_counter = 1001

    def generate_account_number(self):
        accNo = self.account_counter
        self.account_counter += 1
        return accNo

    def create_account(self, customer, accNo, accType, balance):
        if accType == "Savings":
            account = SavingsAccount(accNo, customer, balance)
        elif accType == "Current":
            account = CurrentAccount(accNo, customer, balance, overdraft_limit=1000)
        elif accType == "ZeroBalance":
            account = ZeroBalanceAccount(accNo, customer)
        else:
            raise ValueError("Invalid account type")
        self.accountList.append(account)
        return account

    def get_account_balance(self, accNo):
        account = self.find_account_by_number(accNo)
        return account.balance

    def deposit(self, accNo, amount):
        account = self.find_account_by_number(accNo)
        account.balance += amount
        return account.balance

    def withdraw(self, accNo, amount):
        account = self.find_account_by_number(accNo)
        if isinstance(account, SavingsAccount) and (account.balance - amount) < 500:
            raise InsufficientFundException("Savings account must maintain a minimum balance of 500")
        if isinstance(account, CurrentAccount) and (account.balance - amount) < -account.overdraft_limit:
            raise OverDraftLimitExcededException()
        if account.balance < amount:
            raise InsufficientFundException()
        account.balance -= amount
        return account.balance

    def transfer(self, from_accNo, to_accNo, amount):
        from_account = self.find_account_by_number(from_accNo)
        to_account = self.find_account_by_number(to_accNo)
        if from_account.balance < amount:
            raise InsufficientFundException()
        from_account.balance -= amount
        to_account.balance += amount

    def getAccountDetails(self, accNo):
        account = self.find_account_by_number(accNo)
        return account

    def listAccounts(self):
        return self.accountList

    def find_account_by_number(self, accNo):
        for account in self.accountList:
            if account.accNo == accNo:
                return account
        raise InvalidAccountException()
