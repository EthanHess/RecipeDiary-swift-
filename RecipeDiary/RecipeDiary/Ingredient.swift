//
//  Ingredient.swift
//  
//
//  Created by Ethan Hess on 7/27/15.
//
//

import Foundation
import CoreData

class Ingredient: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var recipe: Recipe

}
