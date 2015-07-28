//
//  DetailViewController.swift
//  RecipeDiary
//
//  Created by Ethan Hess on 7/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    var imageView : UIImageView!
    var tableView : UITableView!
    var nameTextField : UITextField!
    var descriptionTextField : UITextField!
    var saveButton : UIButton!
    var chooseImageButton : UIButton!
    var imagePicker : UIImagePickerController?
    var chosenImage : UIImage?
    var recipe : Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        if let recipe = self.recipe {
        
        self.updateWithRecipe(recipe)
            
        }
        
        self.setUpTableView()
        
    }
    
    func updateWithRecipe(recipe: Recipe) {
        
        
        
    }
    
    func setUpTableView() {
    
        
        tableView = UITableView.new()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRectMake(self.view.frame.size.width / 10, self.view.frame.size.height / 2, self.view.frame.size.width - self.view.frame.size.width / 5, self.view.frame.size.height - 20)
        tableView.layer.cornerRadius = 10
        tableView.layer.borderColor = UIColor.blackColor().CGColor
        tableView.layer.borderWidth = 2
        self.view.addSubview(tableView)
        
    }
    
    
    //table view data source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = "test"
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
