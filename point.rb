class Point

  include Comparable

  attr_accessor :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def <=> point2
    unless point2.kind_of? Point
      nil
    else
      @x**2 + @y**2 <=> point2.x**2 + point2.y**2 # Шаблон делегирования.
    end
  end

  def to_s
    super + " Point: (#{@x}; #{@y})"
  end

  def inspect
    "@x=#{@x}; @y=#{@y}"
  end

  def + other_point
    x = @x + other_point.x
    y = @y + other_point.y
    Point.new(x, y)
  end

  def - other_point
    Point.new @x - other_point.x, @y - other_point.y
  end

  def == other_point
    @x == other_point.x && @y == other_point.y
  end

  def origin?
    @x.zero? && @y.zero?
  end

  def origin!
    @x = @y = 0
    self
  end

end

p Point.new(2, 5) - Point.new(-1, 10)
p Point.new(5, 5) == Point.new(5, 5)
p Point.new(0, 10).origin?
point = Point.new(50, 50)
p point.origin!
p point.origin?
puts

p1 = Point.new(1,1)
p2 = Point.new(8,9)
p3 = Point.new(8,6)
p p1 < p2
p p1 > p3
p p3.between?(p1,p2)
