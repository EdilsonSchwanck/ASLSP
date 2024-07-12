//
//  BaseDao.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
protocol BaseDao {
    associatedtype TypeID
    associatedtype ENTITY
    static func save(_ entity: ENTITY) -> Bool
    static func update(_ entity: ENTITY) -> Bool
    static func loadAll() -> [ENTITY]
    static func loadById(_ id: TypeID) -> ENTITY?
    static func deleteById(_ id: TypeID) -> Bool
}
