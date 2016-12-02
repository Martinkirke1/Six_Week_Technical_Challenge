//
//  Pair.swift
//  Six_Week_Technical_Challenge
//
//  Created by Martin Kirke on 12/2/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import Foundation

class Pair: Equatable {

private let Kname = "name"
    
var name: String

    init(name: String) {
        
        self.name = name
        
    }
    
    
    init?(Dic: [String : AnyObject]) {
        guard let name = Dic[Kname] as? String else { return nil }
        self.name = name
    }
    
    func dicCopy() ->  [String : AnyObject] {
        let dictionary = [Kname : self.name]
        
        return dictionary as [String : AnyObject]
    }

}

 func ==(lhs: Pair, rhs: Pair) -> Bool {
return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
