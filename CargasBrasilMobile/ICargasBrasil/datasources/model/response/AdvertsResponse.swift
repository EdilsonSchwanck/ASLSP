//
//  AdvertsResponse.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 20/06/24.
//

import Foundation

open class AdvertsResponse: Decodable {
    
    
    var titulo: String? = ""
    var descricao: String? = ""
    var tipoDeVeiculo: String? = ""
    var valorDoFrete: String? = ""
    var enderecoColeta: String? = ""
    var enderecoEntrega: String? = ""
    var nomeEmpresa: String? = ""
    var phone: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case titulo = "titulo"
        case descricao = "descricao"
        case tipoDeVeiculo = "tipoDeVeiculo"
        case valorDoFrete = "valorDoFrete"
        case enderecoColeta = "enderecoColeta"
        case enderecoEntrega = "enderecoEntrega"
        case nomeEmpresa = "nomeEmpresa"
        case phone = "telefone"
        
        
    }
    
}
