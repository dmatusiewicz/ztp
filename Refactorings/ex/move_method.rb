# Look through methods on a class to find a method that seems to reference
# another object more than the object it lives on.
class Account
  def initialize(days_overdrawn, account_type)
    @days_overdrawn = days_overdrawn
    @account_type = account_type
  end

  def overdraft_charge
    if @account_type.premium?
      result = 10
      result += (@days_overdrawn - 7) * 0.85 if @days_overdrawn > 7
      result
    else
      @days_overdrawn * 1.75
    end
  end

  def bank_charge
    result = 4.5
    result += overdraft_charge if @days_overdrawn > 0
    result
  end
end

# There are several account types. Each has its own rule
# for calculating overdraft charge.
class AccountType
  attr_accessor :account_type
  def initialize
    @account_type = :standard
  end

  def premium?
    account_type == :premium
  end
end

premium_account = AccountType.new
premium_account.account_type = :premium
premium_account.premium?

# Move the overdraft_charge method

# Step 1 & 2
# overdraft_charge method uses @days_overdrawn; it should stay at Account class

class AccountType
  def overdraft_charge(days_overdrawn)
    if premium?
      result = 10
      result += (days_overdrawn - 7) * 0.85 if days_overdrawn > 7
      result
    else
      days_overdrawn * 1.75
    end
  end
end

class Account
  def overdraft_charge
    @account_type.overdraft_charge(@days_overdrawn)
  end

  def bank_charge
    result = 4.5
    if @days_overdrawn > 0
      result += @account_type.overdraft_charge(@days_overdrawn)
    end
    result
  end
end

my_account = Account.new(10, premium_account)
my_account.overdraft_charge
my_account.bank_charge


#
