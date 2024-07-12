//
//  UserCache.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
import RealmSwift


class UserCache : Object, BaseDao {
  
    typealias TypeID = Int
    
    typealias ENTITY = UserCache
    
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted @objc dynamic var nome: String = ""
    @Persisted @objc dynamic var cpfcnpj: String = ""
    @Persisted @objc dynamic var email: String = ""
    @Persisted @objc dynamic var telefone: String = ""
    @Persisted @objc dynamic var cep: String = ""
    @Persisted @objc dynamic var endereco: String = ""
    @Persisted @objc dynamic var numero: String = ""
    @Persisted @objc dynamic var cidade: String = ""
    @Persisted @objc dynamic var estado: String = ""
    @Persisted @objc dynamic var bairro: String = ""
    @Persisted @objc dynamic var cadastroAprovado: Bool = false
    @Persisted @objc dynamic var tipoUsuario = UserType.motorista.rawValue
    
    
    
    static func save(_ entity: UserCache) -> Bool {
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
    
    static func update(_ entity: UserCache) -> Bool {
        let realm = RealmConfig.instance
        do {
            try realm.write {
                realm.add(entity, update: .all)
            }
            return true
        } catch let error as NSError {
           print("Não foi possível atualizar o usuário no banco de dados, ERRO: \(error)")
        }
        return false
    }
    
    static func loadAll() -> [UserCache] {
        let realm = RealmConfig.instance
        let objects = realm.objects(UserCache.self)
        return Array(objects)
    }
    
    static func loadById(_ id: Int) -> UserCache? {
        let realm = RealmConfig.instance
        let object = realm.objects(UserCache.self).first(where: {
            $0.id == id
        })
        return object
    }
    
        static func loadByDocument(_ document: String) -> UserCache? {
            let realm = RealmConfig.instance
            let object = realm.objects(UserCache.self).first(where: {
                $0.cpfcnpj == document
            })
            return object
        }
        
    
    static func deleteById(_ id: Int) -> Bool {
        let userRemove = loadById(id)
        guard userRemove != nil else {
            print("Usuário não encontrado")
            return false
        }
        
        let realm = RealmConfig.instance
        do {
            try realm.write {
                realm.delete(userRemove!)
                print("Usuario removido com sucesso")
            }
            return true
        } catch _ as NSError {
            print("Não foi possível remover o usuário")
        }
        return false
    }
    
    
}
