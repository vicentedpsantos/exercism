class Proverb
  attr_reader :chain, :qualifier

  def initialize(*chain, qualifier: nil)
    @chain = *chain
    @qualifier = qualifier
  end

  def to_s
    response = ''
    (1...chain.size).each do |word|
      response << "For want of a #{chain[word - 1]} the #{chain[word]} was lost.\n"
    end

    response << "And all for the want of a #{qualifier + ' ' if qualifier}#{chain[0]}."
  end
end
