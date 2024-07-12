//
//  AdvertsMapper.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 20/06/24.
//

import Foundation


open class AdvertsMapper :  MapperBase<AdvertsResponse, Adverts> {
    
    override func mapFromEntity(entity: AdvertsResponse) -> Adverts? {
        let to = Adverts()
        to.titulo = entity.titulo ?? ""
        to.descricao = entity.descricao ?? ""
        to.tipoDeVeiculo = entity.tipoDeVeiculo ?? ""
        to.valorDoFrete = entity.valorDoFrete ?? ""
        to.enderecoColeta = entity.enderecoColeta ?? ""
        to.enderecoEntrega = entity.enderecoEntrega ?? ""
        to.nomeEmpresa = entity.nomeEmpresa ?? ""
        to.phone = entity.phone ?? ""
        
        return to
    }
    
    override func mapToEntity(entity: Adverts) -> AdvertsResponse? {
        let to = AdvertsResponse()
        to.titulo = entity.titulo
        to.descricao = entity.descricao
        to.tipoDeVeiculo = entity.tipoDeVeiculo
        to.valorDoFrete = entity.valorDoFrete
        to.enderecoColeta = entity.enderecoColeta
        to.enderecoEntrega = entity.enderecoEntrega
        to.nomeEmpresa = entity.nomeEmpresa
        to.phone = entity.phone
        
        return to
        
    }
}

extension AdvertsResponse {
    func toAdverts() -> Adverts {
        return AdvertsMapper().mapFromEntity(entity: self)!
    }
}

extension Adverts {
    func toAdvertsResponse() -> AdvertsResponse {
        return AdvertsMapper().mapToEntity(entity: self)!
    }
}

extension Array where Element == Adverts {
    func toListAdverts() -> [AdvertsResponse] {
        return AdvertsMapper().mapToEntityList(array: self)
    }
}

extension Array where Element == AdvertsResponse {
    func toListAdvertsResponse() -> [Adverts] {
        return AdvertsMapper().mapFromEntityList(array: self)
    }
}
