//
//  UserRepository.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation

protocol UserRepository {
    func login(request : LoginRequest, _ completion: @escaping ResponseImpl<User>)
    func registerUser(request : RegisterUserRequest, _ completion: @escaping ResponseImpl<Bool>)
    
}

class UserRepositoryImpl : UserRepository {

    
    
    private var loginService : LoginService!
    private var registerService : RegisterUserService!
    
    func login(request: LoginRequest, _ completion: @escaping ResponseImpl<User>) {
        guard Reachability.isConnectedToNetwork() else{
            completion(nil, false, "Não foi possível realizar o login, verifique sua conexão com a internet e tente novamente!")
            return
        }
        
        loginService = LoginServiceImpl()
        loginService.execute(request, completion)
    }
    
    func registerUser(request: RegisterUserRequest, _ completion: @escaping ResponseImpl<Bool>) {
        guard Reachability.isConnectedToNetwork() else{
            completion(nil, false, "Não foi possível cadastrar usuario, verifique sua conexão com a internet e tente novamente!")
            return
        }
        registerService = RegisterUserServiceImpl()
        registerService.execute(request, completion)
    }
    
    
}
