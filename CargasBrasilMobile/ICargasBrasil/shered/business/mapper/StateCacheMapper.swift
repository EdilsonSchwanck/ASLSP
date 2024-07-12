//
//  StateCacheMapper.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation
class StateCacheMapper : MapperBase<State, StateCache>  {
    override func mapToEntity(entity: StateCache) -> State? {
        let to = State()
        to.id = entity.id
        to.name = entity.name
        to.acronym = entity.acronym
        to.ibgeId = entity.ibgeId
        to.country = entity.country?.toCountry()
        return to
    }
    
    override func mapFromEntity(entity: State) -> StateCache? {
        let to = StateCache()
        to.id = entity.id
        to.name = entity.name
        to.acronym = entity.acronym
        to.ibgeId = entity.ibgeId
        to.country = entity.country?.toCountryCache()
        return to
    }
}

extension StateCache {
    func toState() -> State {
        return StateCacheMapper().mapToEntity(entity: self)!
    }
}

extension State {
    func toStateCache() -> StateCache {
        return StateCacheMapper().mapFromEntity(entity: self)!
    }
}

extension Array where Element == State {
    func toListStateCache() -> [StateCache] {
        return StateCacheMapper().mapFromEntityList(array: self)
    }
}

extension Array where Element == StateCache {
    func toListState() -> [State] {
        return StateCacheMapper().mapToEntityList(array: self)
    }
}
