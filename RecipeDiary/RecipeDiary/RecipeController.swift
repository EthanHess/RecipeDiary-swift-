//
//  RecipeController.swift
//  RecipeDiary
//
//  Created by Ethan Hess on 7/27/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

import UIKit
import CoreData

class RecipeController: NSObject {
    
    var recipies: [Recipe] {
        
        get {
            return Stack.sharedInstance.managedObjectContext.executeFetchRequest(NSFetchRequest(entityName: "Recipe"), error: nil) as! Array
            
        }
    }
    
    static let sharedInstance = RecipeController ()
    
    func addRecipeWithName(title: String, andPicture picture: UIImage) {
        
        var recipe = NSEntityDescription.insertNewObjectForEntityForName("Recipe", inManagedObjectContext: Stack.sharedInstance.managedObjectContext) as! Recipe
        
        recipe.title = title
        
        self.save()
        
    }
    
    func addIngredientToRecipe(recipe: Recipe) {
        
        
        
    }
    
    func save () {
    
        Stack.sharedInstance.managedObjectContext.save(nil)
        
    }
   
}
