module Transpose
  def self.transpose(string)
    p arr = string.split("\n").map { |arr| arr.split('') }
    p l = arr.map(&:length).max
    arr.each do |arr|
      arr.push(nil) while arr.length < l
    end
    transposed = arr.transpose

    res = ''

    transposed.each do |x|
      res << x.join
      res << "\n"
    end

    p res.gsub("  ", '').gsub(" \n", "\n").chomp
  end
end
