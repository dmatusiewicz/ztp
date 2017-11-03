# Smell: Simplifying Conditional Expressions

require 'date'

# Refactoring: Consolidate Conditional Expression
class Lift
  SUMMER_START = Date.new(Date.today.year, 6, 21)
  SUMMER_END = Date.new(Date.today.year, 9, 23)

  def initialize(summer_rate, winter_rate, winter_service_charge)
    @winter_rate = winter_rate
    @summer_rate = summer_rate
    @winter_service_charge = winter_service_charge
  end

  def charge(quantity, date)
    if date < SUMMER_START || date > SUMMER_END
      charge = quantity * @winter_rate + @winter_service_charge
    else
      charge = quantity * @summer_rate
    end
  end
end

a_lift = Lift.new 10, 20, 100
a_lift.charge  1, Date.new(2017, 11, 3)

# Decompose Conditional (final?)
class Lift
  SUMMER_START = Date.new(Date.today.year, 6, 21)
  SUMMER_END = Date.new(Date.today.year, 9, 23)

  def initialize(summer_rate, winter_rate, winter_service_charge)
    @winter_rate = winter_rate
    @summer_rate = summer_rate
    @winter_service_charge = winter_service_charge
  end

  def charge(quantity, date)
    if not_summer(date)
      charge = winter_charge(quantity)
    else
      charge = summer_charge(quantity)
    end
  end

  private

  def not_summer(date)
    date < SUMMER_START || date > SUMMER_END
  end

  def winter_charge(quantity)
    quantity * @winter_rate + @winter_service_charge
  end

  def summer_charge(quantity)
    quantity * @summer_rate
  end
end

a_lift = Lift.new 10, 20, 100
a_lift.charge  1, Date.new(2017, 11, 3)

# reek simplifying_conditional_expressions-01.rb
#
# simplifying_conditional_expressions-01.rb -- 1 warning:
#  [49]:UtilityFunction: Lift#not_summer doesn't depend on instance state
#    (maybe move it to another class?)
#    [https://github.com/troessner/reek/blob/master/docs/Utility-Function.md]
