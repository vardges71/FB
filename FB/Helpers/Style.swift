//
//  Style.swift
//  FB
//
//  Created by Vardges Gasparyan on 2020-07-08.
//  Copyright © 2020 Vardges Gasparyan. All rights reserved.
//

import Foundation
import UIKit

class Style: UIViewController {
    
    static func styleTextField(_ textfield: UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0.0, y: textfield.frame.height - 1, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = CGColor.init(srgbRed: 60/255, green: 90/255, blue: 150/255, alpha: 1)
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        textfield.borderStyle = UITextField.BorderStyle.none
        
        // Set border styles
//        textfield.layer.borderWidth = 1
//        textfield.layer.borderColor = CGColor.init(srgbRed: 60/255, green: 90/255, blue: 150/255, alpha: 1)
//        textfield.layer.cornerRadius = 15.0
        
        // Set background Color
        textfield.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0)
        textfield.textColor = UIColor.init(red: 60/255, green: 90/255, blue: 150/255, alpha: 1)

    }
    
    static func styleTextFieldNoBorder(_ textfield: UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
//        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height, width: textfield.frame.width, height: 1)
        
//        bottomLine.backgroundColor = UIColor.init(red: 98/255, green: 85/255, blue: 49/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        // Set border styles
        // textfield.layer.borderWidth = 2
        // textfield.layer.borderColor = UIColor.white.cgColor
        // textfield.layer.cornerRadius = 5.0
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
        // Set background Color
        textfield.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0)
        textfield.textColor = UIColor.init(red: 60/255, green: 90/255, blue: 150/255, alpha: 1)
    }

    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.layer.borderWidth = 2
        button.backgroundColor = UIColor.init(red: 60/255, green: 90/255, blue: 150/255, alpha: 1)
        button.layer.borderColor = CGColor.init(srgbRed: 60/255, green: 90/255, blue: 150/255, alpha: 1)
        button.layer.cornerRadius = 5.0
        button.tintColor = UIColor.white
    }

    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.backgroundColor = UIColor.init(red: 135/255, green: 180/255, blue: 255/255, alpha: 1)
        button.layer.borderColor = UIColor.init(red: 60/255, green: 90/255, blue: 150/255, alpha: 1).cgColor
        button.layer.cornerRadius = 5.0
        button.tintColor = UIColor.init(red: 60/255, green: 90/255, blue: 150/255, alpha: 1)
    }
    
    static func asStrokeButton (_ button: UIButton) {
        
        button.layer.borderWidth = 0
        button.backgroundColor = UIColor.init(red: 135/255, green: 180/255, blue: 255/255, alpha: 0)
        button.layer.borderColor = UIColor.init(red: 60/255, green: 90/255, blue: 150/255, alpha: 1).cgColor
        button.layer.cornerRadius = 5.0
        button.tintColor = UIColor.init(red: 60/255, green: 90/255, blue: 150/255, alpha: 1)
    }
}
