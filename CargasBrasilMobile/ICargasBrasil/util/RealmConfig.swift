//
//  RealmConfig.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
import RealmSwift

open class RealmConfig {
    
    static let SCHEMA_VERSION : UInt64 = 5
    
    public static var instance: Realm {
        return RealmConfig.createDB()
    }
    
    private static func removeDB() -> Bool {
        do {
            try FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
        } catch let error as NSError {
            print("Erro ao deletar o DB: --> \(error)")
            return false
        }
        return true
    }
    
    private static func createDB() -> Realm {
        do {
            let realm = try Realm(configuration: migrationSchema())
            return realm
        } catch _ as NSError {
            print("DATABASE - Banco de dados moficado sem um migration, removendo DB e criando novamente")
            if RealmConfig.removeDB() {
                return RealmConfig.instance
            } else {
                fatalError("DATABASE - Atenção, não foi pissível deletar o RealmDB")
            }
        }
    }
    
    

    private static func migrationSchema() -> Realm.Configuration {
        let configuration = Realm.Configuration(schemaVersion: UInt64(SCHEMA_VERSION)) { migration, oldSchemaVersion in
            switch SCHEMA_VERSION {
                
                // exemplos de como rodar uma migration
                
//            case 1:
//                migration.enumerateObjects(ofType: "UserCache") { oldObject, newObject in
//                    newObject?["userName"] = ""
//                }
//                break
//                case 2:
//                    migration.enumerateObjects(ofType: "UserCache") { oldObject, newObject in
//                        newObject?["hasApprovedForm"] = true
//                    }
//                    break
//                case 3:
//                    migration.enumerateObjects(ofType: "BanksCache") { oldObject, newObject in
//                        newObject?["rank"] = 0
//                    }
//                    break
//                case 4:
//                    migration.enumerateObjects(ofType: "BanksCache") { oldObject, newObject in
//                        newObject?["hasRank"] = false
//                        newObject?["code"] = 0
//                    }
//                    break
//                case 5:
//                    migration.enumerateObjects(ofType: "UserCache") { oldObject, newObject in
//                        newObject?["paymentOnlyPix"] = false
//                    }
//                break
//            case 3:
//                migration.renameProperty(onType: "UserCache", from: "nameUppercase", to: "nameLowercase")
//                break
//            case 5:
//                migration.enumerateObjects(ofType: "UserCache") { oldObject, newObject in
//                    let city = migration.create("CityCache")
//                    newObject?["city"] = city
//                }
//                break
//            case 6:
//                migration.enumerateObjects(ofType: "UserCache") { oldObject, newObject in
//                    migration.deleteData(forType: "nameLowercase")
//                }
//                break
            default:
                break
            }
        }
        return configuration
    }
}

extension Realm {
    public func write(transaction block: () -> Void, completion: () -> Void) throws {
        try write(block)
        completion()
    }
}
