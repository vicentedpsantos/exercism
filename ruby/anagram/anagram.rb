class Anagram
  attr_reader :target

  def initialize(target)
    @target = target.downcase
  end

  def match(words)
    words.select! { |word| test(word.downcase) }
  end

  private

  def test(word)
    return false unless different?(word) && same_length?(word) && anagram?(word)
    true
  end

  def different?(word)
    target != word
  end

  def same_length?(word)
    target.length == word.length
  end

  def anagram?(word)
    target.chars.sort.join == word.chars.sort.join
  end
end
