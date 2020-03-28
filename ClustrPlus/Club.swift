//
//  Club.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 3/27/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import Foundation
import Firebase

class Club{
    let ref : DatabaseReference?
    var name: String = ""
    var description: String = ""
    var signUpLink: String = ""
    
    init(name: String, description: String, signUpLink: String) {
        self.ref = nil
        self.name = name
        self.description = description
        self.signUpLink = signUpLink
    }
    
    init?(snapshot : DataSnapshot){
        guard
            let value = snapshot.value as? [String : AnyObject],
            let fName = value["Club Name"] as? String,
            let fDescription = value["Club Description"] as? String,
            let fSignUpLink = value["Club Sign Up Link"] as? String
        else{
            return nil
        }
        self.ref = snapshot.ref
        self.name = fName
        self.description = fDescription
        self.signUpLink = fSignUpLink
    }
    
    func toAnyObject() -> Any{
        return["Club Name" : name,
               "Club Description" : description,
               "Club Sign Up Link" : signUpLink
        ]
    }
    
}
