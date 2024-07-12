//
//  RegisterRequest.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 11/04/24.
//

import Foundation

open class RegisterUserRequest: Encodable {
    
    var nome: String?
    var cpfcnpj: String?
    var email: String?
    var telefone: String?
    var cep: String?
    var endereco: String?
    var numero: String?
    var cidade: String?
    var bairro: String?
    var estado: String?
    var numeroCNH: String?
    var categoriaCNH: String?
    var fotoHabilitacao: String?
    var modeloVeiculo: String?
    var placaVeiculo: String?
    var fotoDocumentoVeiculo : String?
    var senha: String?
    var cadastroAprovado: Bool = false
    var administrador: Int = 0
    
    
    init(nome: String?, cpfcnpj: String?, email: String?, telefone: String?, cep: String?, endereco: String?, numero: String?, cidade: String?, bairro: String?, estado: String?, numeroCNH: String?, categoriaCNH: String?, fotoHabilitacao: String?, modeloVeiculo: String?, placaVeiculo: String?, fotoDocumentoVeiculo: String?, senha: String?, cadastroAprovado: Bool?, administrador: Int?) {
        self.nome = nome
        self.cpfcnpj = cpfcnpj
        self.email = email
        self.telefone = telefone
        self.cep = cep
        self.endereco = endereco
        self.numero = numero
        self.cidade = cidade
        self.bairro = bairro
        self.estado = estado
        self.numeroCNH = numeroCNH
        self.categoriaCNH = categoriaCNH
        self.fotoHabilitacao = fotoHabilitacao
        self.modeloVeiculo = modeloVeiculo
        self.placaVeiculo = placaVeiculo
        self.fotoDocumentoVeiculo = fotoDocumentoVeiculo
        self.senha = senha
        self.cadastroAprovado = cadastroAprovado ?? false
        self.administrador = administrador ?? 2
    }
    
    enum CodingKeys: String, CodingKey{
        case nome = "nome"
        case cpfcnpj = "cpfcnpj"
        case email = "email"
        case telefone = "telefone"
        case cep = "cep"
        case endereco = "endereco"
        case numero = "numero"
        case cidade = "cidade"
        case bairro = "bairro"
        case estado = "estado"
        case numeroCNH = "numeroCNH"
        case categoriaCNH = "categoriaCNH"
        case fotoHabilitacao = "fotoHabilitacao"
        case modeloVeiculo = "modeloVeiculo"
        case placaVeiculo = "placaVeiculo"
        case fotoDocumentoVeiculo = "fotoDocumentoVeiculo"
        case senha = "senha"
        case cadastroAprovado = "cadastroAprovado"
        case administrador = "administrador"
    }
}
