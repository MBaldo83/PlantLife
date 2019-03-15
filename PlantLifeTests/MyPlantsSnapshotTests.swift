//
//  MyPlantsSnapshotTests.swift
//  PlantLifeTests
//
//  Created by Michael Baldock on 15/03/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import PlantLife

class MyPLantsSnapshotTests: XCTestCase {

  func testAppCoordinatorSnapshotAsImage() {

    let vc = AppCoordinator()
    assertSnapshot(matching: vc, as: .image)
  }

  func testAppCoordinatorSnapshotAsHierarchy() {

    let vc = AppCoordinator()
    assertSnapshot(matching: vc, as: .hierarchy)
  }

  func testAppCoordinatorSnapshotAsRecursiveDescription() {

    let vc = AppCoordinator()
    assertSnapshot(matching: vc, as: .recursiveDescription)
  }

}
