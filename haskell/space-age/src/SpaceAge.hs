module SpaceAge (Planet(..), ageOn) where

import qualified Data.Map as Map

earthOrbitalPeriodInSeconds :: Float
earthOrbitalPeriodInSeconds = 31557600.0

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
    deriving(Ord, Eq)

type OrbitalTimesMap = Map.Map Planet Float

orbitalTimes :: OrbitalTimesMap
orbitalTimes = Map.fromList
    [ (Mercury, 0.2408467)
    , (Venus  , 0.61519726)
    , (Earth  , 1.0)
    , (Mars   , 1.8808158)
    , (Jupiter, 11.862615)
    , (Saturn , 29.447498)
    , (Uranus , 84.016846)
    , (Neptune,  164.79132)
    ]

transformSeconds :: Float -> Float -> Float
transformSeconds seconds orbitalPeriod = seconds / earthOrbitalPeriodInSeconds / orbitalPeriod


ageOn :: Planet -> Float -> Either String Float
ageOn planet seconds =
    case Map.lookup planet orbitalTimes of
      Nothing -> Left $ "Not possible to calculate"
      Just orbitalTime -> Right $ transformSeconds seconds orbitalTime

