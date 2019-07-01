class Phrase
  attr_reader :words

  def initialize(phrase)
    @words = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    words.group_by(&:itself).transform_values(&:size)
  end
end
