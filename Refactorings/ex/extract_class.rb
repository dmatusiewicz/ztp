=begin
class Person
  attr_reader :name
  attr_accessor :office_area_code
  attr_accessor :office_number
  def initialize(name, office_area_code, office_number)
    @name = name
    @office_area_code = office_area_code
    @office_number = office_number
  end

  def telephone_number
    '(' + @office_area_code + ') ' + @office_number
  end
end
=end

# Extract Class refactoring

class Person
  attr_reader :name
  def initialize(name, office_telephone)
    @name = name
    @office_telephone = office_telephone
  end

  def telephone_number
    @office_telephone.telephone_number
  end

  def office_area_code
    @office_telephone.area_code
  end

  def office_area_code=(arg)
    @office_telephone.area_code = arg
  end

  # add office_number and office_number=
end

class TelephoneNumber
  attr_accessor :area_code, :number
  def initialize(area_code, number)
    @area_code = area_code
    @number = number
  end

 def telephone_number
   '(' + area_code + ') ' + number
 end
end

person = Person.new('Włodek', TelephoneNumber.new('48', '123789456'))
person
person.telephone_number
