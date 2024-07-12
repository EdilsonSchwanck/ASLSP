//
//  CityCache.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation
import RealmSwift


open class CityCache : Object, BaseDao {

    typealias TypeID = Int
    typealias ENTITY = CityCache
    
    @Persisted(primaryKey: true) @objc open dynamic var id: Int = 0
    @Persisted @objc open dynamic var name: String = ""
    @Persisted @objc open dynamic var ibgeId: Int = 0
    @Persisted @objc open dynamic var latitude: Double = 0.0
    @Persisted @objc open dynamic var longitude: Double = 0.0
    @Persisted @objc open dynamic var stateId: Int = 0
   
    open var state: StateCache? {
        var state: StateCache?
        state = StateCache.loadById(stateId)
        return state
    }
    
    static func save(_ entity: CityCache) -> Bool {
        let realm = RealmConfig.instance
        do {
            try realm.write {
                realm.add(entity, update: .all)
            }
            return true
        } catch let error as NSError {
           print("Não foi possível salvar o usuário no banco de dados, ERRO: \(error)")
        }
        return false
    }
    
    static func update(_ entity: CityCache) -> Bool {
        let realm = RealmConfig.instance
        do {
            try realm.write {
                realm.add(entity, update: .all)
            }
            return true
        } catch let error as NSError {
           print("Não foi possível salvar o usuário no banco de dados, ERRO: \(error)")
        }
        return false
    }
    
    static func loadAll() -> [CityCache] {
        let realm = RealmConfig.instance
        let objects = realm.objects(CityCache.self)
        return Array(objects)
    }
    
    static func loadById(_ id: Int) -> CityCache? {
        let realm = RealmConfig.instance
        let object = realm.objects(CityCache.self).first(where: {
            $0.id == id
        })
        return object
    }
    
    static func loadByIbge(_ ibgeId: Int) -> CityCache? {
        let realm = RealmConfig.instance
        let object = realm.objects(CityCache.self).first(where: {
            $0.ibgeId == ibgeId
        })
        return object
    }
    
    static func deleteById(_ id: Int) -> Bool {
        let remove = loadById(id)
        guard remove != nil else {
            print("Arte Cartão não encontrado")
            return false
        }
        
        let realm = RealmConfig.instance
        do {
            try realm.write {
                realm.delete(remove!)
                print("Arte Cartão removida com sucesso")
            }
            return true
        } catch _ as NSError {
            print("Não foi possível remover a Arte Cartão")
        }
        return false
    }
    
    static func insertAll(_ entity: [CityCache]) -> Bool {
        let realm = RealmConfig.instance
        do {
            try realm.write {
                realm.add(entity, update: .all)
            }
            return true
        } catch let error as NSError {
           print("Não foi possível salvar as cidades no banco de dados, ERRO: \(error)")
        }
        return false
    }
    
}
