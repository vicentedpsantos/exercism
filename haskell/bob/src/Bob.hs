module Bob (responseFor) where

data Interaction = Question
                 | Shout
                 | ShoutedQuestion
                 | Silence
                 | Default
    deriving(Ord, Eq, Show)

type Answer = String
type ResponseMap = [(Interaction, Answer)]

responses :: ResponseMap
responses = [ (Question, "Sure.")
            , (Shout, "Whoa, chill out!")
            , (ShoutedQuestion, "Calm down, I know what I'm doing!")
            , (Silence, "Fine. Be that way!")
            , (Default, "Whatever.")
            ]

responseFor :: String -> String
responseFor message =
  case findKey (fetchInteraction message) responses of
      Nothing -> "Whatever."
      Just response -> response
  

fetchInteraction :: String -> Interaction
fetchInteraction message
    | isSilence message                     = Silence
    | isQuestion message && isShout message = ShoutedQuestion
    | isShout message                       = Shout
    | isQuestion message                    = Question
    | otherwise                             = Default

findKey :: (Eq a) => a -> [(a, b)] -> Maybe b
findKey key = foldr(\(k, v) acc -> if k == key then Just v else acc) Nothing

isShout :: String -> Bool
isShout message =
    let uppercasedMessage = uppercase message == message
        notOnlyNumbers = not $ onlyNumbers message
        anyText = any (`elem` ['A'..'Z']) message
    in uppercasedMessage && notOnlyNumbers && anyText

onlyNumbers :: String -> Bool
onlyNumbers = all (`elem` ['0'..'9'] ++ [' ', ',', '?'])

isQuestion :: String -> Bool
isQuestion xs =
    let lastCharacter = last . last $ words xs
    in lastCharacter == '?'

uppercase :: String -> String
uppercase = map (\c -> if c >= 'a' && c <= 'z' then toEnum (fromEnum c - 32) else c)

whiteSpaces :: [Char]
whiteSpaces = [' ', '\t', '\n', '\r']

isSilence :: String -> Bool
isSilence = foldr (\x acc -> if not $ x `elem` whiteSpaces then False else acc) True
