module Regions where

import Graphics.Collage (circle, filled, move, group, Form, toForm)
import Color (rgba, Color, white, black)
import Basics

import Utils (txt)

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

addLocation : Location -> Location -> Location
addLocation (x, y) (a, b) = (x+a, y+b)

drawRegion : Region -> Form
drawRegion region =
    [
     circle 10 |> filled clearGrey |> move region.location
    , (txt 0.8 black (Basics.toString region.units)) |> toForm |> move region.location
    , (txt 0.8 black region.name) |> toForm |> move (addLocation region.location (0, 20))
    ] |> group

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
