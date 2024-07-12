//
//  CargasBrasilConfig.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 26/03/24.
//

import Foundation

open class CargasBrasilConfig: NSObject {
    
    private var configs: NSDictionary?
    
    var resourceName: String = ""
    open var webServiceUrl: String?
    open var buildVariant : String = ""
    open var cpfcnpj: String = ""
    
    override init() {
        super.init()
        guard let filePathCargas = Bundle.main.path(forResource: "appConfig", ofType: "plist"), let filePathCargas = NSDictionary(contentsOfFile: filePathCargas) else { return }
        self.configs = filePathCargas
        self.webServiceUrl = (self.configs?.object(forKey: "WS") as? NSString ?? "") as String
        self.buildVariant = (self.configs?.object(forKey: "BuildVariant") as? NSString ?? "") as String
    
       
    }

    
    public func updateSettings(user: User) {

        self.cpfcnpj    = user.cpfcnpj.isEmpty ? "" : user.cpfcnpj
       
    }
    
   
    public func clearSettings() {
        self.cpfcnpj = ""
  
        
    }
    
}
