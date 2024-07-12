//
//  MapperBase.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation

open class MapperBase<From, To> {

    func mapFromEntity(entity: From) -> To? { return nil}
    func mapToEntity(entity: To) -> From? { return nil}
    
    func mapFromEntityList(array: [From]) -> [To] {
        var auxArray: [To] = []
        for obj in array {
            let item = mapFromEntity(entity: obj)
            auxArray.append(item!)
        }
        return auxArray
    }
    
    func mapToEntityList(array: [To]) -> [From] {
        var auxArray: [From] = []
        for obj in array {
            let item = mapToEntity(entity: obj)
            auxArray.append(item!)
        }
        return auxArray
    }
}
