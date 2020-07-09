//
//  Utility.swift
//  FB
//
//  Created by Vardges Gasparyan on 2020-07-08.
//  Copyright © 2020 Vardges Gasparyan. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class Utilities {
    
// **************************** Password Validate *********************************************************
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let pwdRegEx = "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{6,15}"
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", pwdRegEx)
        
        return passwordTest.evaluate(with: password)
    }
// ********************************************************************************************************
    
    static func logOut() {
        
        let firebaseAuth = Auth.auth()
        
        do {
            
            try firebaseAuth.signOut()
            
        } catch let signOutError as NSError {
            
          print ("Error signing out: %@", signOutError)
        }
    }
    
// *******************************************************************************************************
    
    static func deleteAccount() {
        
        let user = Auth.auth().currentUser
        let ref = Database.database().reference().child("users").child(user!.uid)
        
        user?.delete { error in
          if let error = error {
            // An error happened.
            print("Error detet account \(error)")
          } else {
            // Account deleted.
            ref.removeValue()
            print("Account deleted")
          }
        }
    }
}
