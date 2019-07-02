class Prime
  class << self
    def nth(number)
      raise ArgumentError, 'number has to be > 0' if number < 1

      numbers.take(number).to_a.last
    end

    def prime?(i)
      return false if i <= 1
      return true if i == 2

      (2..Math.sqrt(i)).none? { |j| i % j == 0 }
    end

    def numbers
      (1..Float::INFINITY).lazy.select { |i| prime?(i) }
    end
  end
end
