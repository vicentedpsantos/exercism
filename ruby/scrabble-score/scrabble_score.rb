class Scrabble
  POINTS = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }.freeze

  attr_reader :word

  def initialize(word)
    @word = (word || '').upcase
  end

  def score
    return 0 unless word

    word.split.map { |l| puts l }
    # score = []
    # POINTS.map { |point, letters| word.chars.map { |letter| score << point if letters.include? letter } }
    # score.sum
  end

  def self.score(word)
    new(word).score
  end
end
