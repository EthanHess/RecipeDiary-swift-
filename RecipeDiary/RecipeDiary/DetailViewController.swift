//
//  DetailViewController.swift
//  RecipeDiary
//
//  Created by Ethan Hess on 7/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {

    var imageView : UIImageView!
    var tableView : UITableView!
    var nameTextField : UITextField!
    var ingredientTextField : UITextField!
    var saveButton : UIButton!
    var chooseImageButton : UIButton!
    var imagePicker : UIImagePickerController?
    var chosenImage : UIImage?
    var slideOutView: UIView!
    var barButton: UIBarButtonItem!
    var recipe : Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "popOutView")
        navigationItem.rightBarButtonItem = barButton
        
        if let recipe = self.recipe {
        
        self.updateWithRecipe(recipe)
            
        }
        
        self.setUpTableView()
        self.setUpImagePicker()
        self.setUpSubviews()
        
    }
    
    func updateWithRecipe(recipe: Recipe) {
        
        
        
    }
    
    func setUpTableView() {
    
        
        tableView = UITableView(frame: CGRectMake(self.view.frame.size.width / 10, self.view.frame.size.height / 2, self.view.frame.size.width - self.view.frame.size.width / 5, self.view.frame.size.height / 2 - 20), style: UITableViewStyle.Grouped)
            
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            
        tableView.layer.cornerRadius = 10
        tableView.layer.borderColor = UIColor.blackColor().CGColor
        tableView.layer.borderWidth = 2
            
        self.view.addSubview(tableView)
        
        
    }
    
    
    func setUpImagePicker() {
        
        imagePicker = UIImagePickerController.new()
        imagePicker?.delegate = self
        imagePicker?.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker?.allowsEditing = true
        
        
    }
    
    func setUpSubviews() {
        
        imageView = UIImageView.new()
        imageView.frame = CGRectMake(self.view.frame.size.width / 10, 70, 120, 120)
        imageView.layer.cornerRadius = 60
        imageView.layer.borderColor = UIColor.blackColor().CGColor
        imageView.layer.borderWidth = 2
        imageView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(imageView)
        
        nameTextField = UITextField.new()
        nameTextField.frame = CGRectMake(self.view.frame.size.width / 2, 70, self.view.frame.size.width / 2 - 25, 50)
        nameTextField.placeholder = "Title"
        nameTextField.borderStyle = UITextBorderStyle.RoundedRect
        nameTextField.delegate = self
        self.view.addSubview(nameTextField)
        
        ingredientTextField = UITextField.new()
        ingredientTextField.frame = CGRectMake(self.view.frame.size.width / 2, 135, self.view.frame.size.width / 2 - 25, 50)
        ingredientTextField.placeholder = "Title"
        ingredientTextField.borderStyle = UITextBorderStyle.RoundedRect
        ingredientTextField.delegate = self
        self.view.addSubview(ingredientTextField)
        
        slideOutView = UIView.new()
        slideOutView.frame = CGRectMake(self.view.frame.size.width - 15, 0, self.view.frame.size.width - 50, self.view.frame.size.height)
        slideOutView.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(slideOutView)
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    
    //table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        
        
        cell.textLabel?.text = "test"
        cell.textLabel?.numberOfLines = 0
        
        return cell
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveRecipeData() {
        
        
        
    }
    
    func saveIngredient() {
        
        
        
    }
    
    func popOutView() {
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
