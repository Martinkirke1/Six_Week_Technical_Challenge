//
//  Pair.swift
//  Six_Week_Technical_Challenge
//
//  Created by Martin Kirke on 12/2/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import Foundation

class Person {

private let Kgroup = "group"
static let  Kname = "Name"
   
    let Name: String
    
    
    init(Name: String, groupName: String? =  nil){
        self.Name = Name
    }
    
    init?(dictionary:[String: Any]){
        guard let Name = dictionary[Person.Kname] as? String
            else { return nil }
        
        self.Name = Name
    }
    
    var dictionaryRepresentation: [String: Any]{
        return [Person.Kname: self.Name]
    }
}

