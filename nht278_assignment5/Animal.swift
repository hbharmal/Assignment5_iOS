//
//  Animal.swift
//  nht278_assignment5
//
//  Created by Nancy Tran on 10/5/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import Foundation

class Animal {
    
    var name: String
    var scientific: String
    var classification: String
    var size: String
    var image: String
    
    init(name: String, scientific: String, classification: String, size: String, image: String ){
        self.name = name
        self.scientific = scientific
        self.classification = classification
        self.size = size
        self.image = image
    }
}
