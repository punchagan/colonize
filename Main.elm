-- imports
import Graphics.Collage (collage, toForm)
import Graphics.Element (fittedImage, Element)
import List
import Text

import Regions (drawRegion, Region, regions)


-- types

type alias Board = {
      regions      : List Region
    }


-- functions
drawBoard : Board -> Element
drawBoard board = collage 800 400
                  (
                   [ toForm (fittedImage 800 370 "map.png") ] ++
                   List.map drawRegion board.regions
                  )


initialBoard : Board
initialBoard =
    {
      regions = regions
    }


main : Element
main = drawBoard initialBoard
