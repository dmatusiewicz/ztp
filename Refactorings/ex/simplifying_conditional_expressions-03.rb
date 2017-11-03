# Smell: Simplifying Conditional Expressions

# Refactoring: Replace Nested Conditional with Guard Clauses
class OC
  def initialize(dead, separated, retired)
    @dead = dead
    @separated = separated
    @retired = retired
  end

  def pay_amount
    if @dead
      result = dead_amount
    else
      if @separated
        result = separated_amount
      else
        if @retired
          result = retired_amount
        else
          result = normal_pay_amount
        end
      end
    end
    result
  end

  private

  def dead_amount
    100_000
  end

  def separated_amount
    10_000
  end

  def normal_pay_amount
    30_000
  end
end

a_oc = OC.new true, false, false
a_oc.pay_amount

# Replace Nested Conditional with Guard Clauses (steps)

# Step 1
def pay_amount
  return dead_amount if @dead
  if @separated
    result = separated_amount
  else
    if @retired
      result = retired_amount
    else
      result = normal_pay_amount
    end
    result
  end
end

# Step 2

def pay_amount
  return dead_amount if @dead
  return separated_amount if @separated
  if @retired
    result = retired_amount
  else
    result = normal_pay_amount
  end
  result
end

# Step 3

def pay_amount
  return dead_amount if @dead
  return separated_amount if @separated
  return retired_amount if @retired
  result = normal_pay_amount
  result
end

# Step 4

def pay_amount
  return dead_amount if @dead
  return separated_amount if @separated
  return retired_amount if @retired
  normal_pay_amount
end


# reek simplifying_conditional_expressions-03.rb
