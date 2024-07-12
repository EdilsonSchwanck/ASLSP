//
//  AnucioRequest.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/06/24.
//

import Foundation

open class AnucioRequest: Encodable{
    var titulo: String = ""
    var descricao: String = ""
    var tipoDeVeiculo: String = ""
    var valorDoFrete: String = ""
    var enderecoColeta: String = ""
    var enderecoEntrega: String = ""
    var telefone: String = ""
    var nomeEmpresa: String = ""
   

    init(titulo: String, descricao: String, tipoDeVeiculo: String, valorDoFrete: String, enderecoColeta: String, enderecoEntrega: String, telefone: String, nomeEmpresa:String) {
        self.titulo = titulo
        self.descricao = descricao
        self.tipoDeVeiculo = tipoDeVeiculo
        self.valorDoFrete = valorDoFrete
        self.enderecoColeta = enderecoColeta
        self.enderecoEntrega = enderecoEntrega
        self.telefone = telefone
        self.nomeEmpresa = nomeEmpresa
        
     
    }
    
    enum CodingKeys: String, CodingKey{
        case titulo = "titulo"
        case descricao = "descricao"
        case tipoDeVeiculo = "tipoDeVeiculo"
        case valorDoFrete = "valorDoFrete"
        case enderecoColeta = "enderecoColeta"
        case enderecoEntrega = "enderecoEntrega"
        case telefone = "telefone"
        case nomeEmpresa = "nomeEmpresa"
        
        
    }
    
}
