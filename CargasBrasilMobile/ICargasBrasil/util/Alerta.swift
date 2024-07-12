//
//  Alerta.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 11/04/24.
//

import Foundation
import UIKit

class Alerta {
     
    var titulo: String = ""
    var mensagem: String = ""
    
    init(titulo: String, mensagem: String){
        self.titulo = titulo
        self.mensagem = mensagem
    }
    
    func getAlerta() -> UIAlertController{
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acaoCancelar = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(acaoCancelar)
        return alerta
    }
    
}
