//
//  RequestBase.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
import Alamofire

class RequestBase: NSObject, Encodable {}

extension Encodable {
    func toJson() -> String? {
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(self)
        let json = String(data: jsonData, encoding: String.Encoding.utf8)
        return json
    }

    func toParans() -> Parameters? {
        let parans = self.toJson()?.toParans() as? Parameters
        print(parans?.showJson() ?? "")
        return parans
    }
}

extension String {
    func toParans() -> Any? {
        guard let data = self.data(using: .unicode, allowLossyConversion: true) else { return nil }
        let jsonAny = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Parameters
        return jsonAny
    }

}
