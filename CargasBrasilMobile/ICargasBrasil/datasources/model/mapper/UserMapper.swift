//
//  UserMapper.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation

open class UserMapper :  MapperBase<UserResponse, User> {
    
    override func mapFromEntity(entity: UserResponse) -> User? {
        let to = User()
        to.name = entity.name
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
        to.tipoUsuario = entity.tipoUsuario ?? UserType.motorista.rawValue

        return to
    }
    
    
    override func mapToEntity(entity: User) -> UserResponse? {
        let to = UserResponse()
        to.name = entity.name
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

extension UserResponse {
    func toUser() -> User {
        return UserMapper().mapFromEntity(entity: self)!
    }
}

extension User {
    func toUserResponse() -> UserResponse {
        return UserMapper().mapToEntity(entity: self)!
    }
}

extension Array where Element == User {
    func toListUser() -> [UserResponse] {
        return UserMapper().mapToEntityList(array: self)
    }
}

extension Array where Element == UserResponse {
    func toListUserResponse() -> [User] {
        return UserMapper().mapFromEntityList(array: self)
    }
}

