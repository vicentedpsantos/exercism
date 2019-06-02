class Series
  attr_reader :series

  def initialize(series)
    @series = series
  end

  def slices(num)
    raise ArgumentError if num > series.length

    series.length.times.map { |i| series.slice(i, num).length == num ? series.slice(i, num) : nil }.compact
  end
end
