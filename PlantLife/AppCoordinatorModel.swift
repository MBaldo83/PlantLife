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
  
  struct CoordinatorModel: DependencyContainerProtocol {
    
    let dependencies: DependencyProviderProtocol
    
    init(dependencies: DependencyProviderProtocol = DependencyContainer()) {
      self.dependencies = dependencies
    }
  }
}
