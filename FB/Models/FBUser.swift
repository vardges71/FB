//
//  User.swift
//  FB
//
//  Created by Vardges Gasparyan on 2020-07-08.
//  Copyright © 2020 Vardges Gasparyan. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

struct FBUser {
    
    let firstName: String?
    let lastName: String?
    let email: String?
    
    init(firstName: String, lastName: String, email: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    

}
