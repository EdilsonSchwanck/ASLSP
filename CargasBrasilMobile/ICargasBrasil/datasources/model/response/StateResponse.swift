//
//  StateResponse.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation
import RealmSwift

open class StateResponse : Decodable {

    var id: Int?
    var name: String?
    var acronym: String?
    var ibgeId: Int?
    var country: CountryResponse?
    
    enum CodingKeys: String, CodingKey {
        case id = "IdEstado"
        case name = "Nome"
        case ibgeId = "IBGE"
        case acronym = "Sigla"
        case country = "Pais"
    }
    
}
