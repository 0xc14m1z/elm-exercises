module Pangram exposing (..)

import Regex exposing (contains, regex)
import Char exposing (fromCode)


isPangram : String -> Bool
isPangram sentence =
   sentence
    |> String.toLower
    |> String.filter isLetter
    |> containsAllAlphabet


isLetter : Char -> Bool
isLetter char =
  List.member (String.fromChar char) letters


containsAllAlphabet : String -> Bool
containsAllAlphabet sentence =
  List.all (isContained sentence) letters


letters : List String
letters =
  List.range 97 122
    |> List.map Char.fromCode
    |> List.map String.fromChar


isContained : String -> String -> Bool
isContained string needle =
  String.contains needle string
