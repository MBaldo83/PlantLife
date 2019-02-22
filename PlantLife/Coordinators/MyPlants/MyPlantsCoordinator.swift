//
//  MyPlantsCoordinator.swift
//  PlantLife
//
//  Created by Michael Baldock on 12/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import UIKit

//Displays a list of My Plants
class MyPlantsCoordinator: UIViewController, CoordinatorProtocol {
  
  typealias Cell = MyPlantsCollectionViewCell
  
  @IBOutlet var collectionView: UICollectionView!
  
  var plantCellItemSize: CGSize {
    return CGSize(width: view.frame.width, height: Cell.Constants.height)
  }
  
  let myPlantsViewModel: MyPlantsViewModel
  
  let model: DependencyContainerProtocol
  
  init(model: DependencyContainerProtocol) {
    self.model = model
    self.myPlantsViewModel = MyPlantsViewModel(dataSource: self.model.dependencies.myPlants)
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension MyPlantsCoordinator {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
      collectionView.register(UINib(nibName: Cell.Constants.nibName,
                                    bundle: nil),
                            forCellWithReuseIdentifier: Cell.Constants.cellReuseIdentifier)
    
    if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      flowLayout.estimatedItemSize = plantCellItemSize
    }
  }
  
}

extension MyPlantsCoordinator : UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    
    return myPlantsViewModel.itemsInSection(section)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: Cell.Constants.cellReuseIdentifier,
      for: indexPath) as? MyPlantsCollectionViewCell else {
        fatalError("Only works with MyPlantsCollectionViewCell")
    }
    let model = myPlantsViewModel.modelForIndexPath(indexPath)
    cell.update(withViewModel: model)
    return cell
  }
  
}

extension MyPlantsCoordinator : UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize  {
    
    return plantCellItemSize
  }
  
}
