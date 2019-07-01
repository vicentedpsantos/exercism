class Triplet
  attr_reader :sides

  def initialize(*sides)
    @sides = sides
  end

  def sum
    sides.sum
  end

  def product
    sides.inject(:*)
  end

  def pythagorean?
    a, b, c = *sides
    a**2 + b**2 == c**2
  end

  class << self
    def where(min_factor: 1, max_factor: 1, sum: nil)
      match = (min_factor..max_factor).to_a.combination(3).to_a
      match.select! { |a, b, c| a + b + c == sum } if sum

      match.each_with_object([]) do |(a, b, c), result|
        triplet = new(a, b, c)
        result << triplet if triplet.pythagorean?
      end
    end
  end
end
