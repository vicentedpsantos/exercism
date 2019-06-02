class SpaceAge
  ORBITAL_PERIODS = {
    on_earth: 365.25,
    on_mercury: 0.2408467,
    on_venus: 0.61519726,
    on_mars: 1.8808158,
    on_jupiter: 11.862615,
    on_saturn: 29.447498,
    on_uranus: 84.016846,
    on_neptune: 164.79132
  }.freeze

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def method_missing(_m)
    return super unless ORBITAL_PERIODS.key?(_m)

    on_earth / ORBITAL_PERIODS[_m]
  end

  def respond_to_missing?(method_name, include_private = false)
    ORBITAL_PERIODS.keys.include? method_name || super
  end

  def on_earth
    @on_earth ||= seconds.to_f / 60 / 60 / 24 / ORBITAL_PERIODS[:on_earth]
  end
end
