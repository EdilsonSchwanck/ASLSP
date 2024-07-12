//
//  LoginViewController.swift
//  ICargasBrasil
//
//  Created by Dev Wilson Fernandes on 02/06/23.
//

import Foundation
import UIKit
import SwiftUI
import InputMask
import VMaskTextField




class LoginViewController: BaseViewController {
    
    
    @IBOutlet weak var labelRegister: UILabel!
    @IBOutlet weak var textFieldCPFCNPJ: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var switchConnectLogin: UISwitch!
    @IBOutlet weak var progressBar: UIActivityIndicatorView!
    
    
    var customMaskCpfCnpj: Mask!

    
    public var loginViewModel: LoginViewModel = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEventLabel()
        self.textFieldPassword.enablePasswordToggle()
        self.navigationItem.hidesBackButton = true
        
    }

    override func configComponents() {
        showDisplayInfoUser()
    }
    
    private func showDisplayInfoUser() {
        self.textFieldCPFCNPJ.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)

    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
         let originalText = textField.text?.onlyNumbers ?? ""
         if let text = textField.text, text.clearMaskCpfCnpf.count <= 11 {
              textField.text = originalText
              textField.applyFilterMask(mask: "NNN.NNN.NNN-NN", textField: textField)
         } else {
              textField.text = originalText
              textField.applyFilterMask(mask: "NN.NNN.NNN/NNNN-NN", textField: textField)
         }
       
    }
    
    func addEventLabel() {
         self.labelRegister.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.openRecoverPassword)))
        labelRegister.isUserInteractionEnabled = true
    }
    
    @objc func openRecoverPassword() {
        
        
      //  TypeUserViewController
        let vc = TypeUserViewController(nibName: "TypeUserViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        

    }
    
    
    
    func validateValues() -> Bool {
        
        
        if(self.textFieldCPFCNPJ.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor, preencha o campo CPF/CNPJ.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
           
            return false
        }
        
        if(self.textFieldPassword.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor, preencha o campo senha!")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            
            return false
        }
        
     
        
        return true
    }
    
    func postLogin(){
        self.progressBar.isHidden = false
        let request = LoginRequest(cpfcnpj: self.textFieldCPFCNPJ.text!.clearMaskCpfCnpf, password: self.textFieldPassword.text!)
        self.loginViewModel.querylogin(request: request)
    }
    
    
    override func createRestListener() {
        self.loginViewModel.queryAutenticatinUser = { object, success, message in
            DispatchQueue.main.async {
                self.progressBar.isHidden = true
                if(success){
                    if(object!.cadastroAprovado) {
                        
                        if (self.switchConnectLogin.isOn) {
                            UserDefaults.standard.setValue(object?.cpfcnpj, forKey: "DOCUMENT_USER")
                        } else {
                            UserDefaults.standard.removeObject(forKey: "DOCUMENT_USER")
                        }
        
                        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
                        self.navigationController?.pushViewController(vc, animated: true)
                    }else{
                        let alert = UIAlertController(title: "Atenção", message: "Seu Cadastro esta pendente", preferredStyle: .alert)
                           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                           self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    
    @IBAction func didTouchLogin(_ sender: Any) {
        
        if(validateValues()){
            self.postLogin()
        }
       
    }
    
}

