module Bob (responseFor) where

import qualified Data.Map  as Map
import qualified Data.Char as Char

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
    | null message                          = Silence
    | isQuestion message && isShout message = ShoutedQuestion
    | isShout message                       = Shout
    | isQuestion message                    = Question
    | otherwise                             = Default

isShout :: String -> Bool
isShout message =
    let uppercasedMessage = map Char.toUpper message
    in uppercasedMessage == message

isQuestion :: String -> Bool
isQuestion xs = last xs == '?'
