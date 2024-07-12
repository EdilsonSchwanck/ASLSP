//
//  Singleton.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 26/03/24.
//

import Foundation

final class Singleton {
    
    private init () { }
    
    static let shared = Singleton()

    
   
    let cargasBrasilConfig: CargasBrasilConfig = CargasBrasilConfig()
    


    
    
    var branches: Branches = Branches()
    
    
    var user: User? = User() {
        didSet {
            self.userLogged = true

            if (user != nil) {
                self.cargasBrasilConfig.updateSettings(user: user!)
            }
            
        }
    }
    
    public var userLogged: Bool {
        get {
            return UserDefaults.standard.bool(forKey: USER_LOGGED)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: USER_LOGGED)
        }
    }
    
   
}
