//
//  Dependencies.swift
//  PlantLife
//
//  Created by Michael Baldock on 11/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import Foundation

protocol DependencyContainerProtocol {
  
  var dependencies: DependencyProviderProtocol { get }
}

protocol DependencyProviderProtocol {
  
  var myPlants: MyPlantsProtocol { get }
  
}

// MARK: - Concrete Implementation

/// Concrete implementation of DependencyProviderProtocol which
///   allows for injections of the dependencies. For production
///   purposes, it should be initialized with no arguments. For
///   testing, provide mocks as the argument. Over time, this
///   init method will expand to accomodate new dependencies.
final class DependencyContainer: DependencyProviderProtocol {
  
  let myPlants: MyPlantsProtocol
  
  init (
    myPlants: MyPlantsProtocol? = nil
    ) {
    
    let _myPlants = myPlants ?? MyPlants()
    
    self.myPlants = _myPlants
  }
  
}
