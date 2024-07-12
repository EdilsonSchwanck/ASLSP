//
//  UserCacheMapper.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation

class UserCacheMapper : MapperBase<User, UserCache>  {
    
    override func mapFromEntity(entity: User) -> UserCache? {
        let to = UserCache()
        to.id = entity.id
        to.nome = entity.name
        to.cpfcnpj = entity.cpfcnpj
        to.email = entity.email
        to.telefone = entity.telefone
        to.endereco = entity.endereco
        to.numero = entity.numero
        to.cidade = entity.cidade
        to.cep = entity.cep
        to.estado = entity.estado
        to.bairro = entity.bairro
        to.cadastroAprovado = entity.cadastroAprovado
        to.tipoUsuario = entity.tipoUsuario 
        
        return to
    }
    
    override func mapToEntity(entity: UserCache) -> User? {
        let to = User()
        to.id = entity.id
        to.name = entity.nome
        to.cpfcnpj = entity.cpfcnpj
        to.email = entity.email
        to.telefone = entity.telefone
        to.endereco = entity.endereco
        to.numero = entity.numero
        to.cidade = entity.cidade
        to.cep = entity.cep
        to.estado = entity.estado
        to.bairro = entity.bairro
        to.cadastroAprovado = entity.cadastroAprovado
        to.tipoUsuario = entity.tipoUsuario
        
        return to
    }
    
}

extension UserCache {
    func toUser() -> User {
        return UserCacheMapper().mapToEntity(entity: self)!
    }
}

extension User {
    func toUserCache() -> UserCache {
        return UserCacheMapper().mapFromEntity(entity: self)!
    }
}

extension Array where Element == User{
    func toListUserChace() -> [UserCache]{
        return UserCacheMapper().mapFromEntityList(array: self)
    }
}

extension Array where Element == UserCache{
    func toListUser() -> [User] {
        return UserCacheMapper().mapToEntityList(array: self)
    }
}

