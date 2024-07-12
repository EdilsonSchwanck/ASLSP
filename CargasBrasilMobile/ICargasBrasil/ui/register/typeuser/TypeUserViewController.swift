//
//  TypeUserViewController.swift
//  MHWL
//
//  Created by Matias Borges Evalte on 04/05/22.
//  Copyright © 2022 SistemaInfo. All rights reserved.
//

import Foundation
import  UIKit


@objc public protocol CallbackRegisterUser{
    func showRegisterView(_ userRegisterType : Int)
}

class TypeUserViewController: BaseViewController {
    
    @IBOutlet weak var btnOwner: UIButton!
    @IBOutlet weak var btnDrive: UIButton!
    
    @IBOutlet weak var viewDivI: UIView!
    @IBOutlet weak var viewDivII: UIView!
    @IBOutlet weak var viewDivIII: UIView!
    
    @IBOutlet weak var lblRegisterOwner: UILabel!
    @IBOutlet weak var lblRegisterDrive: UILabel!
    
    @IBOutlet weak var arrowI: UIImageView!
    @IBOutlet weak var arrowII: UIImageView!
    @IBOutlet weak var lblMsm: UILabel!
    
    var cpfCnpj : String = ""
    
    var callbackRegisterUser : CallbackRegisterUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle("SOLICITAR ACESSO")
    }
    
   
    
    @IBAction func eventRegisterOwner(_ sender: Any) {
        showRegisterView(userType : UserRegisterType.EMPRESA)
    }
    
    @IBAction func eventRegisterDrive(_ sender: Any) {
        showRegisterView(userType : UserRegisterType.MOTORISTA)
    }
    
    func showRegisterView(userType : UserRegisterType) {
        
        let vc = RegisterStepOneViewController(nibName: "RegisterStepOneViewController", bundle: nil)
        vc.userRegisterType = userType
     
        self.navigationController?.pushViewController(vc, animated: true)
        
//        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
//        self.callbackRegisterUser?.showRegisterView(userType.rawValue)
    }
    
}
