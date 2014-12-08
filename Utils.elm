module Utils where

import Color (Color)
import Graphics.Element (fittedImage, Element)
import Text (plainText, fromString, color, height, typeface, leftAligned)

txt : Float -> Color -> String -> Element
txt p clr string =
    fromString string
      |> color clr
      |> typeface ["Helvetica Neue","Sans-serif"]
      |> height (p * 16)
      |> leftAligned
