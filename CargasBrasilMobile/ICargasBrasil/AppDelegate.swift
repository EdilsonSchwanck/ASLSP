//
//  AppDelegate.swift
//  ICargasBrasil
//
//  Created by Dev Wilson Fernandes on 02/06/23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.addCustomKeyPad()
        // Override point for customization after application launch.
        return true
    }
    
    private func addCustomKeyPad() {
        let accessoryView = KeyboardAccessoryToolbar()
        UITextField.appearance().inputAccessoryView = accessoryView
        UITextView.appearance().inputAccessoryView = accessoryView
    }
}



