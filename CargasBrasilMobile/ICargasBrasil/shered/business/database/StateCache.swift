//
//  StateCache.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation
import RealmSwift


open class StateCache: Object, BaseDao {
   
    typealias TypeID = Int
    typealias ENTITY = StateCache

    @Persisted(primaryKey: true) @objc open dynamic var id: Int = 0
    @Persisted @objc open dynamic var name: String = ""
    @Persisted @objc open dynamic var acronym: String = ""
    @Persisted @objc open dynamic var ibgeId: Int = 0
    @Persisted @objc open dynamic var country: CountryCache?

    static func save(_ entity: StateCache) -> Bool {
        let realm = RealmConfig.instance
        do {
            try realm.write {
                realm.add(entity, update: .all)
            }
            return true
        } catch let error as NSError {
           print("Não foi possível salvar o estado no banco de dados, ERRO: \(error)")
        }
        return false
    }
    
    static func update(_ entity: StateCache) -> Bool {
        let realm = RealmConfig.instance
        do {
            try realm.write {
                realm.add(entity, update: .all)
            }
            return true
        } catch let error as NSError {
           print("Não foi possível salvar o estado no banco de dados, ERRO: \(error)")
        }
        return false
    }
    
    static func insertAll(_ entity: [StateCache]) -> Bool {
        let realm = RealmConfig.instance
        do {
            try realm.write {
                realm.add(entity, update: .all)
            }
            return true
        } catch let error as NSError {
           print("Não foi possível salvar os estados no banco de dados, ERRO: \(error)")
        }
        return false
    }
    
    static func loadAll() -> [StateCache] {
        let realm = RealmConfig.instance
        let objects = realm.objects(StateCache.self)
        return Array(objects)
    }
    
    static func loadById(_ id: Int) -> StateCache? {
        let realm = RealmConfig.instance
        let object = realm.objects(StateCache.self).first(where: {
            $0.id == id
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
                print("Estado removido com sucesso")
            }
            return true
        } catch _ as NSError {
            print("Não foi possível remover o Estado")
        }
        return false
    }
    
}
