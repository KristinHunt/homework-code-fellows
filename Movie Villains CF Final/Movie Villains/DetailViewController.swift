//
//  DetailViewController.swift
//  Movie Villains
//
//  Created by Kristin Hunt on 6/11/15.
//  Copyright (c) 2015 Krispy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  
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
      //set the first name
      self.selectedVillain.firstName =  textField.text
    } else {
      //set the last name
      self.selectedVillain.lastName = textField.text
    }
  }
  
  @IBAction func photoButtonPressed(sender: AnyObject) {
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    let image = info[UIImagePickerControllerEditedImage] as! UIImage
    self.imageView.image = image
    self.selectedVillain.image = image
    picker.dismissViewControllerAnimated(true, completion: nil)
}
}