//
//  Wish.swift
//  WishList
//
//  Created by Katchapon Poolpipat on 1/6/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import Foundation
import RealmSwift

class Wish: Object {
  
  dynamic var details = ""
  
  convenience init(details: String) {
    self.init()
    
    self.details = details
  }
  
  func save() {
    let realm = try! Realm()
    try! realm.write {
      realm.add(self)
    }
  }
  
  func update(details: String) {
    let realm = try! Realm()
    try! realm.write {
      self.details = details
    }
  }
  
  func delete() {
    let realm = try! Realm()
    try! realm.write {
      realm.delete(self)
    }
  }
}
