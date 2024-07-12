//
//  CountryResponse.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation

open class CountryResponse : Decodable {

    var id: Int = 0
    var name: String? = ""
    var acronym: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "IdPais"
        case name = "Nome"
        case acronym = "Sigla"
    }
}
