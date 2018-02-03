module Bob exposing (hey)

import Regex exposing (regex, contains)
import String exposing (toUpper)

question = regex "\?$"
mute = regex "^\\s*$"

hey : String
hey statement =
  if contains question statement then
    "Sure."
  else if statement == toUpper statement then
    "Whoa, chill out!"
  else if contains mute statement then
    "Fine. Be that way!"
  else
    "Whatever."
