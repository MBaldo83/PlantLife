//
//  MyPlantsCollectionViewCell.swift
//  PlantLife
//
//  Created by Michael Baldock on 01/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import UIKit

class MyPlantsCollectionViewCell: UICollectionViewCell {
  @IBOutlet var plantNameLabel: UILabel!

  func update(withViewModel viewModel:MyPlantsViewModel.Plant) {
    plantNameLabel.text = viewModel.name
  }
}
