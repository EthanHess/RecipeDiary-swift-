//
//  ViewController.swift
//  RecipeDiary
//
//  Created by Ethan Hess on 7/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView = UICollectionView()
    var addButton = UIBarButtonItem()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets up collectionView
        
        collectionView = UICollectionView.new()
        
        let flowLayout = UICollectionViewFlowLayout.new()
        
//        collectionView.frame = CGRectMake(0, 75, self.view.frame.size.width, self.view.frame.size.height - 75)
        
        collectionView = UICollectionView(frame: CGRectMake(0, 75, self.view.frame.size.width, self.view.frame.size.height - 75), collectionViewLayout: flowLayout)
        
        flowLayout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2)
        
        collectionView.backgroundColor = UIColor.cyanColor()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(collectionView)
        
        //sets up add button
        
        addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addRecipe")
        navigationItem.rightBarButtonItem = addButton
        

    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        
    }
    
    func addRecipe() {
        
        let detailViewController = DetailViewController.new()
        
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

