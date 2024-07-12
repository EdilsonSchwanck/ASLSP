//
//  Address.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation

open class Address {
    
    var id: Int = 0
    var idOwner: Int = 0 //IdProprietario
    var idCompany: Int = 0 //IdEmpresa
    var CEP: String? = "" //CEP
    var address: String? = "" //Endereco
    var complement: String? = "" //Complemento
    var neighborhood: String? = "" //Bairro
    var idCity: Int = 0 //IdCidade
    var idState: Int = 0 //IdEstado
    var idCountry: Int = 0 //IdPais
    var state: State?
    var country: Country?
    var city: City?
    
}
