//
//  LocationRepository.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation

protocol LocationRepository {
  
    func searchCEP(cep : String, _ completion: @escaping ResponseImpl<Cep>)
}

class LocationRepositoryImpl : LocationRepository {
    
    private var cepService : CEPService!
    
  
    func searchCEP(cep: String, _ completion: @escaping ResponseImpl<Cep>) {
        guard Reachability.isConnectedToNetwork() else{
            completion(nil, false, "Não foi possível buscar o CEP, verifique sua conexão com a internet e tente novamente!")
            return
        }
        cepService = CEPServiceImpl()
        cepService.execute(cep, completion)
    }
    
    
    
}
