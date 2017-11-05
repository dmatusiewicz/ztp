# Smell: Simplifying Conditional Expressions

# Refactoring: Replace Nested Conditional with Guard Clauses
class Account
  ADJ_FACTOR = 1.1
  def initialize(capital, income, interest_rate, duration)
    @capital = capital
    @income = income
    @interest_rate = interest_rate
    @duration = duration
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

def adjusted_capital
  result = 0.0
  return result if @capital <= 0.0               # reversed conditional 1
  if @interest_rate > 0.0 && @duration > 0.0
    result = (@income / @duration) * ADJ_FACTOR
  end
  result
end

# Step 2

def adjusted_capital
  result = 0.0
  return result if @capital <= 0.0
  return result if !(@interest_rate > 0.0 && @duration > 0.0) # reversed conditional 2
  result = (@income / @duration) * ADJ_FACTOR
  result
end

# Step 3

def adjusted_capital
  result = 0.0
  return result if @capital <= 0.0
  return result if @interest_rate <= 0.0 || @duration <= 0.0 # simplified conditional 2
  result = (@income / @duration) * ADJ_FACTOR
  result
end

# Step 4 – use explicit value

def adjusted_capital
  result = 0.0
  return 0 if @capital <= 0.0
  return 0 if @interest_rate <= 0.0 || @duration <= 0.0
  result = (@income / @duration) * ADJ_FACTOR
  result
end

# Step 5

def adjusted_capital
  return 0.0 if @capital <= 0.0
  return 0.0 if @interest_rate <= 0.0 || @duration <= 0.0
  (@income / @duration) * ADJ_FACTOR
end

# reek simplifying_conditional_expressions-04.rb
