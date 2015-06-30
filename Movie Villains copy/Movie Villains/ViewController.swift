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
  
  var villain = [Person]()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    
    let friday13 = Person(first: "Jason", last: "Vorhees")
    let halloween = Person(first: "Michael", last: "Myers")
    let elmStreet = Person(first: "Freddy", last: "Krueger")
    self.villain.append(friday13)
    self.villain.append(halloween)
    self.villain.append(elmStreet)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.villain.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    
    let villainToShow = self.villain[indexPath.row]
    
    if let image = villainToShow.image {
      cell.imageView?.image = image
    }
    
    cell.textLabel?.text = villainToShow.firstName + " " + villainToShow.lastName
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      
      if let detailViewController = segue.destinationViewController as? DetailViewController {
        let myIndexPath = self.tableView.indexPathForSelectedRow()
        
      if let indexPath = self.tableView.indexPathForSelectedRow() {
        let selectedRow = indexPath.row
          
      let selectedVillain = self.villain[selectedRow]
      detailViewController.selectedVillain = selectedVillain
        
      println(selectedVillain.firstName + selectedVillain.lastName)
    }
  }
  }
}
}