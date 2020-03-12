class Isogram
  class << self
    def isogram?(input)
      formatted = input.downcase.scan(/\b[\w']+\b/).join.split('')

      formatted.uniq == formatted
    end
  end
end
