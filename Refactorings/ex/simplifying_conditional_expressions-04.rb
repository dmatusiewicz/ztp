# Smell: Simplifying Conditional Expressions

# Refactoring: Replace Nested Conditional with Guard Clauses
class Account
  ADJ_FACTOR = 1.1
  def initialize(capital, income, interest_rate, duration)

  end

  def adjusted_capital
    result = 0.0
    if @capital > 0.0
      if @interest_rate > 0.0 && @duration > 0.0
        result = (@income / @duration) * ADJ_FACTOR
      end
    end
    result
  end
end

an_account = Account.new 1_000_000, 10_000, 0.02, 12
an_account.adjusted_capital

# Replace Nested Conditional with Guard Clauses – reversing the condition

# Step 1

# Step 2

# Step 3

# Step 4


# reek simplifying_conditional_expressions-04.rb
