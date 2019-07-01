class Sieve
  attr_reader :enum

  def initialize(number)
    @enum = (2..number).to_a
  end

  def primes
    enum.select { |number| prime?(number) }
  end

  private

  def prime?(number)
    (2..(number - 1)).each { |n| return false if number % n == 0 }

    true
  end
end
