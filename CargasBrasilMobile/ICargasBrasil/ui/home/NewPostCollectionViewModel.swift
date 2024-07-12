//
//  NewPostCollectionViewModel.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/06/24.
//

import Foundation

class NewPostCollectionViewModel: BaseViewModel {
    
    private var advertsAPI : AdvertsRepository!
    var queryAutenticatinAnucio: BaseRequest<EmptyResponse>? = nil
    
    override init() {
        super.init()
        self.advertsAPI = AdvertsRepositoryImpl()
    }
    
    
    
    func queryAnucio(request: AnucioRequest) {
        self.advertsAPI.anucio(request: request){ object, success, message in
            DispatchQueue.main.async { [weak self] in
                if (!success) {
                    self?.queryAutenticatinAnucio?(nil, false, message ?? "Não foi possível realizar o anucio")
                    return
                }
                self?.queryAutenticatinAnucio?(nil, true, "Usuário autenticado com sucesso")
            }
        }
    }
    

}
