module ETL
  def self.transform(old)
    old.values.flatten.map { |letter| find_value(letter, old) }.to_h
  end

  def self.find_value(letter, old)
    old.keys.each { |key| return [letter.downcase, key] if old.values_at(key).first.include? letter }
  end
end
