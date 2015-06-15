//
//  DetailViewController.swift
//  Movie Villains
//
//  Created by Kristin Hunt on 6/11/15.
//  Copyright (c) 2015 Krispy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var firstNameLabel: UILabel!
  
  @IBOutlet weak var lastNameLabel: UILabel!
  
  var selectedVillain : Person!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
  self.firstNameLabel.text = selectedVillain.firstName
  self.lastNameLabel.text = selectedVillain.lastName

     }
}
