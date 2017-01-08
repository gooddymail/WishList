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
}
