//
//  OTP.swift
//  Aparto
//
//  Created by Asliddin Mahmudov on 9/24/21.
//

import UIKit


protocol OTPTextFieldDelegate: AnyObject {
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool)
}

class OTPTextField: UITextField {
    
    weak var myDelegate: OTPTextFieldDelegate?
    
    override func deleteBackward() {
        let wasEmpty = text == nil || text == ""
        super.deleteBackward()

        (delegate as? OTPTextFieldDelegate)?.textField(self, didDeleteBackwardAnd: wasEmpty)
            
    }
    
}
