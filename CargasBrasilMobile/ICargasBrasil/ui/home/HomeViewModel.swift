//
//  HomeViewModel.swift
//  ICargasBrasil
//
//  Created by Isabela Da Silva Cardoso on 16/04/24.
//

import Foundation

struct Ad {
    
    let from: String
    let to: String
    let description: String
    let weight: String
}

class HomeViewModel: BaseViewModel {
    
    private var advertsAPI : AdvertsRepository!
    var queryAdverts: BaseRequest<[Adverts]>? = nil
    var filteredData: [Adverts] = []
    var allBanks: [Adverts] = []
    var options: [Adverts] = []
    
    override init() {
        super.init()
        self.advertsAPI = AdvertsRepositoryImpl()
    }
    
    
    
    func queryAdvertss() {
        self.advertsAPI.adverts{ object, success, message in
            DispatchQueue.main.async { [weak self] in
    
                guard success else {
                   self?.queryAdverts?(nil, false, "Ocorreu algum erro ao buscar os bancos")
                   return
                }
                self?.filteredData = object ?? []
                self?.allBanks = object ?? []
                self?.options = object ?? []
                self?.queryAdverts?(object!, success, message)
            }
        }
    }
    

}
