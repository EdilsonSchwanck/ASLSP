//
//  AdvertsResponse.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 20/06/24.
//

import Foundation

protocol AdvertsRepository {
    func adverts(_ completion: @escaping ResponseImpl<[Adverts]>)
    func anucio(request: AnucioRequest, _ completion: @escaping ResponseImpl<BaseResponse<EmptyResponse>>)
}

class AdvertsRepositoryImpl : AdvertsRepository {
   
    
    private var advertsService : AdvertsService!
    private var anucioService : AnucioService!
    
    func adverts(_ completion: @escaping ResponseImpl<[Adverts]>) {
        guard Reachability.isConnectedToNetwork() else{
            completion(nil, false, "Não foi possível realizar o login, verifique sua conexão com a internet e tente novamente!")
            return
        }
        
        advertsService = AdvertsServiceImpl()
        advertsService.execute(completion)
    }
    
    
    
    func anucio(request: AnucioRequest, _ completion: @escaping ResponseImpl<BaseResponse<EmptyResponse>>) {
        guard Reachability.isConnectedToNetwork() else{
            completion(nil, false, "Não foi possível realizar o login, verifique sua conexão com a internet e tente novamente!")
            return
        }
        
        anucioService = AnucioServiceImpl()
        anucioService.execute(request, completion)
    }
    
    
    
    
    
    
}
