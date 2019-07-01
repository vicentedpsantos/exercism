module CollatzConjecture
  def self.steps(number, response = 0)
    raise ArgumentError unless number.positive?
    return response if number == 1

    response += 1
    return steps(number / 2, response) if number.even?
    return steps(number * 3 + 1, response) if number.odd?
  end
end
