//
//  Recipe.swift
//  
//
//  Created by Ethan Hess on 7/27/15.
//
//

import Foundation
import CoreData

@objc(Recipe)

class Recipe: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var picture: NSData
    @NSManaged var ingredients: NSOrderedSet

}
