//
//  CEPMapper.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation

open class CEPMapper : MapperBase<CEPResponse, Cep> {
    
    override func mapToEntity(entity: Cep) -> CEPResponse? {
        let to = CEPResponse()
        to.cep = entity.cep ?? ""
        to.street = entity.street
        to.number = entity.number ?? ""
        to.neighborhood = entity.neighborhood
        to.city = entity.city
        to.uf = entity.uf
        to.ibgeCity = entity.ibgeCity
        return to
    }
    
    override func mapFromEntity(entity: CEPResponse) -> Cep? {
        let to = Cep()
        to.cep = entity.cep
        to.street = entity.street
        to.number = entity.number
        to.neighborhood = entity.neighborhood
        to.city = entity.city
        to.uf = entity.uf
        to.ibgeCity = entity.ibgeCity
        return to
    }
}


extension CEPResponse {
    func toCEP() -> Cep {
        return CEPMapper().mapFromEntity(entity: self)!
    }
}

extension Cep {
    func toCEPResponse() -> CEPResponse {
        return CEPMapper().mapToEntity(entity: self)!
    }
}
