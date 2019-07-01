class Palindromes
  attr_reader :pool, :factors

  def initialize(max_factor:, min_factor: 1)
    @pool = (min_factor..max_factor).to_a
    @factors = []
  end

  def generate
    factors = pool.product(pool)
    @factors = factors.select { |pair| palindrome?(pair) }
    @factors = deduplicate_factors(@factors)
  end

  def largest
    @factors.select { |factors| product(factors) == product(@factors[-1]) }
  end

  def smallest
    @factors.select { |factors| product(factors) == product(@factors[0]) }
  end

  private

  def palindrome?(factors)
    product(factors).to_s == product(factors).to_s.reverse
  end

  def deduplicate_factors(factors)
    factors.sort_by { |factors| product(factors) }.map(&:sort!).uniq!
  end

  def product(factors)
    factors.inject(:*)
  end
end

class Array
  def value
    self[0][0] * self[0][1]
  end

  def factors
    self
  end
end
