//
//  DetailViewController.swift
//  Movie Villains
//
//  Created by Kristin Hunt on 6/11/15.
//  Copyright (c) 2015 Krispy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var imageView: UIImageView!
  
  var selectedVillain : Person!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    self.firstNameTextField.delegate = self
    self.lastNameTextField.delegate = self
    self.firstNameTextField.tag = 0
    self.lastNameTextField.tag = 1
    
    self.firstNameTextField.text = self.selectedVillain.firstName
    self.lastNameTextField.text = self.selectedVillain.lastName
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      self.selectedVillain.firstName = textField.text
    } else {
      self.selectedVillain.lastName = textField.text
  }
}
}