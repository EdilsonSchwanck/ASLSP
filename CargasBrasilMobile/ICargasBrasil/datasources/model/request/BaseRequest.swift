//
//  BaseRequest.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
public typealias BaseRequest<T> = (T?, BRSuccess, BRMessage?) -> Void
public typealias BRMessage = String
public typealias BRSuccess = Bool
