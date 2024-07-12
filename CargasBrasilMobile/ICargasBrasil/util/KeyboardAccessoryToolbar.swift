//
//  KeyboardAccessoryToolbar.swift
//  ICargasBrasil
//
//  Created by Dev Wilson Fernandes on 21/06/23.
//

import Foundation
import UIKit

class KeyboardAccessoryToolbar: UIToolbar {
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        self.barStyle = .default
        self.isTranslucent = true
        self.tintColor = UIColor(named: "ColorKeyPad")

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.done))
//        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancel))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.items = [spaceButton, doneButton]

        self.isUserInteractionEnabled = true
        self.sizeToFit()
    }

    @objc func done() {
        // Tell the current first responder (the current text input) to resign.
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    @objc func cancel() {
        // Call "cancel" method on first object in the responder chain that implements it.
        UIApplication.shared.sendAction(#selector(cancel), to: nil, from: nil, for: nil)
    }
}
