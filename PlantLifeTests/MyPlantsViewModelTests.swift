//
//  MyPlantsViewModelTests.swift
//  PlantLifeTests
//
//  Created by Michael Baldock on 01/02/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import Foundation

import XCTest
@testable import PlantLife

class MyPlantsMock: MyPlantsProtocol {

  var homePlants: [MyPlants.Plant] = []

}

class MyPlantsViewModelTests: XCTestCase {

  var mockPlants: MyPlantsMock {
    let mockPlants = MyPlantsMock()
    mockPlants.homePlants = [MyPlants.Plant(name: "big"),
                             MyPlants.Plant(name: "bushy"),
                             MyPlants.Plant(name: "bush")]
    return mockPlants
  }

  func testModelForIndexPath() {

    let viewModel = MyPlantsViewModel(dataSource: mockPlants)

    var idx = 0
    for testPlant in mockPlants.homePlants {

      let underTest = viewModel.modelForIndexPath(IndexPath(row: idx,
                                                            section: 0))
      XCTAssertEqual(testPlant.name, underTest.name)
      idx += 1
    }
  }

  func testItemsInSection() {

    let viewModel = MyPlantsViewModel(dataSource: mockPlants)

    XCTAssertEqual(viewModel.itemsInSection(0), mockPlants.homePlants.count)
  }

}
