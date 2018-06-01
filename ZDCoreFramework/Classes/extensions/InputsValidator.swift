//
//  InputsValidator.swift
//  Mojaz
//
//  Created by Mojaz on 5/2/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit

extension UITextField {
    var empty: Bool {
        return self.text!.isEmpty
    }

    var textIsEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.text!)
    }
}
