//
//  AppCoordinator.swift
//  PlantLife
//
//  Created by Michael Baldock on 11/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import UIKit

enum App { /* namespace */ }

/**
 App Coordinator should be the root view contoller for the app.
 From here we retain a strong reference to the other Coordinators as descendants
 **/
final class AppCoordinator: UIViewController, CoordinatorProtocol {
  
  let model: DependencyContainerProtocol
  
  @IBOutlet weak var plantsView: UIView!
  
  /// Default initialiser instantiates the app coordinator model.
  /// This contains any dependencies required by the app
  init(model: DependencyContainerProtocol = App.CoordinatorModel()) {
    self.model = model
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension AppCoordinator {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /// Adds the My Plants Coordinator to the app
    let myPlantsCoordinator = MyPlantsCoordinator(model: self.model)
    
    add(child: myPlantsCoordinator,
        inside: plantsView)
  }
}
