//
//  AppCoordinator.swift
//  PlantLife
//
//  Created by Michael Baldock on 11/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import UIKit

enum App { /* namespace */ }

final class AppCoordinator: UIViewController, CoordinatorProtocol {
  
  let model: DependencyContainerProtocol
  
  @IBOutlet weak var plantsView: UIView!
  
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
    
    let myPlantsCoordinator = MyPlantsCoordinator(model: self.model)
    
    add(child: myPlantsCoordinator,
        inside: plantsView)
  }
}
