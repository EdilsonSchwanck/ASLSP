//
//  Anucio.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/06/24.
//

import Foundation
import Alamofire

protocol AnucioService {
    func execute(_ request : AnucioRequest, _ responseComplition : ResponseImpl<BaseResponse<EmptyResponse>>!) -> Void
}

open class AnucioServiceImpl :  AnucioService {
    
   
    private var responseComplition : ResponseImpl<BaseResponse<EmptyResponse>>!

    func execute(_ request: AnucioRequest, _ responseComplition: ResponseImpl<BaseResponse<EmptyResponse>>!) {
      
        self.responseComplition = responseComplition
        
        AF.request(BuscarAnucio.REGISTER_ANUCIO, method:.post, parameters: request.toParans(), encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: BaseResponse<EmptyResponse>.self) { response in
                guard response.value != nil else {
                    self.responseComplition?(nil, false, response.value?.msm ?? "Não foi possível cadastrarmum anucio")
                    return
                }
                
                self.responseComplition?(response.value, response.value?.success ?? false, response.value?.msm)
        }
    }
}
