//
//  CityCacheMapper.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation

class CityCacheMapper : MapperBase<City, CityCache>  {
    override func mapToEntity(entity: CityCache) -> City? {
        let to = City()
        to.id = entity.id
        to.name = entity.name
        to.ibgeId = entity.ibgeId
        to.latitude = entity.latitude
        to.longitude = entity.longitude
        to.stateId = entity.stateId
        to.state = entity.state?.toState()
        return to
    }
    
    override func mapFromEntity(entity: City) -> CityCache? {
        let to = CityCache()
        to.id = entity.id
        to.name = entity.name
        to.ibgeId = entity.ibgeId
        to.latitude = entity.latitude
        to.longitude = entity.longitude
        to.stateId = entity.stateId
        return to
    }
}

extension CityCache {
    func toCity() -> City {
        return CityCacheMapper().mapToEntity(entity: self)!
    }
}

extension City {
    func toCityCache() -> CityCache {
        return CityCacheMapper().mapFromEntity(entity: self)!
    }
}

extension Array where Element == City {
    func toListCityCache() -> [CityCache] {
        return CityCacheMapper().mapFromEntityList(array: self)
    }
}

extension Array where Element == CityCache {
    func toListCity() -> [City] {
        return CityCacheMapper().mapToEntityList(array: self)
    }
}
