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
    var ingredientButton : UIButton!
    var imagePicker : UIImagePickerController?
    var chosenImage : UIImage?
    var slideOutView: UIView!
    var barButton: UIBarButtonItem!
    var popBackButton: UIButton!
    var recipe : Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 6/255, green: 37/255, blue: 108/255, alpha: 1)
        
        barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "controlPopView")
        navigationItem.rightBarButtonItem = barButton
        
        if let recipe = self.recipe {
        
        self.updateWithRecipe(recipe)
            
        }
        
        self.setUpTableView()
        self.setUpImagePicker()
        self.setUpSubviews()
        
        self.controlPopView()
    }
    
    func updateWithRecipe(recipe: Recipe) {
        
        if let recipe = self.recipe {
        
        self.title = recipe.title
        
        let imageData = UIImage(data: recipe.picture)
        
        self.imageView?.image = imageData
        
        }
        
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
        
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        imagePicker?.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker?.allowsEditing = false
        
        
    }
    
    func presentImagePicker() {
        
        presentViewController(imagePicker!, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        chosenImage = image
        imageView.image = chosenImage
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func setUpSubviews() {
        
        imageView = UIImageView()
        imageView.frame = CGRectMake(self.view.frame.size.width / 2 - 60, 75, 120, 120)
        imageView.layer.cornerRadius = 60
        imageView.layer.borderColor = UIColor.blackColor().CGColor
        imageView.layer.borderWidth = 2
        imageView.backgroundColor = UIColor.grayColor()
        imageView.layer.masksToBounds = true
        self.view.addSubview(imageView)
        
        ingredientTextField = UITextField()
        ingredientTextField.frame = CGRectMake(50, 225, self.view.frame.size.width - 180, 50)
        ingredientTextField.placeholder = "Add Ingredient"
        ingredientTextField.borderStyle = UITextBorderStyle.RoundedRect
        ingredientTextField.delegate = self
        self.view.addSubview(ingredientTextField)
        
        ingredientButton = UIButton()
        ingredientButton.frame = CGRectMake(ingredientTextField.frame.size.width + 70, 225, 50, 50)
        ingredientButton.layer.cornerRadius = 25
        ingredientButton.layer.borderColor = UIColor.blackColor().CGColor
        ingredientButton.layer.borderWidth = 2
        ingredientButton.backgroundColor = UIColor.redColor()
        ingredientButton.setTitle("+", forState: UIControlState.Normal)
        ingredientButton.titleLabel?.numberOfLines = 0
        ingredientButton.addTarget(self, action: "saveIngredient", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(ingredientButton)
        
        
        slideOutView = UIView()
        slideOutView.layer.cornerRadius = 10
        slideOutView.layer.borderColor = UIColor.blackColor().CGColor
        slideOutView.layer.borderWidth = 2
        slideOutView.frame = CGRectMake(self.view.frame.size.width - 15, 0, self.view.frame.size.width - 50, self.view.frame.size.height)
        slideOutView.backgroundColor = UIColor(red: 95/255, green: 242/255, blue: 168/255, alpha:1);
        self.view.addSubview(slideOutView)
        
        nameTextField = UITextField()
        nameTextField.frame = CGRectMake(15, 75, self.slideOutView.frame.size.width / 2 + 50, 50)
        nameTextField.placeholder = "Title"
        nameTextField.borderStyle = UITextBorderStyle.RoundedRect
        nameTextField.delegate = self
        self.slideOutView.addSubview(nameTextField)
        
        saveButton = UIButton()
        saveButton.frame = CGRectMake(50, 150, 100, 100)
        saveButton.layer.cornerRadius = 50
        saveButton.layer.borderColor = UIColor.blackColor().CGColor
        saveButton.layer.borderWidth = 2
        saveButton.backgroundColor = UIColor.blueColor()
        saveButton.setTitle("Save Recipe", forState: UIControlState.Normal)
        saveButton.titleLabel?.numberOfLines = 0
        saveButton.addTarget(self, action: "saveRecipeData", forControlEvents: UIControlEvents.TouchUpInside)
        slideOutView.addSubview(saveButton)
        
        chooseImageButton = UIButton()
        chooseImageButton.frame = CGRectMake(50, 280, 100, 100)
        chooseImageButton.layer.cornerRadius = 50
        chooseImageButton.layer.borderColor = UIColor.blackColor().CGColor
        chooseImageButton.layer.borderWidth = 2
        chooseImageButton.backgroundColor = UIColor.blueColor()
        chooseImageButton.setTitle("Upload Image", forState: UIControlState.Normal)
        chooseImageButton.titleLabel?.numberOfLines = 0
        chooseImageButton.addTarget(self, action: "presentImagePicker", forControlEvents: UIControlEvents.TouchUpInside)
        slideOutView.addSubview(chooseImageButton)
        
        popBackButton = UIButton()
        popBackButton.frame = CGRectMake(75, self.slideOutView.frame.size.height - 70, 50, 50)
        popBackButton.layer.cornerRadius = 25
        popBackButton.layer.borderWidth = 2
        popBackButton.layer.borderColor = UIColor.blackColor().CGColor
        popBackButton.backgroundColor = UIColor.whiteColor()
        popBackButton.setTitle(">", forState: UIControlState.Normal)
        popBackButton.titleLabel?.numberOfLines = 0
        popBackButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        popBackButton.addTarget(self, action: "controlPopInView", forControlEvents: UIControlEvents.TouchUpInside)
        slideOutView.addSubview(popBackButton)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    
    //table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let recipe = self.recipe {
            
            return recipe.ingredients.count
        }
        
        else {
            
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        if let recipe = self.recipe {
        
        let ingredient : Ingredient = recipe.ingredients[indexPath.row] as! Ingredient
            
            cell.textLabel?.text = ingredient.name
            cell.textLabel?.numberOfLines = 0
        }
        
        return cell
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveRecipeData() {
        
        RecipeController.sharedInstance.addRecipeWithName(self.nameTextField.text!, andPicture: self.imageView.image!)
        
    }
    
    func saveIngredient() {
        
        RecipeController.sharedInstance.addIngredientToRecipe(self.recipe!, withName: self.ingredientTextField.text!)
        
        tableView.reloadData()
        
    }
    
    func controlPopView() {
        
        if slideOutView.frame.origin.x > self.view.frame.size.width - 16 {

        self.popOutView(slideOutView, distance: self.slideOutView.frame.size.width - 15)
            
        }
        
    }
    
    func controlPopInView() {
        
        self.popBackView(slideOutView, distance: self.slideOutView.frame.size.width - 15)
    }
    
    func popOutView(view: UIView, distance: CGFloat) {
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            view.center = CGPointMake(view.center.x - distance, view.center.y)
            
        })
        
    }
    
    func popBackView(view: UIView, distance: CGFloat) {
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            view.center = CGPointMake(view.center.x + distance, view.center.y)
            
        })
        
        
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
