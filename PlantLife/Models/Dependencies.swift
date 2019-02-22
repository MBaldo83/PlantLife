//
//  Dependencies.swift
//  PlantLife
//
//  Created by Michael Baldock on 11/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import Foundation

/// Dependency Container
/// Provides a property where the app's dependency provider can be access
protocol DependencyContainerProtocol {
  
  var dependencies: DependencyProviderProtocol { get }
}

/// Dependency Provider
/// Provides all the services / Dependencies that the App requires.
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
  
  init (myPlants: MyPlantsProtocol = MyPlants()
    ) {
    self.myPlants = myPlants
  }
  
}
