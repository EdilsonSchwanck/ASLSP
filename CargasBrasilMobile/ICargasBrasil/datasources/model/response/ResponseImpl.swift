//
//  ResponseImpl.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation

public typealias ResponseImpl<T> = (T?, RISuccess, RIMessage?) -> Void
public typealias RIMessage = String
public typealias RISuccess = Bool
