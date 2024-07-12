//
//  BaseViewController.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
import UIKit

open class BaseViewController: SMViewController {
    
    var appDelegate : AppDelegate?

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        }
        return .lightContent
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.setColor()
        self.configComponents()
        self.createRestListener()
        self.hideKeyboardWhenTappedAround()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tintToolbar()
    }
    
    func setTitle(_ title : String) {
        self.title = title
    }
    
    func hideToolbar(_ isHide : Bool) {
        hideToolbar(isHide, animated : false)
    }
    
    func hideToolbar(_ isHide : Bool, animated : Bool) {
        navigationController?.setNavigationBarHidden(isHide, animated: animated)
    }
    
    func hideToolbar(isHide : Bool) {
        self.navigationController?.isNavigationBarHidden = isHide
    }
    
    func tintToolbar() {
        if #available(iOS 13.0, *) {
            view.overrideUserInterfaceStyle = .light
        }
        
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate

            
            let nav = self.navigationController?.navigationBar
           // nav?.barTintColor = appDelegate?.appColors.colorToolbar
            nav?.barStyle = UIBarStyle.black
            nav?.tintColor = UIColor.black
            nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            setNeedsStatusBarAppearanceUpdate()
            
    }

    func setColor() {
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
    }
    
    func configComponents() {}
    
    func createRestListener() {}
    
    func hideKeyboardWhenTappedAround() {
         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
         tap.cancelsTouchesInView = false
         view?.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
         view?.endEditing(true)
    }
    
//    func showDiloagFreeAccess() {
//        DialogGenericYesNo.instance.withTitle(titleLabel: "Liberar Acesso")
//             .withMessage(msm: "Por motivos de segurança, para ter acesso a todas as funcionalidades do aplicativo você precisa confirmar seus dados.")
//            .withYesTextButton(label: "Confirmar meus dados")
//            .withHideCloseButton(hideButton: false)
//            .withHideNoButton(hideButton: true)
//            .withOnClickYesAction({
//                self.showForm()
//            })
//            .showAlert()
//    }
    
//    func showForm() {
//        let vc = CheckedUserViewController(nibName: "CheckedUserViewController", bundle: nil)
//        vc.typePassword = TypePassword.VALIDATION_IDENTITY
//        vc.cpfCnpj = Singleton.shared.user.cpf
//        vc.unblockApp = true
//        vc.validationUser = true
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
}
