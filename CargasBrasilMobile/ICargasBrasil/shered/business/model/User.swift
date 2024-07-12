//
//  User.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 26/03/24.
//

import Foundation

open class User: NSObject {
    
    var id: Int = 0
    var name: String = ""
    var cpfcnpj: String = ""
    var email: String = ""
    var telefone: String = ""
    var cep: String = ""
    var endereco: String = ""
    var numero: String = ""
    var cidade: String = ""
    var estado: String = ""
    var bairro: String = ""
    var cadastroAprovado: Bool = false
    var tipoUsuario = UserType.motorista.rawValue
    
    
    open var type: UserType {
        get {
            return UserType(rawValue: self.tipoUsuario)!
        }
        
        set (type) {
            self.tipoUsuario = type.rawValue
        }
    }
    
}
