-- imports
import Graphics.Collage (collage, toForm, circle, filled, move, Form)
import Graphics.Element (fittedImage, Element)
import List (map)
import Color (rgba, Color)

-- types
type alias Name = String
type alias Units = Int
type alias Owner = Int
type alias Location = (Float, Float)
type alias Region = {
      name: Name
    , location: Location
    , owner: Owner
    , units: Units
    , continent: Name
    }

type alias Board = {
      regions      : List Region
    }


-- functions
drawBoard : Board -> Element
drawBoard board = collage 800 400
                  (
                   [ toForm (fittedImage 800 370 "map.png") ] ++
                   map drawRegion board.regions
                  )

drawRegion : Region -> Form
drawRegion region = circle 10 |> filled clearGrey |> move region.location


-- variables
clearGrey : Color
clearGrey = rgba 111 111 111 0.6

initialBoard : Board
initialBoard =
    {
      regions = [
       {
         name = "Congo"
       , location = (0, 0)
       , owner = 0
       , units = 3
       , continent = "Africa"
       },

       {
         name = "Mumbai"
       , location = (110, 10)
       , owner = 0
       , units = 3
       , continent = "Asia"
       }

      ]
    }


main : Element
main = drawBoard initialBoard
