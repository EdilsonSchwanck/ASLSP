//
//  ViewController.swift
//  ICargasBrasil
//
//  Created by Dev Wilson Fernandes on 02/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let when = DispatchTime.now() + 1.0
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.showViewLogin()
        }
    }
    
    private func showViewLogin() {
        
        var viewController: UIViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        var document = UserDefaults.standard.string(forKey: "DOCUMENT_USER")
        if (document != nil) {
            var userCache = UserCache.loadByDocument(document!)
            if (userCache != nil) {
                var user = userCache?.toUser()
                Singleton.shared.user = user!
                Singleton.shared.cargasBrasilConfig.updateSettings(user: user!)
                
                viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
            }
        }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let navigationController = UINavigationController(rootViewController: viewController)
        appDelegate.window!.rootViewController = navigationController
        appDelegate.window!.makeKeyAndVisible()
        UIView.transition(with: appDelegate.window!,
                             duration: 0.5,
                             options: .transitionCrossDissolve,
                             animations: nil,
                             completion: nil)

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
//        if #available(iOS 13.0, *) {
//            return .darkContent
//        }
        return .lightContent
    }

}

