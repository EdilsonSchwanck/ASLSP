//
//  BaseViewModel.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation

open class BaseViewModel : NSObject {
    
    public override init() {
        super.init()
        self.mapApi()
        self.mapRepository()
    }
    
    func mapRepository() {}
    func mapApi() {}
    
}
