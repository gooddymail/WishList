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
  
  let defaultWishDetails = "One day i will have my own cake store"
  let updatedWishDetails = "One day i will have a happy family"
  
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
    let wish = Wish(details: defaultWishDetails)
    
    XCTAssertEqual(wish.details, defaultWishDetails)
  }
  
  func testSaveWish() {
    let wish = Wish(details: defaultWishDetails)
    
    wish.save()
    
    let realm = try! Realm()
    let wishFromDatabase = realm.objects(Wish.self).last
    
    XCTAssertEqual(wishFromDatabase?.details, wish.details)
  }
  
  func testUpdateWish() {
    let wish = Wish(details: defaultWishDetails)
    wish.save()
    
    wish.update(details: updatedWishDetails)
    
    let realm = try! Realm()
    let wishFromDatabase = realm.objects(Wish.self).last
    
    XCTAssertEqual(wish.details, updatedWishDetails)
    XCTAssertEqual(wishFromDatabase?.details, updatedWishDetails)
  }
  
  func testDeleteWish() {
    let wish = Wish(details: defaultWishDetails)
    wish.save()
    
    let realm = try! Realm()
    XCTAssertEqual(realm.objects(Wish.self).count, 1)
    
    wish.delete()
    XCTAssertEqual(realm.objects(Wish.self).count, 0)
  }
  
  func createWish(number: Int) {
    for _ in 0..<number {
      let wish = Wish(details: defaultWishDetails)
      wish.save()
    }
  }
  
  func testGetAllWish() {
    createWish(number: 3)
    
    let wishs = Wish.all()
    
    XCTAssertEqual(wishs.count, 3)
  }
}
