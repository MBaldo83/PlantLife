//
//  ViewController.swift
//  PlantLife
//
//  Created by Michael Baldock on 31/01/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import UIKit

class MyPlantsViewController: UIViewController {

  @IBOutlet var collectionView: UICollectionView!

  var plantCellItemSize: CGSize {
    return CGSize(width: view.frame.width, height: 60)
  }

  let myPlantsViewModel = MyPlantsViewModel(dataSource: MyPlants())

  override func viewDidLoad() {
    super.viewDidLoad()

    if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      flowLayout.estimatedItemSize = plantCellItemSize
    }
  }
}

extension MyPlantsViewController : UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {

    return myPlantsViewModel.itemsInSection(section)
  }

  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "PlantCollectionViewCell",
      for: indexPath) as? MyPlantsCollectionViewCell else {
          fatalError("Only works with MyPlantsCollectionViewCell")
    }
    let model = myPlantsViewModel.modelForIndexPath(indexPath)
    cell.update(withViewModel: model)
    return cell
  }

}

extension MyPlantsViewController : UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize  {

    return plantCellItemSize
  }

}

