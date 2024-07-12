//
//  CEPResponse.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation

open class CEPResponse : Decodable {
    
    var cep: String?
    var complemento: String?
    var street: String?
    var number: String?
    var neighborhood: String?
    var city: String?
    var uf: String?
    var ibgeCity: String?
   
    
    enum CodingKeys: String, CodingKey {
        case cep
        case street = "logradouro"
        case complemento = "complemento"
        case number = "numero"
        case neighborhood = "bairro"
        case city = "localidade"
        case uf = "uf"
        case ibgeCity = "ibge"
 
    }
}
