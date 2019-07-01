class Grains
  def self.square(position)
    raise ArgumentError unless (1..64).cover? position

    (2..position).inject(1) { |previous| previous * 2 }
  end

  def self.total
    (1..64).inject(0) { |previous, n| previous + square(n) }
  end
end
