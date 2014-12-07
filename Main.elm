-- imports


-- types
type Name = String
type Units = Int
type Location = (Float, Float)
type Owner = Int
type Region = {

      name: Name
    , location: Location
    , owner: Owner
    , units: Units
    , continent: Name

    }


type Board =
    {
      regions      : [Region]
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
