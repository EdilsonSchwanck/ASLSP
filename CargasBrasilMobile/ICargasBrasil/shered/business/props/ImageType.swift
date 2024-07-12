//
//  ImageType.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation

public enum ImageType: Int {
    case FRONT = 0
    case BACK = 1
    case SELFIE = 2
    
    public var description: String {
        switch self {
            case .FRONT: return "Frente"
            case .BACK: return "Verso"
            case .SELFIE: return "Selfie"
        }
    }
}
