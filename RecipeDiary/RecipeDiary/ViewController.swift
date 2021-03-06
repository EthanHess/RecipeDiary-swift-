//
//  ViewController.swift
//  RecipeDiary
//
//  Created by Ethan Hess on 7/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView!
    var addButton = UIBarButtonItem()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //sets up collectionView
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width / 2.5, height: 120)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor(red: 6/255, green: 37/255, blue: 108/255, alpha: 1)
        self.view.addSubview(collectionView)
        
        //sets up add button
        
        addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addRecipe")
        navigationItem.rightBarButtonItem = addButton
        
        collectionView.reloadData()
        

    }
    

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return RecipeController.sharedInstance.recipies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        
        let recipe = RecipeController.sharedInstance.recipies[indexPath.row]
        
        // configure cell here
        
        let imageData = UIImage(data: recipe.picture)
        
        cell.titleLabel.text = recipe.title
        cell.imageView.image = imageData
        
        cell.backgroundColor = UIColor.cyanColor()
        
        return cell
        
    
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let detailViewController = DetailViewController()
        
        detailViewController.recipe = RecipeController.sharedInstance.recipies[indexPath.row]
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    
    func addRecipe() {
        
        let detailViewController = DetailViewController()
        
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

