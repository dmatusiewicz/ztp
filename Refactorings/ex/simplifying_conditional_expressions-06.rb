# Smell: Simplifying Conditional Expressions

# Refactoring: Replace Conditional with Polymorphism
class MountainBike
  def initialize(base_price, front_suspension_price, rear_suspension_price, commission)
    @base_price = base_price
    @front_suspension_price = front_suspension_price
    @rear_suspension_price = rear_suspension_price
    @commission = commission
  end

  def price(code)
    case code
    when :rigid
      (1 + @commission) * @base_price
    when :front_suspension
      (1 + @commission) * @base_price + @front_suspension_price
    when :full_suspension
      (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
    end
  end
end

geant = MountainBike.new 1000, 400, 600, 0.1
puts geant.price(:rigid)
puts geant.price(:front_suspension)
puts geant.price(:full_suspension)

# Replace Conditional with Polymorphism

class MountainBike
  attr_reader :base_price, :commission, :front_suspension_price, :rear_suspension_price
  def initialize(base_price, front_suspension_price, rear_suspension_price, commission)
    @base_price = base_price
    @front_suspension_price = front_suspension_price
    @rear_suspension_price = rear_suspension_price
    @commission = commission
  end

  def price(klass)
    klass.new(base_price, front_suspension_price, rear_suspension_price, commission).price
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

geant = MountainBike.new 1000, 400, 600, 0.1
puts geant.price(RigidMountainBike)
puts geant.price(FrontSuspensionMountainBike)
puts geant.price(FullSuspensionMountainBike)

# reek simplifying_conditional_expressions-06.rb
