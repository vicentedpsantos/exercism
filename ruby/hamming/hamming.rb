module Hamming
  def self.compute(x, y)
    raise ArgumentError unless x.size == y.size

    x.chars.zip(y.chars).count { |a, b| a != b }
  end
end
