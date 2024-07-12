//
//  CityResponse.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation

open class CityResponse : Decodable {
    
    var id: Int?
    var name: String?
    var ibgeId: Int?
    var latitude: Double?
    var longitude: Double?
    var stateId: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "IdCidade"
        case name = "Nome"
        case ibgeId = "IBGE"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case stateId = "IdEstado"
    }
    
    public required convenience init(fromJSONDictionary dictionary: NSDictionary) {
        self.init()
        self.id         = dictionary.object(forKey: "IdCidade") as? Int ?? 0
        self.ibgeId     = dictionary.object(forKey: "IBGE") as? Int ?? 0
        self.latitude   = dictionary.object(forKey: "Latitude") as? Double ?? 0.0
        self.longitude  = dictionary.object(forKey: "Longitude") as? Double ?? 0.0
        self.name       = dictionary.object(forKey: "Nome") as? String ?? ""
        self.stateId    = dictionary.object(forKey: "IdEstado") as? Int ?? 0
    }

}

