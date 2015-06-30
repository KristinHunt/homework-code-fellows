//
//  ViewController.swift
//  Movie Villains
//
//  Created by Kristin Hunt on 6/11/15.
//  Copyright (c) 2015 Krispy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var villains = [Person]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let villainsFromArchive = self.loadFromArchive() {
      self.villains = villainsFromArchive
    } else {
      self.loadVillainsFromPlist()
      self.saveToArchive()
    }
    
    self.tableView.dataSource = self
  }
  
  func loadVillainsFromPlist() {
    
    if let villainsPath = NSBundle.mainBundle().pathForResource("Villains", ofType: "plist"), villainsObject = NSArray(contentsOfFile: villainsPath) as? [[String : String]] {
      
      for object in villainsObject {
        if let firstName = object["FirstName"], lastName = object["LastName"] {
          let villains = Person(first: firstName, last: lastName)
          self.villains.append(villains)
        }
      }
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.saveToArchive()
    self.tableView.reloadData()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.villains.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PersonCell
    cell.backgroundColor = UIColor.whiteColor()
    
    cell.personImageView.layer.masksToBounds = true
    cell.personImageView.layer.cornerRadius = 10
    cell.personImageView.layer.borderWidth = 2
    cell.personImageView.layer.borderColor = UIColor.blueColor().CGColor
    cell.personImageView.layer.shadowColor = UIColor.lightGrayColor().CGColor
    
    let villainsToShow = self.villains[indexPath.row]
    
    if let image = villainsToShow.image {
      cell.personImageView.image = image
    }
    
    cell.firstNameLabel.text = villainsToShow.firstName
    cell.lastNameLabel.text = villainsToShow.lastName
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    if let lastSelectedName = userDefaults.objectForKey("LastSelected") as? String where lastSelectedName == villainsToShow.firstName {
      cell.backgroundColor = UIColor.redColor()
    }
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      
      if let detailViewController = segue.destinationViewController as? DetailViewController {
        let myIndexPath = self.tableView.indexPathForSelectedRow()
        
      if let indexPath = self.tableView.indexPathForSelectedRow() {
        let selectedRow = indexPath.row

      let selectedVillain = self.villains[selectedRow]
      detailViewController.selectedVillain = selectedVillain
        
      let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(selectedVillain.firstName, forKey: "LastSelected")
        userDefaults.synchronize()
    }
  }
  }
}

  func saveToArchive() {
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      println(archivePath)
      NSKeyedArchiver.archiveRootObject(self.villains, toFile: archivePath + "/archive")
    }
}

  func loadFromArchive() -> [Person]? {
    
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      
      if let villainsFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath + "/archive") as? [Person] {
        
        return villainsFromArchive
      }
    }
    
    return nil
}
}




