//
//  UITextViewAdditions.swift
//  FB
//
//  Created by Vardges Gasparyan on 2020-07-08.
//  Copyright © 2020 Vardges Gasparyan. All rights reserved.
//

import UIKit

extension UITextField {

    func addDoneButton(title: String, target: Any, selector: Selector) {

        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 40.0))//1

        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2

        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)//3

        toolBar.setItems([flexible, barButton], animated: false)//4

        self.inputAccessoryView = toolBar//5
    }
}
