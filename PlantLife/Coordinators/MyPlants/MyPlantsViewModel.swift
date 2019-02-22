//
//  MyPlantsViewModel.swift
//  PlantLife
//
//  Created by Michael Baldock on 01/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import Foundation

/// The My Plants Protocol defines what the My Plants View Model needs to fulfill it's function.
protocol MyPlantsProtocol {

  var homePlants: [MyPlants.Plant] { get }
  
}

/// Provides the trnsformations required to take the Model data for My Plants,
///  transforming it into data that is displayed by the My Plants View.
/// Provides convenience methods to allow this that are useful for the collection view
///  used by the My Plants View.
///
/// The My Plants View Model is retained by the My Plants Coordinator
class MyPlantsViewModel: NSObject {

  let dataSource:MyPlantsProtocol

  /// requires a data source that implements the MyPlants Protocol
  init(dataSource:MyPlantsProtocol) {
    self.dataSource = dataSource
  }

  /// Returns the viewmodel for a plant using Index Path
  /// Only built to work with a single section = 0
  func modelForIndexPath(_ indexPath:IndexPath) -> MyPlantsViewModel.Plant {

    if indexPath.section != 0 {
      fatalError("Only 1 section is supported")
    }

    let plant = dataSource.homePlants[indexPath.row]

    return MyPlantsViewModel.Plant(plant: plant)
  }
  
  /// Returns the number of items (My Plants) in a section
  /// Only built to work with a single section = 0
  func itemsInSection(_ section: Int) -> Int {

    if section != 0 {
      fatalError("Only 1 section is supported")
    }

    return dataSource.homePlants.count
  }

}

extension MyPlantsViewModel {
  
  /// My Plants View Model representation of a Plant (decoupled from underlying Model)
  struct Plant {
    let name:String
    
    /// Should be initialised with a MyPLants.Plant (Model representation)
    init (plant:MyPlants.Plant) {
      self.name = plant.name
    }
  }
}
