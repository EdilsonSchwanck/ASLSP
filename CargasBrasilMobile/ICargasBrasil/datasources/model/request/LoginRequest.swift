//
//  LoginRequest.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation

open class LoginRequest: Encodable{
    var cpfcnpj: String = ""
    var password: String = ""
   

    init(cpfcnpj: String, password: String ) {
        self.cpfcnpj = cpfcnpj
        self.password = password
     
    }
    
    enum CodingKeys: String, CodingKey{
        case cpfcnpj = "cpfcnpj"
        case password = "senha"
        
        
    }
    
}
