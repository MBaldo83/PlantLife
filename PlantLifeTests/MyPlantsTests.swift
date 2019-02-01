//
//  MyPlantsTests.swift
//  PlantLifeTests
//
//  Created by Michael Baldock on 01/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import XCTest
@testable import PlantLife

class MyPlantsTests: XCTestCase {

  func testTheTestData() {
    let myPlants = MyPlants()

    XCTAssertNotNil(myPlants.homePlants)
    XCTAssertEqual(myPlants.homePlants.count, 3)
  }
}
