# Smell: Simplifying Conditional Expressions

# Refactoring: Consolidate Conditional Expression
class PZU
  def initialize(seniority, months_disabled, is_part_time)
    @seniority = seniority
    @months_disabled = months_disabled
    @is_part_time = is_part_time
  end

  def disability_amount
    return 0 if @seniority < 2
    return 0 if @months_disabled > 12
    return 0 if @is_part_time

    Math::sin(@seniority * @months_disabled).abs
  end
end

a_pzu = PZU.new 3, 6, false
a_pzu.disability_amount

# Consolidate Conditional Expression (final?)
class PZU
  def initialize(seniority, months_disabled, is_part_time)
    @seniority = seniority
    @months_disabled = months_disabled
    @is_part_time = is_part_time
  end

  def disability_amount
    return 0 if @seniority < 2 || @months_disabled > 12 || @is_part_time

    Math::sin(@seniority * @months_disabled).abs
  end
end

a_pzu = PZU.new 3, 6, false
a_pzu.disability_amount

# reek simplifying_conditional_expressions-02.rb
