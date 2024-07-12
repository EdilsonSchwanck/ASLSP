//
//  RegisterViewModel.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation

class RegisterViewModel : BaseViewModel {
    
    private var locationRepository : LocationRepository!
    private var userAPI : UserRepository!
    var queryCEP: BaseRequest<Cep>? = nil
    var queryRegisterUser: BaseRequest<Bool>? = nil
    
    
    
    init(_ locationRepository : LocationRepository, _ userRepository : UserRepository) {
        super.init()
        self.locationRepository = locationRepository
        self.userAPI = userRepository
    }
    
    
    func queryCep(cep : String) {
        DispatchQueue.main.async { [weak self] in
            self?.locationRepository.searchCEP(cep: cep) { object, success, message in
                if (success) {
                    self?.queryCEP?(object, true, message)
                } else {
                    self?.queryCEP?(nil, false, message)
                }
            }
        }
    }
    
    func queryRegisterUser(request: RegisterUserRequest){
        DispatchQueue.main.async { [weak self] in
            self?.userAPI.registerUser(request: request){ object, success, message in
                if(success){
                    self?.queryRegisterUser?(object, true, message ?? "Cadastro realizado com sucesso")
                }else{
                    self?.queryRegisterUser?(nil, false, message ?? "Não foi possivel realizar o cadastro")
                }
            }
            
        }
    }
    
}
