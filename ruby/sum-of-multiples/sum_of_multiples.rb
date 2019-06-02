class SumOfMultiples
  attr_reader :numbers

  def initialize(*numbers)
    @numbers = numbers
  end

  def to(number)
    (1...number).map { |i| multiple?(i) ? i : nil }.compact.sum
  end

  private

  def multiple?(n)
    true if numbers.any? { |number| n % number == 0 }
  end
end
