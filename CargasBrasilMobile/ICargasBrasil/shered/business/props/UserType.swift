//
//  UserType.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 26/03/24.
//

import Foundation
public enum UserType: Int, CustomStringConvertible {
    
   
    case admin = 1
    case motorista = 2
    case empresa = 3
    
    
    public var description: String {
        switch self {
        case .admin: return "Admin"
        case .motorista: return "Motorista"
        case .empresa: return "Empresa"
        
        }
    }
}
