class Nucleotide
  class << self
    def from_dna(strand)
      raise ArgumentError if strand !~ /^[ATCG]*$/
      @@strand = strand
    end
  end
end

class String
  def histogram
    expected = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    split('').group_by(&:itself).transform_values(&:size).merge(expected) { |_key, val1, val2| val1 + val2 }
  end
end
