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

  def saddle_points
    # Greater than or equal to every number in row
    # Less than or equal to every number in column
    points = []

    rows.size.times do |row|
      columns.size.times do |column|
        points << [row, column] if saddle?(row, column)
      end
    end
    points
  end

  def saddle?(x, y)
    columns.size.times { |i| return false unless rows[x][y] >= rows[x][i] }
    rows.size.times { |j| return false unless rows[x][y] <= rows[j][y] }
  end
end
