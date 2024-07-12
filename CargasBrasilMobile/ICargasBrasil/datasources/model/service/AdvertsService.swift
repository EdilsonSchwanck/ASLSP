//
//  AdvertsService.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 20/06/24.
//

import Foundation
import Alamofire

protocol AdvertsService {
    func execute( _ responseComplition : ResponseImpl<[Adverts]>!) -> Void
}


open class AdvertsServiceImpl: AdvertsService {
    
    private var responseComplition : ResponseImpl<[Adverts]>!
    
    
    func execute(_ responseComplition: ResponseImpl<[Adverts]>!) {
        self.responseComplition = responseComplition
        
        AF.request(BuscarAnucio.ANUCIO, method:.get, encoding: URLEncoding.default)
            .validate()
            .responseDecodable(of: BaseResponse<[AdvertsResponse]>.self) { response in
                guard response.value != nil, response.value?.data != nil else {
                    self.responseComplition?(nil, false, response.value?.msm)
                    return
                }
                
                if(response.value!.success) {
                    self.responseComplition?(response.value!.data?.toListAdvertsResponse(), true, "Consulta realizado com sucesso.")
                } else {
                    self.responseComplition?(response.value!.data?.toListAdvertsResponse(), false, response.value!.msm ?? "Não foi possível realizar o cadastro, tente novamente mais tarde!")
                }
        }
    }
    
    
    
}
