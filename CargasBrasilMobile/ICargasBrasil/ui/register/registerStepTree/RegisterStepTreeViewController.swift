//
//  RegisterStepTreeViewController.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 10/04/24.
//

import UIKit

class RegisterStepTreeViewController: BaseViewController {
    
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    
    
    var userRegisterType : UserRegisterType!
    var photoFront: UIImage!
    var photoBack: UIImage!
    var cpfCnpj: String = ""
    var nameUser: String = ""
    var phone: String = ""
    var email: String = ""
    var numberCNH: String = ""
    var categoryCNH: String = ""
    var placeVheicle: String = ""
    var modelVechicle: String = ""
    var cep: String = ""
    var endereco: String = ""
    var number: String = ""
    var city: String = ""
    var bairro = ""
    var estado = ""
    private var registerViewModel : RegisterViewModel = RegisterViewModel(LocationRepositoryImpl(), UserRepositoryImpl())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle("DADOS DE CADASTRO")
        self.textFieldPassword.enablePasswordToggle()
        self.textFieldConfirmPassword.enablePasswordToggle()
        
        
    }


    
    override func createRestListener() {
        self.registerViewModel.queryRegisterUser = { object, success, message in
            DispatchQueue.main.async {
                if(success){
                    let vc = FinishRegisterViewController(nibName: "FinishRegisterViewController", bundle: nil)
                    vc.userRegisterType = self.userRegisterType
                    self.navigationController?.pushViewController(vc, animated: true)
  
                    }
                }
            }
        }
    
    
    func validateValues() -> Bool {
        if(textFieldPassword.text != textFieldConfirmPassword.text){
            let alerta = Alerta(titulo: "Atenção", mensagem: "As senhas não estão diferentes")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        
        if(textFieldPassword.text!.count <= 4 && textFieldConfirmPassword.text!.count <= 4){
            let alerta = Alerta(titulo: "Atenção", mensagem: "As senha precisa conter mais que 4 caracter")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        
        return true
    }
    
    
    
    func postRegisterUser(){
        if(userRegisterType == UserRegisterType.MOTORISTA){
            
            let requestMotorista = RegisterUserRequest(nome: self.nameUser, cpfcnpj: self.cpfCnpj, email: self.email, telefone: self.phone, cep: self.cep, endereco: self.endereco, numero: self.number, cidade: self.city, bairro: self.bairro, estado: self.estado, numeroCNH: self.numberCNH, categoriaCNH: self.categoryCNH, fotoHabilitacao: SMImageUtil.stringBase64(fromImage: photoFront)!, modeloVeiculo: self.modelVechicle, placaVeiculo: self.placeVheicle, fotoDocumentoVeiculo: SMImageUtil.stringBase64(fromImage: photoBack)!, senha: self.textFieldConfirmPassword.text, cadastroAprovado: false, administrador: UserRegisterType.MOTORISTA.rawValue)
            self.registerViewModel.queryRegisterUser(request: requestMotorista)
            
        }else if (userRegisterType == UserRegisterType.EMPRESA){
            let requestMotorista = RegisterUserRequest(nome: self.nameUser, cpfcnpj: self.cpfCnpj, email: self.email, telefone: self.phone, cep: self.cep, endereco: self.endereco, numero: self.number, cidade: self.city, bairro: self.bairro, estado: self.estado, numeroCNH: nil, categoriaCNH: nil, fotoHabilitacao: nil, modeloVeiculo: nil, placaVeiculo: nil, fotoDocumentoVeiculo: nil, senha: self.textFieldConfirmPassword.text, cadastroAprovado: true, administrador: UserRegisterType.EMPRESA.rawValue)
            self.registerViewModel.queryRegisterUser(request: requestMotorista)
        }
        
        
    }
    
    
    @IBAction func didTouchRegister(_ sender: Any) {
        
        if(validateValues()){
            postRegisterUser()
        }
        

        
    }
    

}
