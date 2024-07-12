//
//  UserRegisterType.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation

public enum UserRegisterType: Int {
    case NENHUM = 0
    case ADMIN = 1
    case MOTORISTA = 2
    case EMPRESA = 3
    
    
    public var description: String {
        switch self {
            case .ADMIN: return "Admin"
            case .MOTORISTA: return "Motorista"
            case .EMPRESA: return "Empresa"
            case .NENHUM:  return "NENHUM"
           
        }
    }
}

extension Int {
    var typeUser: UserRegisterType {
        switch self {
            case 1: return .ADMIN
            case 2: return .MOTORISTA
            case 3: return .EMPRESA

            default: return .NENHUM
        }
    }
        
}
