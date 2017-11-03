# Smell: Simplifying Conditional Expressions

# Refactoring: Replace Conditional with Polymorphism
class MountainBike
  def initialize(base_price, front_suspension_price, rear_suspension_price, commission)

    @commission = commission
  end

  def price
    case @type_code
    when :rigid
      (1 + @commission) * @base_price
    when :front_suspension
      (1 + @commission) * @base_price + @front_suspension_price
    when :full_suspension
      (1 + @commission) * @base_price + @front_suspension_price +
      @rear_suspension_price
    end
  end
end

an_bike = MountainBike.new
an_bike.price

# Replace Conditional with Polymorphism (final?)



# reek simplifying_conditional_expressions-04.rb
