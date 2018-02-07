module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
  let
    words =
      number
        |> getFactors
        |> speak
  in
    if List.isEmpty words then
      toString number
    else
      String.join "" words


speak : List Int -> List String
speak factors =
  factors
    |> wordsMap
    |> List.filter Tuple.second
    |> List.map Tuple.first


wordsMap : List Int -> List (String, Bool)
wordsMap factors =
  [ ("Pling", List.member 3 factors)
  , ("Plang", List.member 5 factors)
  , ("Plong", List.member 7 factors)
  ]


getFactors : Int -> List Int
getFactors number =
  List.range 1 number
    |> List.filter (isFactor number)


isFactor : Int -> Int -> Bool
isFactor number potentialFactor =
  number % potentialFactor == 0
