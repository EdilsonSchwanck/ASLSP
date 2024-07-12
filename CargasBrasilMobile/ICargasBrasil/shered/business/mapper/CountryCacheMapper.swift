//
//  CountryCacheMapper.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation

class CountryCacheMapper : MapperBase<Country, CountryCache>  {
    override func mapToEntity(entity: CountryCache) -> Country? {
        let to = Country()
        to.id = entity.id
        to.name = entity.name
        to.acronym = entity.acronym
        return to
    }
    
    override func mapFromEntity(entity: Country) -> CountryCache? {
        let to = CountryCache()
        to.id = entity.id
        to.name = entity.name
        to.acronym = entity.acronym
        return to
    }
}

extension CountryCache {
    func toCountry() -> Country {
        return CountryCacheMapper().mapToEntity(entity: self)!
    }
}

extension Country {
    func toCountryCache() -> CountryCache {
        return CountryCacheMapper().mapFromEntity(entity: self)!
    }
}

extension Array where Element == Country {
    func toListCountry() -> [CountryCache] {
        return CountryCacheMapper().mapFromEntityList(array: self)
    }
}

extension Array where Element == CountryCache {
    func toListCountryCache() -> [Country] {
        return CountryCacheMapper().mapToEntityList(array: self)
    }
}



