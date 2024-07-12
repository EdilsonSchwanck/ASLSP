//
//  loginViewModel.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation

class LoginViewModel : BaseViewModel {
    
    private var userAPI : UserRepository!
    var queryAutenticatinUser: BaseRequest<User>? = nil
    
    override init() {
        super.init()
        self.userAPI = UserRepositoryImpl()
    }
    
    func querylogin(request: LoginRequest) {
        DispatchQueue.main.async { [weak self] in
            self?.userAPI.login(request: request) { object, success, message in
                if (!success) {
                    self?.queryAutenticatinUser?(nil, false, message ?? "Não foi possível realizar o login, tente novamente mais tarde!")
                    return
                }
                self?.queryAutenticatinUser?(object, true, "Usuário autenticado com sucesso")
            }
        }
    }
}
