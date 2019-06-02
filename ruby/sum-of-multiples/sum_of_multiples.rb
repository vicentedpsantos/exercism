class SumOfMultiples
  attr_reader :nums

  def initialize(*nums)
    @nums = nums
  end

  def to(num)
    (1..num - 1).each.map { |i| multiple?(i) ? i : nil }.compact.sum
  end

  private

  def multiple?(n)
    nums.each { |num| return true if n % num == 0 }
    false
  end
end
