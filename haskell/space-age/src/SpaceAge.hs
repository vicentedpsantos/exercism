module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn Mercury seconds = transformSeconds seconds 0.2408467
ageOn Venus   seconds = transformSeconds seconds 0.61519726
ageOn Earth   seconds = transformSeconds seconds 1
ageOn Mars    seconds = transformSeconds seconds 1.8808158
ageOn Jupiter seconds = transformSeconds seconds 11.862615
ageOn Saturn  seconds = transformSeconds seconds 29.447498
ageOn Uranus  seconds = transformSeconds seconds 84.016846
ageOn Neptune seconds = transformSeconds seconds 164.79132

transformSeconds :: Float -> Float -> Float
transformSeconds seconds orbitalPeriod = seconds / 31557600.0 / orbitalPeriod

