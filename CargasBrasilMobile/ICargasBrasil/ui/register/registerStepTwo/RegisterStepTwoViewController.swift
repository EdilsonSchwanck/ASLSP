//
//  RegisterStepTwoViewController.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import UIKit
import MBProgressHUD


class RegisterStepTwoViewController: BaseViewController {
    
    @IBOutlet weak var smTextFieldValidateZipCode: UITextField!
    @IBOutlet weak var smTextFieldValidateAddress: UITextField!
    @IBOutlet weak var smTextFieldValidateNumber: UITextField!
    @IBOutlet weak var smTextFieldCity: UITextField!
    @IBOutlet weak var smTextFieldState: UITextField!
    @IBOutlet weak var smTextFieldValidateNeighborhood: UITextField!
    
    
    
    
    private var registerViewModel : RegisterViewModel!
    private var isSHowHUD: Bool = true
    private var spinnerActivity: MBProgressHUD!
    private var zipValid: Bool = false
    private var receiveZipCode: String!
    public weak var user: User!
    
    
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
    
   

    override func viewDidLoad() {
        self.registerViewModel = RegisterViewModel(LocationRepositoryImpl(), UserRepositoryImpl())
        super.viewDidLoad()
        self.setTitle("DADOS DE CADASTRO")
        
        
        self.smTextFieldValidateZipCode.addTarget(self, action: #selector(zipcodeTextFieldChanged(_:)), for: UIControl.Event.editingChanged)
       
 
    }
    

    @objc func zipcodeTextFieldChanged(_ textField: UITextField) {
        let originalText = textField.text?.onlyNumbers ?? ""
        textField.text = originalText
        textField.applyFilterMask(mask: "NNNNN-NNN", textField: textField)
        self.zipValid = self.isValidZipCode(zipcode: self.smTextFieldValidateZipCode.text!)
    }
    
    
    
    func isValidZipCode(zipcode: String) -> Bool! {
        if zipcode.count >= 9 {
            var zipCode = zipcode
            zipCode.removeAll { $0 == "-" || $0 == " " }
            
            if Reachability.isConnectedToNetwork() {
                self.showActivity()
                
                self.receiveZipCode = zipCode
                self.registerViewModel.queryCep(cep: self.receiveZipCode)
                
            } else {
                let alert = UIAlertController(title: "Atenção", message: "Sem conexão com a internet", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
               
            }
            return true
        } else {
            self.clearTextField()
        }
        return false
    }
    
    func clearTextField() {
        self.smTextFieldValidateAddress.text = ""
        self.smTextFieldValidateNeighborhood.text = ""
     
    }
    
    func showDisplayStateByCep(_ cep : Cep) {
        guard let uf = cep.uf else { return }
        if !uf.isEmpty {
            self.smTextFieldState.text = uf
        } else {
            self.zipValid = false
        }
        self.hideActivity()
    }
    

    func showDisplayCityByCep(_ cep : Cep) {
        guard let cityName = cep.city else {
            return
        }
        self.smTextFieldCity.text = cityName
  
    }
    
    
    
    func showDisplayAdressByCep(_ cep : Cep) {
        self.smTextFieldValidateAddress.text = cep.street ?? ""
        self.smTextFieldValidateNeighborhood.text = cep.neighborhood ?? ""
    }
    
    
    func showActivity() {
        if isSHowHUD {
            self.spinnerActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
            self.spinnerActivity.label.text = "Verificando CEP"
            self.view.window?.isUserInteractionEnabled = false
            self.spinnerActivity.isUserInteractionEnabled = false
            self.isSHowHUD = false
        }
    }
    
    func hideActivity() {
        if self.spinnerActivity != nil {
            self.isSHowHUD = true
            self.view.window?.isUserInteractionEnabled = true
            self.spinnerActivity.hide(animated: true)
        }
    }
    

    override func createRestListener() {

        registerViewModel?.queryCEP = { object, success, message in
            DispatchQueue.main.async {
                guard success else {
                    self.hideActivity()
                 
                    let alert = UIAlertController(title: "Atenção", message: message ?? "Erro na busca", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                       self.present(alert, animated: true, completion: nil)
                    return
                }
                
                self.showDisplayAdressByCep(object!)
                self.showDisplayCityByCep(object!)
                self.showDisplayStateByCep(object!)
            }
        }
        
   
    }
    func validateValues() -> Bool {
        if(smTextFieldValidateZipCode.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo cep.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        if(smTextFieldValidateAddress.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo endereço.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        if(smTextFieldValidateNumber.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo numero.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        
        if(smTextFieldCity.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo cidade.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        if(smTextFieldState.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo estado.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        
        if(smTextFieldValidateNeighborhood.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo bairo.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        
        
        return true
    }
    
    
    @IBAction func didTouchNext(_ sender: Any) {
        
        if(validateValues()){
            let vc = RegisterStepTreeViewController(nibName: "RegisterStepTreeViewController", bundle: nil)
            vc.userRegisterType = userRegisterType
            vc.photoFront = photoFront
            vc.photoBack = photoBack
            vc.cpfCnpj = cpfCnpj
            vc.nameUser = nameUser
            vc.phone = phone
            vc.email = email
            vc.numberCNH = numberCNH
            vc.placeVheicle = placeVheicle
            vc.cep = smTextFieldValidateZipCode.text!
            vc.endereco = smTextFieldValidateAddress.text!
            vc.number = smTextFieldValidateNumber.text!
            vc.city = smTextFieldCity.text!
            vc.bairro = smTextFieldValidateNeighborhood.text!
            vc.estado = smTextFieldState.text!
            vc.modelVechicle = modelVechicle
            vc.categoryCNH = categoryCNH
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    

}
