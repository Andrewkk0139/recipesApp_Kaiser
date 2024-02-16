//
//  Recipes.swift
//  recipesApp_Kaiser
//
//  Created by ANDREW KAISER on 2/15/24.
//

import Foundation
import FirebaseCore
import FirebaseDatabase

public class Recipes {
    var title: String
    var steps: String
    var firebaseKey = ""
    
    var ref = Database.database().reference()

    
    init(title: String, steps: String) {
        self.title = title
        self.steps = steps
    }
    
    init(dict: [String:any]){
        if let t = dict["title:"] {
            
        }
        if let s = dict["steps:"]{
            
        }
    }
    
    
    
    
    
    
    
}
