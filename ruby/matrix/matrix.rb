class Matrix
  def initialize(matrix)
    @matrix = matrix
  end

  def rows
    @rows ||= @matrix.each_line.map(&:split).map { |arr| arr.map(&:to_i) }
  end

  def columns
    @columns ||= rows.transpose
  end
end
