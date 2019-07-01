class Series
  attr_reader :series

  def initialize(series)
    @series = series
  end

  def slices(num)
    raise ArgumentError if num > series.length

    series.chars.each_cons(num).map(&:join)
  end
end
