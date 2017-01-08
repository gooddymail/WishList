//
//  WishTests.swift
//  WishList
//
//  Created by Katchapon Poolpipat on 1/8/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import XCTest
import RealmSwift
@testable import WishList

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
  
  func testWishInitailizer() {
    let wish = Wish(details: "One day i will have my own cake store")
    
    XCTAssertEqual(wish.details, "One day i will have my own cake store")
  }
  
  func testSaveWish() {
    let wish = Wish(details: "One day i will have my own cake store")
    
    wish.save()
    
    let realm = try! Realm()
    
    let wishFromDatabase = realm.objects(Wish.self).last
    XCTAssertEqual(wishFromDatabase?.details, wish.details)
  }
}
