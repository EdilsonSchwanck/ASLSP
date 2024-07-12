//
//  FinishRegisterViewController.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 11/04/24.
//

import UIKit

class FinishRegisterViewController: UIViewController {
    
    
    @IBOutlet weak var labelMensagem: UILabel!
    
    
    
    var userRegisterType : UserRegisterType!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    func verificationTyperUser(){
        if(self.userRegisterType ==  UserRegisterType.EMPRESA){
            self.labelMensagem.text = "Cadastro Realizado com sucesso! Agora você ja pode realizar o login e acessar todas funcionalidades do app!"
        }
    }
    
    
    

   
    @IBAction func didTouchLogin(_ sender: Any) {
        
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    
}
