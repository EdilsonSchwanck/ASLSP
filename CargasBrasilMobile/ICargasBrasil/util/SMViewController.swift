//
//  SMViewController.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
import MBProgressHUD

open class SMViewController: UIViewController {
    
    /* MARK: PROPERTIE'S */
    var spinner: MBProgressHUD!
    
    deinit {
        print("DEALLOC \(self)")
    }
    
    
    /* MARK: METHOD'S */
    internal func showSpinnerActivity(_ title: String = "", _ clickEnable: Bool = false) {
        DispatchQueue.main.async { [unowned self] in
            self.spinner = MBProgressHUD.showAdded(to: self.view, animated: true)
            self.spinner.label.text = title
            self.spinner.isUserInteractionEnabled = clickEnable
            self.view.window?.isUserInteractionEnabled = clickEnable
//            UIApplication.shared.beginIgnoringInteractionEvents()
        }
    }
    
    internal func dismissSpinnerActivity() {
        DispatchQueue.main.async { [weak self] in
            if self?.spinner != nil {
                self?.spinner.hide(animated: true)
                self?.spinner.isUserInteractionEnabled = true
                self?.view.window?.isUserInteractionEnabled = true
//                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
    }
}


extension UIViewController {
    var window: UIWindow? {
        get {
            return UIApplication.shared.windows.filter({$0.isKeyWindow}).first
        }
    }
}
