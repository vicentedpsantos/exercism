class SumOfMultiples
  attr_reader :numbers

  def initialize(*numbers)
    @numbers = numbers
  end

  def to(number)
    (1...number).sum { |i| multiple?(i) ? i : 0 }
  end

  private

  def multiple?(n)
    numbers.any? { |number| n % number == 0 }
  end
end
