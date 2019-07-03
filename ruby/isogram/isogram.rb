class Isogram
  class << self
    def isogram?(input)
      return true if input.empty?

      input.downcase.scan(/\b[\w']+\b/).join.split('').group_by(&:itself).transform_values(&:size).values.max <= 1
    end
  end
end
