//
//  AppCoordinator.swift
//  PlantLife
//
//  Created by Michael Baldock on 11/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import UIKit

enum App { /* namespace */ }

final class AppCoordinator: UIViewController {
  
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
    
    addChild(myPlantsCoordinator)
    
    myPlantsCoordinator.view.frame = CGRect(origin: .zero, size: plantsView.bounds.size)
    
    plantsView.addSubview(myPlantsCoordinator.view)
    
    NSLayoutConstraint.activate([
      myPlantsCoordinator.view!.leadingAnchor.constraint(equalTo: plantsView.leadingAnchor, constant: 0),
      myPlantsCoordinator.view!.topAnchor.constraint(equalTo: plantsView.topAnchor, constant: 0),
      myPlantsCoordinator.view!.trailingAnchor.constraint(equalTo: plantsView.trailingAnchor, constant: 0),
      myPlantsCoordinator.view!.bottomAnchor.constraint(equalTo: plantsView.bottomAnchor, constant: 0)
      ])
    
    myPlantsCoordinator.didMove(toParent: self)
    
    
  }
}
