//
//  LoginService.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
import Alamofire

protocol LoginService {
    func execute(_ request : LoginRequest, _ responseComplition : ResponseImpl<User>!) -> Void
}

open class LoginServiceImpl: LoginService {
    

    private var responseComplition : ResponseImpl<User>!
   
    func execute(_ request: LoginRequest, _ responseComplition: ResponseImpl<User>!) {
        self.responseComplition = responseComplition
    
        AF.request(LoginAPI.LOGIN, method:.post, parameters: request.toParans(), encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: BaseResponse<UserResponse>.self) { response in
                guard response.value != nil else {
                    self.responseComplition?(nil, false, "Não foi possível realizar o login, tente novamente mais tarde")
                    return
                }
                
                if(response.value!.data != nil) {
                    let userResponse = response.value!.data!.toUser()
                    Singleton.shared.user = userResponse
                    Singleton.shared.cargasBrasilConfig.updateSettings(user: userResponse)
                    _ = UserCache.save((userResponse.toUserCache()))
                    
                    self.responseComplition?(userResponse, true, "Usuário carregado com sucesso")
                } else {
                    self.responseComplition?(nil, false, response.value!.msm ?? "Não foi possível realizar o login, tente novamente mais tarde")
                }
        }
    }
}



