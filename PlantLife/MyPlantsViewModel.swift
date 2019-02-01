//
//  MyPlantsViewModel.swift
//  PlantLife
//
//  Created by Michael Baldock on 01/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import Foundation

protocol MyPlantsProtocol {

  var homePlants: [MyPlants.Plant] { get }
  
}

class MyPlantsViewModel: NSObject {

  let dataSource:MyPlantsProtocol

  init(dataSource:MyPlantsProtocol) {
    self.dataSource = dataSource
  }

  func modelForIndexPath(_ indexPath:IndexPath) -> MyPlantsViewModel.Plant {

    if indexPath.section != 0 {
      fatalError("Only 1 section is supported")
    }

    let plant = dataSource.homePlants[indexPath.row]

    return MyPlantsViewModel.Plant(plant: plant)
  }

  func itemsInSection(_ section: Int) -> Int {

    if section != 0 {
      fatalError("Only 1 section is supported")
    }

    return dataSource.homePlants.count
  }

}

extension MyPlantsViewModel {

  struct Plant {
    let name:String

    init (plant:MyPlants.Plant) {
      self.name = plant.name
    }
  }
}
