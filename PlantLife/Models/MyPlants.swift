//
//  MyPlants.swift
//  PlantLife
//
//  Created by Michael Baldock on 01/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import Foundation

/// This represents the Model layer to obtain My Plants data
class MyPlants: MyPlantsProtocol {

  struct Plant {
    let name:String
  }
  
  let homePlants = [Plant(name: "Tradescantia Zebra"), Plant(name: "Ficus"), Plant(name: "Calathea")]
}
