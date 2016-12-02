//
//  PairController.swift
//  Six_Week_Technical_Challenge
//
//  Created by Martin Kirke on 12/2/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import Foundation
import CoreData



class PairController{
    
    static let kPerson = "person"
    
    
    static let shared = PairController()
    
    var persons: [Person]
    
    init(){
        
        persons = []
        
        loadFromStorage()
    }
    
    func random(){
        persons.random()
        savedToStorage()
    }


    func addPerson(Name: String){
        let newName = Person(Name: Name)
        self.persons.append(newName)
        savedToStorage()
    }
    

    func savedToStorage(){
        let dictionaryArray = persons.map{$0.dictionaryRepresentation}
        UserDefaults.standard.set(dictionaryArray, forKey: PairController.kPerson)
    }
    
    func loadFromStorage(){
        guard let personsDictionaryArray = UserDefaults.standard.object(forKey: PairController.kPerson) as? [[String: Any]]
            else { return }
        self.persons = personsDictionaryArray.flatMap{Person(dictionary: $0)}
    }
}

extension Array{
    mutating func random(){
        for _ in 0..<10{ sort { (_,_) in arc4random() < arc4random() } }
    }
}
