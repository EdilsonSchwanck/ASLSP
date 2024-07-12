//
//  UITextFildUtil.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
import UIKit

private var __maxLengths = [UITextField: Int]()

extension UITextField {
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: {
                button.setImage(#imageLiteral(resourceName: "iconfinder_ic_visibility") , for: .normal)
            }, completion: nil)
        } else{
            UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: {
                button.setImage(#imageLiteral(resourceName: "iconfinder_ic_visibility_off"), for: .normal)
            }, completion: nil)
        }
}

func enablePasswordToggle() {
    let button = UIButton(type: .custom)
    setPasswordToggleImage(button)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
    button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
    button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
    self.rightView = button
    self.rightViewMode = .always
}
    
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
    
    @IBInspectable var maxSize: Int {
        get {
            guard let l = __maxLengths[self] else {
               return 150
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = String(t!.prefix(maxSize))
    }
}


