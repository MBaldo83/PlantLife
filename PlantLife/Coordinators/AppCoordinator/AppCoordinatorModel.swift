//
//  AppCoordinatorModel.swift
//  PlantLife
//
//  Created by Michael Baldock on 11/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import Foundation

// MARK: - Concrete Implementation

extension App {
  
  /**
  Provides the Model and Dependencies requried For the App.
   Retains a reference to the dependencies to provide access
  **/
  struct CoordinatorModel: DependencyContainerProtocol {
    
    let dependencies: DependencyProviderProtocol
    
    /// Default initialiser uses the default Dependency Container without arguments
    init(dependencies: DependencyProviderProtocol = DependencyContainer()) {
      self.dependencies = dependencies
    }
  }
}
