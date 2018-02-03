module Bob exposing (hey)

import Char exposing (isUpper, isLower)

hey : String -> String
hey statement =
  if isMute statement then
    "Fine. Be that way!"
  else if isShouting statement then
    "Whoa, chill out!"
  else if isQuestion statement then
    "Sure."
  else
    "Whatever."

isMute : String -> Bool
isMute statement =
  String.trim statement
    |> String.isEmpty

isShouting : String -> Bool
isShouting statement =
  let
    letters = String.filter isLetter statement
  in
    letters /= "" && letters == String.toUpper letters

isLetter : Char -> Bool
isLetter char =
  Char.isUpper char || Char.isLower char

isQuestion : String -> Bool
isQuestion statement =
  String.endsWith "?" statement
