class Raindrops
  SOUNDS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  def self.convert(number)
    sound = sounds_of(number)

    sound << number.to_s if sound.empty?
    sound
  end

  def self.factors_of(number)
    (1..number).select { |n| number % n == 0 }
  end

  def self.sounds_of(number, string = '')
    SOUNDS.each { |key, value| string << value if factors_of(number).include? key }
    string
  end
end
