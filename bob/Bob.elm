module Bob exposing (hey)

import Regex exposing (regex, contains)
import String exposing (isEmpty, toUpper)
import Char exposing (isUpper, isLower)

question = regex "\\?$"
mute = regex "^\\s*$"

hey : String -> String
hey statement =
  if contains mute statement then
    "Fine. Be that way!"
  else if isShouting statement then
    "Whoa, chill out!"
  else if contains question statement then
    "Sure."
  else
    "Whatever."

isShouting : String -> Bool
isShouting statement =
  let
    letters = String.filter isLetter statement
    uppercaseLetters = String.toUpper letters
  in
    not (String.isEmpty letters) && letters == uppercaseLetters

isLetter : Char -> Bool
isLetter char =
  Char.isUpper char || Char.isLower char
