class AccountPremium
  def premium?
    true
  end
end

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

my_account = Account.new(10, AccountPremium.new)
puts my_account.overdraft_charge
puts my_account.bank_charge
