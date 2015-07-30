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
        
        var data = UIImagePNGRepresentation(picture)
        
        recipe.picture = data
        recipe.title = title
        
        self.save()
        
    }
    
    func addIngredientToRecipe(recipe: Recipe, withName name: String) {
        
        var ingredient = NSEntityDescription.insertNewObjectForEntityForName("Ingredient", inManagedObjectContext: Stack.sharedInstance.managedObjectContext) as! Ingredient
        
        ingredient.recipe = recipe
        ingredient.name = name
        
        self.save()
        
    }
    
    func removeRecipe(recipe: Recipe) {
        
        recipe.managedObjectContext?.deleteObject(recipe)
        
        self.save()
        
    }
    
    func removeIgredient(ingredient: Ingredient) {
        
        ingredient.managedObjectContext?.deleteObject(ingredient)
        
        self.save()
        
    }
    
    func save () {
    
        Stack.sharedInstance.managedObjectContext.save(nil)
        
    }
   
}
