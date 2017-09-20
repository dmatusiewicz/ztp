class Rectangle
  attr_reader :top_left, :width, :height

  def initialize top_left, width, height
    @top_left = top_left
    @width = width
    @height = height
  end
end

class Point
  attr_reader :x, :y

  def initialize x, y
    @x = x
    @y = y
  end
end
