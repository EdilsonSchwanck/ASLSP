//
//  LoginResponse.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation

open class UserResponse: Decodable {
    
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
    var tipoUsuario: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case cpfcnpj = "cpfcnpj"
        case email = "email"
        case telefone = "telefone"
        case cep = "cep"
        case endereco = "endereco"
        case numero = "numero"
        case cidade = "cidade"
        case estado = "estado"
        case bairro = "bairro"
        case cadastroAprovado = "cadastroAprovado"
        case tipoUsuario = "tipoUsuario"
    }
    
}
