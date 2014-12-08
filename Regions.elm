module Regions where

import Graphics.Collage (circle, filled, move, Form)
import Color (rgba, Color)

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

type alias Continent = {name: Name, regions:List Region}

drawRegion : Region -> Form
drawRegion region = circle 10 |> filled clearGrey |> move region.location

-- variables
clearGrey : Color
clearGrey = rgba 111 111 111 0.6

asia : Continent
asia = {
      name = "Asia",
      regions = [

        {name = "India", location = (115, 15), owner = 0, units = 3, continent = "Asia"}
      , {name = "China", location = (160, 80), owner = 0, units = 3, continent = "Asia"}

      ]
    }

northAmerica : Continent
northAmerica = {
      name = "North America",
      regions = [
        {name = "Alaska", location = (-350, 142), owner = 0, units = 3, continent = "North America"}
      ]
    }


regions : List Region
regions = asia.regions ++ northAmerica.regions
