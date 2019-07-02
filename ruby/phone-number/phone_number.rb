class PhoneNumber
  VALID_NUMBER = /^([2-9]\d\d){2}\d{4}$/.freeze

  def self.clean(number)
    numbers = number.gsub(/\D/, '').sub(/^1/, '')
    numbers[VALID_NUMBER]
  end
end
