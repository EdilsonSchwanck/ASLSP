//
//  CountryCache.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation
import RealmSwift


open class CountryCache: Object, BaseDao {
    
    typealias TypeID = Int
    typealias ENTITY = CountryCache
    
    @Persisted(primaryKey: true) @objc open dynamic var id: Int = 0
    open dynamic var name: String? = ""
    open dynamic var acronym: String? = ""
    
    static func save(_ entity: CountryCache) -> Bool {
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
    
    static func update(_ entity: CountryCache) -> Bool {
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
    
    static func loadAll() -> [CountryCache] {
        let realm = RealmConfig.instance
        let objects = realm.objects(CountryCache.self)
        return Array(objects)
    }
    
    static func loadById(_ id: Int) -> CountryCache? {
        let realm = RealmConfig.instance
        let object = realm.objects(CountryCache.self).first(where: {
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
                print("Arte Cartão removida com sucesso")
            }
            return true
        } catch _ as NSError {
            print("Não foi possível remover a Arte Cartão")
        }
        return false
    }
}



