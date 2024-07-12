//
//  BaseResponse.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
struct BaseResponse<Data : Decodable>: Decodable {

    var success: Bool = false
    var msm: String? = ""
    var data : Data? = nil
    
   enum CodingKeys: String, CodingKey {
       case success =  "sucesso"
       case msm = "mensagem"
       case data = "data"
    
   }
}
