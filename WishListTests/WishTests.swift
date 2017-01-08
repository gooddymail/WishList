//
//  WishTests.swift
//  WishList
//
//  Created by Katchapon Poolpipat on 1/8/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import XCTest
import RealmSwift

class WishTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
  }
  
  override func tearDown() {
    super.tearDown()
    
    let realm = try! Realm()
    try! realm.write {
      realm.deleteAll()
    }
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
