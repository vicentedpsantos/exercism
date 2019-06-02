class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    equal_sides == 1 && valid?
  end

  def isosceles?
    equal_sides <= 2 && valid?
  end

  def scalene?
    equal_sides == 3 && valid?
  end

  private

  def valid?
    valid_triangle? && valid_lengths? && equal_sides
  end

  def valid_triangle?
    @valid_triangle ||= sides.max < sides.min(2).inject(0, :+)
  end

  def valid_lengths?
    @valid_lengths ||= sides.all?(&:positive?)
  end

  def equal_sides
    @equal_sides ||= sides.uniq.length
  end
end
