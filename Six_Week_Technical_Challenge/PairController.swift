//
//  PairController.swift
//  Six_Week_Technical_Challenge
//
//  Created by Martin Kirke on 12/2/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import Foundation

class PairController {
    
    private let Kpairs = "pairs"
    
    static var shared = PairController()
    
    var pairs: [Pair]
    
    init() {
    
    self.pairs = []
    
    }
    
    func addPerson(add: String) {
        
      let new = Pair(name: add)
        pairs.append(new)
        self.saveToStorage()
    }
    
    func saveToStorage() {
        
        let pairDic = self.pairs.map({$0.dicCopy()})
        
        UserDefaults.standard.set(pairDic, forKey: Kpairs)
    }
    
}
