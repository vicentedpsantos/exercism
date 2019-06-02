module Complement
  def self.of_dna(dna)
    complements = { G: 'C', C: 'G', T: 'A', A: 'U' }
    res = ''
    dna.each_char { |c| res += complements[c.to_sym] }
    res
  end
end
