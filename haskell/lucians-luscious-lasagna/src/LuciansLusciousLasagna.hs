module LuciansLusciousLasagna ( elapsedTimeInMinutes
                              , expectedMinutesInOven
                              , preparationTimeInMinutes
                              ) where

type Layers = Int
type Minutes = Int

expectedMinutesInOven :: Minutes
expectedMinutesInOven = 40

elapsedTimeInMinutes :: Layers -> Minutes -> Minutes
elapsedTimeInMinutes = (+) . preparationTimeInMinutes

preparationTimeInMinutes :: Layers -> Minutes
preparationTimeInMinutes = (* 2)

