//
//  Person.swift
//  Movie Villains
//
//  Created by Kristin Hunt on 6/11/15.
//  Copyright (c) 2015 Krispy. All rights reserved.
//

import UIKit

class Person : NSObject, NSCoding {
  
  var firstName : String
  var lastName : String
  var image : UIImage?
  
  init (first : String, last : String) {
  self.firstName = first
  self.lastName = last
  }
  
  required init(coder aDecoder: NSCoder) {
    self.firstName = aDecoder.decodeObjectForKey("firstName") as! String
    self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
    self.image = aDecoder.decodeObjectForKey("image") as? UIImage
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.firstName, forKey: "firstName")
    aCoder.encodeObject(self.lastName, forKey: "lastName")
    aCoder.encodeObject(self.image, forKey: "image")
  }
}