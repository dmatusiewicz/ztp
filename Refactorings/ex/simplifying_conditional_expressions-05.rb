# TODO

=begin

# Smell: Simplifying Conditional Expressions

# Refactoring: Replace Conditional with Polymorphism
class MountainBike
  def initialize(type_code, base_price, front_suspension_price, rear_suspension_price, commission)
    @type_code = type_code
    @base_price = base_price
    @front_suspension_price = front_suspension_price
    @rear_suspension_price = rear_suspension_price
    @commission = commission
  end

  def price
    case @type_code
    when :rigid
      (1 + @commission) * @base_price
    when :front_suspension
      (1 + @commission) * @base_price + @front_suspension_price
    when :full_suspension
      (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
    end
  end
end

a_bike = MountainBike.new :full_suspension, 1_000, 400, 600, 0.1
a_bike.price

# Replace Conditional with Polymorphism (final?)

class MountainBike
  attr_reader :type_code, :base_price, :commission, :front_suspension_price, :rear_suspension_price
  def initialize(type_code, base_price, commission, front_suspension_price, rear_suspension_price)
    @type_code = type_code
    @base_price = base_price
    @commission = commission
    @front_suspension_price = front_suspension_price
    @rear_suspension_price = rear_suspension_price
  end

  def price
    klass = Object.const_get(type_code.to_s.split("_").map(&:capitalize).join + self.class.name)
    klass.new(type_code, base_price, commission, front_suspension_price, rear_suspension_price).price
  end
end

class RigidMountainBike < MountainBike
  def price
    (1 + commission) * base_price
  end
end

class FrontSuspensionMountainBike < MountainBike
  def price
    (1 + commission) * base_price + front_suspension_price
  end
end

class FullSuspensionMountainBike < MountainBike
  def price
    (1 + commission) * base_price + front_suspension_price + rear_suspension_price
  end
end

r_bike = MountainBike.new :rigid, 1000, 0.1, 400, 600
r_bike.price

f_bike = MountainBike.new :front_suspension, 1000, 0.1, 400, 600
f_bike.price

fr_bike = MountainBike.new :full_suspension, 1000, 0.1, 400, 600
fr_bike.price

=end

# ----
# def self.type(code)
#   begin
#     Object.const_get(code.to_s.split("_").map(&:capitalize).join + self.class.name)
#   rescue NameError
#     # TODO
#   end.new(code, base_price, commission, front_suspension_price, rear_suspension_price)
# end
#
# def price
#   # case type_code
#   # when :rigid
#   #   RigidMountainBike
#   # when :front_suspension
#   #   FrontSuspensionMountainBike
#   # when :full_suspension
#   #   FullSuspensionMountainBike
#   # end.new(type_code, base_price, commission, front_suspension_price, rear_suspension_price).price
#   klass = Object.const_get(type_code.to_s.split("_").map(&:capitalize).join + "MountainBike")
#   klass.new(type_code, base_price, commission, front_suspension_price, rear_suspension_price).price
# end
#
# reek simplifying_conditional_expressions-04.rb
