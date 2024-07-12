//
//  UserRegisterTypeEnum.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 20/06/23.
//

import Foundation
public enum UserRegisterType: Int {
    case NENHUM = 0
    case EMPRESA = 1
    case MOTORISTA = 2

    public var description: String {
        switch self {
            
            case .EMPRESA: return "Empresa"
            case .MOTORISTA: return "Motorista"
            case .NENHUM:  return "NENHUM"
        }
    }
}

extension Int {
    var typeUser: UserRegisterType {
        switch self {
            case 1: return .EMPRESA
            case 2: return .MOTORISTA
            default: return .NENHUM
        }
    }
        
}
