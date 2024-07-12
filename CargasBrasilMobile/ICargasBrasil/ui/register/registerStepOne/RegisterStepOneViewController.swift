//
//  RegisterStepOneViewController.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 02/04/24.
//

import UIKit

class RegisterStepOneViewController: CaptureImageViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var TextFieldCpfCnpj: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldNumberCNH: UITextField!
    @IBOutlet weak var textFieldCategoryCNH: UITextField!
    @IBOutlet weak var textFieldModelVechicle: UITextField!
    
    @IBOutlet weak var viewNumberCNH: UIView!
    @IBOutlet weak var viewCategoryCNH: UIView!
    
    
    @IBOutlet weak var textFieldPlateVeichle: UITextField!
    
    
    @IBOutlet weak var viewButtonVerse: UIView!
    @IBOutlet weak var imageViewBack: UIImageView!
    
    
    @IBOutlet weak var viewButtonFront: UIView!
    @IBOutlet weak var imageViewFront: UIImageView!
    
    
    @IBOutlet weak var stackViewPhoto: UIStackView!
    
    var typeCNH = ["A", "B", "C", "D", "E", "AB", "AC", "AD", "AE"]
    
    private var photoFront: UIImage!
    private var photoBack: UIImage!
    
    var userRegisterType : UserRegisterType!
    private var typeImage : ImageType = ImageType.FRONT
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.setTitle("DADOS DE CADASTRO")
        
        self.configFieldsByUserType()
        self.createTargetTextField()
        createPickerView()
        dismissPickerView()

        print("Tipo selecionado \(String(describing: userRegisterType))")
    }


    
    override func configComponents() {
        let onClickFront = UITapGestureRecognizer(target: self, action: #selector(onClickFrontImage))
        viewButtonFront.addGestureRecognizer(onClickFront)
        
        let onClickBack = UITapGestureRecognizer(target: self, action: #selector(onClickBackImage))
        viewButtonVerse.addGestureRecognizer(onClickBack)
    }
    
    
    
    
    @objc func onClickFrontImage() {
        openCamera(ImageType.FRONT)
    }
    
    @objc func onClickBackImage() {
        openCamera(ImageType.BACK)
    }
    
    func openCamera(_ imageType : ImageType) {
        self.typeImage = imageType
        #if targetEnvironment(simulator)
            openGallery()
        #else
            openCamera()
        #endif
    }
    
    override func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        super.imagePickerController(picker, didFinishPickingMediaWithInfo: info)
        if(typeImage == ImageType.FRONT) {
            self.photoFront = imageRead
          
            imageViewFront.image = imageRead
        } else {
            self.photoBack = imageRead
            imageViewBack.image = imageRead
        }
        
       
        
       // checkImage()
    }
    
    
    
    func createTargetTextField() {
        if (userRegisterType == UserRegisterType.MOTORISTA){
            self.TextFieldCpfCnpj.addTarget(self, action: #selector(self.textFieldDidChangeCPF(_:)), for: .editingChanged)
        }else{
            self.TextFieldCpfCnpj.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
        
        self.textFieldPhone.addTarget(self, action: #selector(self.textFieldFoneDidChange(_:)), for: .editingChanged)
        
    }
    
    @objc func textFieldFoneDidChange(_ textField: UITextField) {
           let originalText = textField.text?.onlyNumbers ?? ""
           textField.text = originalText
           textField.applyFilterMask(mask: "(NN) N NNNN-NNNN", textField: textField)
       }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        let originalText = textField.text?.onlyNumbers ?? ""
        textField.text = originalText
        textField.applyFilterMask(mask: "NN.NNN.NNN/NNNN-NN", textField: textField)
    }
    
    
    @objc func textFieldDidChangeCPF(_ textField: UITextField){
        let originalText = textField.text?.onlyNumbers ?? ""
        textField.text = originalText
        textField.applyFilterMask(mask: "NNN.NNN.NNN-NN", textField: textField)
    }
    
    
    
    func configFieldsByUserType() {
        
        if (userRegisterType == UserRegisterType.MOTORISTA) {
            self.TextFieldCpfCnpj.placeholder = "CPF"
//            self.TextFieldCpfCnpj.isHidden = false
//            self.TextFieldCpfCnpj.isHidden = false
          
        } else {
            self.TextFieldCpfCnpj.placeholder = "CNPJ"
            self.textFieldName.placeholder = "Nome Empresa"
            self.viewNumberCNH.isHidden = true
            self.viewCategoryCNH.isHidden = true
            self.stackViewPhoto.isHidden = true
            
            
        }
    }
    
    @objc func action() {
        view.endEditing(true)
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        textFieldCategoryCNH.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Confirmar", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        textFieldCategoryCNH.inputAccessoryView = toolBar
    }
    
    func userType() -> Bool {
        if(userRegisterType == UserRegisterType.EMPRESA){
            return false
        }
        return true
    }
    
    
    func validateValues() -> Bool {
        if(TextFieldCpfCnpj.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor, preencha o campo CPF/CNPJ.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        if(textFieldName.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo nome.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        
        if(textFieldPhone.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo Telefone.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        
        if(textFieldEmail.text!.isEmpty){
            let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo Telefone.")
            self.present(alerta.getAlerta(), animated: true, completion: nil)
            return false
        }
        
        if(userType()){
            if(textFieldNumberCNH.text!.isEmpty){
                let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo Numero CNH.")
                self.present(alerta.getAlerta(), animated: true, completion: nil)
                return false
            }
            
            if(textFieldCategoryCNH.text!.isEmpty){
                let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo categoria CNH.")
                self.present(alerta.getAlerta(), animated: true, completion: nil)
                return false
            }
            if(textFieldPlateVeichle.text!.isEmpty){
                let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo modelo veiculo.")
                self.present(alerta.getAlerta(), animated: true, completion: nil)
                return false
            }
            if(textFieldPlateVeichle.text!.isEmpty){
                let alerta = Alerta(titulo: "Atenção", mensagem: "Por favor pencha o campo placa veiculo.")
                self.present(alerta.getAlerta(), animated: true, completion: nil)
                return false
            }
            return true
        }

        
        return true
    }
    
    
    @IBAction func didTouchNext(_ sender: Any) {
        if (validateValues()){
            let vc = RegisterStepTwoViewController(nibName: "RegisterStepTwoViewController", bundle: nil)
            vc.userRegisterType = userRegisterType
            vc.cpfCnpj = TextFieldCpfCnpj.text!.clearMaskCpfCnpf
            vc.nameUser = textFieldName.text!
            vc.phone = textFieldPhone.text!.clearMaskPhone
            vc.email = textFieldEmail.text!
            vc.numberCNH = textFieldNumberCNH.text ?? ""
            vc.categoryCNH = textFieldCategoryCNH.text ?? ""
            vc.placeVheicle = textFieldPlateVeichle.text ?? ""
            vc.modelVechicle = textFieldModelVechicle.text ?? ""
            vc.photoFront = photoFront
            vc.photoBack = photoBack
            self.navigationController?.pushViewController(vc, animated: true)
        }  
       
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // number of session
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(typeCNH.count)
        return typeCNH.count // number of dropdown items
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeCNH[row] // dropdown item
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCountry = typeCNH[row] // selected item
        textFieldCategoryCNH.text = selectedCountry
    }

}
