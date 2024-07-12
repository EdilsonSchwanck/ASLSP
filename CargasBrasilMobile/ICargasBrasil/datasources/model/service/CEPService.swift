//
//  CEPService.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation
import Alamofire

protocol CEPService {
    func execute(_ request : String, _ responseComplition : ResponseImpl<Cep>!) -> Void
}

open class CEPServiceImpl:  CEPService {
    
    private var responseComplition : ResponseImpl<Cep>!
    var urlRequest: String = "https://viacep.com.br/ws/"
    
    func execute(_ request: String, _ responseComplition: ResponseImpl<Cep>!) {
        self.responseComplition = responseComplition
        AF.request(urlRequest + request + "/json", method:.get, parameters: nil, encoding: URLEncoding.default)
            .validate()
            .responseDecodable(of: CEPResponse.self) { response in
                guard response.value != nil else {
                    self.responseComplition?(nil, false, "CEP não encontrado, tente novamente mais tarde.")
                    return
                }
                
                let cepResponse = response.value!
                if (cepResponse.cep == nil) {
                    self.responseComplition?(nil, false, "CEP não encontrado, tente novamente mais tarde.")
                } else {
                    let cep = cepResponse.toCEP()
                    self.responseComplition?(cep, true, "CEP carregado com sucesso.")
                }
        }
    }
}
