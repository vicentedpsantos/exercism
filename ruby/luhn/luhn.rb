class Luhn
  class << self
    def valid?(s)
      s = CardString.new(s)

      s.valid? && s.luhn?
    end
  end
end

REGEXP = {
  WHITESPACES: /\s/,
  NON_DIGITS: /\D/
}

class CardString
  attr_accessor :card_string

  def initialize(card_string)
    @card_string = card_string.gsub(REGEXP[:WHITESPACES], '')
  end

  def valid?
    card_string.size > 1 && card_string.scan(REGEXP[:NON_DIGITS]).empty?
  end

  def luhn?
    (luhn_sum % 10).zero?
  end

  private

  def luhn_sum
    card_string.reverse.chars.map(&:to_i).each_with_index.sum do |v, i|
      luhn_digit(v, i)
    end
  end

  def luhn_digit(digit, index)
    if index.odd?
      digit *= 2
      digit -= 9 if digit > 9
    end

    digit
  end
end
