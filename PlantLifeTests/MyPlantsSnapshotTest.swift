//
//  MyPlantsSnapshotTest.swift
//  PlantLifeTests
//
//  Created by Michael Baldock on 21/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import Foundation
import XCTest
import SnapshotTesting
@testable import PlantLife

class MyViewControllerTests: XCTestCase {
  func testMyViewController() {
    let vc = AppCoordinator()
    
    assertSnapshot(matching: vc, as: .image)
  }
}
