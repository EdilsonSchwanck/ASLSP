//
//  RegisterUserService.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 11/04/24.
//

import Foundation
import Alamofire

protocol RegisterUserService {
    func execute(_ request : RegisterUserRequest, _ responseComplition : ResponseImpl<Bool>!) -> Void
}

open class RegisterUserServiceImpl : RegisterUserService {
    
    
    private var responseComplition: ResponseImpl<Bool>?
    
    
    func execute(_ request: RegisterUserRequest, _ responseComplition: ResponseImpl<Bool>!) {
        self.responseComplition = responseComplition

        AF.request(RegisterAPI.REGISTER, method:.post, parameters: request.toParans(), encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: BaseResponse<EmptyResponse>.self) { response in
                guard response.value != nil else {
                    self.responseComplition?(nil, false, "Não foi possível realizar o cadastro, tente novamente mais tarde!")
                    return
                }
                if(response.value!.success) {
                    self.responseComplition?(response.value!.success, true, "Cadastro realizado com sucesso.")
                } else {
                    self.responseComplition?(response.value!.success, false, response.value!.msm ?? "Não foi possível realizar o cadastro, tente novamente mais tarde!")
                }
        }
    }
    
    
}
