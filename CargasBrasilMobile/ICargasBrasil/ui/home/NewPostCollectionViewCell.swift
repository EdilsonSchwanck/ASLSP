//
//  NewPostCollectionViewCell.swift
//  ICargasBrasil
//
//  Created by Isabela Da Silva Cardoso on 08/05/24.
//

import UIKit

class NewPostCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var textFieldTitulo: UITextField!
    @IBOutlet weak var texttFieldDescricao: UITextField!
    @IBOutlet weak var textFieldTipoVeiculo: UITextField!
    @IBOutlet weak var textFieldValorFrete: UITextField!
    @IBOutlet weak var textFieldEnderecoColeta: UITextField!
    @IBOutlet weak var textFieldEnderecoEntrega: UITextField!
    @IBOutlet weak var textFieldTelefone: UITextField!
    @IBOutlet weak var textFieldNomeEmpresa: UITextField!
    @IBOutlet weak var progressBar: UIActivityIndicatorView!
    
    
    
    public var newPostCollectionViewModel: NewPostCollectionViewModel = NewPostCollectionViewModel()

    override func awakeFromNib() {
        super.awakeFromNib()
        createRestListener()
        self.progressBar.isHidden = true
       
    }
    
    
    func postLogin(){
        self.progressBar.isHidden = false
        let request = AnucioRequest(titulo: self.textFieldTitulo.text!, descricao: self.texttFieldDescricao.text!, tipoDeVeiculo: self.textFieldTipoVeiculo.text!, valorDoFrete: self.textFieldValorFrete.text!, enderecoColeta: self.textFieldEnderecoColeta.text!, enderecoEntrega: self.textFieldEnderecoEntrega.text!, telefone: self.textFieldTelefone.text!, nomeEmpresa: self.textFieldNomeEmpresa.text!)
        self.newPostCollectionViewModel.queryAnucio(request: request)
    }
    
    
    
    func createRestListener() {
        self.newPostCollectionViewModel.queryAutenticatinAnucio = { object, success, message in
            DispatchQueue.main.async {
                self.progressBar.isHidden = true
                if(success){
                   // apresentar uma mensagem que deu sucesso na hora de cadastrar
                }
            }
        }
    }
    
    
    @IBAction func didTouchAnucio(_ sender: Any) {
        self.postLogin()
    }
    
    
    

}
