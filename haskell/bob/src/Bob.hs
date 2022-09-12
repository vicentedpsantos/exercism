module Bob (responseFor) where

import qualified Data.Map as Map

data Interaction = Question
                 | Shout
                 | ShoutedQuestion
                 | Silence
                 | Default
    deriving(Ord, Eq, Show)

type ResponseMap = Map.Map Interaction String

responses :: ResponseMap
responses = Map.fromList
            [ (Question, "Sure.")
            , (Shout, "Whoa, chill out!")
            , (ShoutedQuestion, "Calm down, I know what I'm doing")
            , (Silence, "Fine. Be that way!")
            , (Default, "Whatever.")
            ]

responseFor :: String -> String
responseFor message =
  case Map.lookup (fetchInteraction message) responses of
      Nothing -> "Whatever."
      Just response -> response
  

fetchInteraction :: String -> Interaction
fetchInteraction message
    | all (`elem` [' ']) message                    = Silence
    | all (`elem` ['A'..'Z'] ++ ['?', ' ']) message = ShoutedQuestion
    | all (`elem` ['A'..'Z'] ++ [' ']) message      = Shout
    | any (`elem` ['?']) message                    = Question
    | otherwise                                     = Default
