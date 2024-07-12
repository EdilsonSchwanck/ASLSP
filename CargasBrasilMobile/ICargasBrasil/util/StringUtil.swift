import Foundation
import Alamofire

open class StringUtil {
    
    static func checkMsmErrorLogin(_ msm : String) -> Bool {
         return msm.contains("Não foi possível conectar ao servidor.") || msm.contains("Could not connect to the server.") || msm.contains("Verifique sua conexão com a internet")
    }
    
    static func generatePassword() -> String {
        let pswdChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        let rndPswd = String((0..<8).compactMap{ _ in pswdChars.randomElement() })
        return rndPswd
    }
    
//    static func generateCPF() -> String {
//        var digito1 = 0
//        var digito2 = 0
//        var resto = 0
//        var nDigResult: String
//        var numerosContatenados: String
//        var numeroGerado: String
//
//        //numeros gerados
//        let n1 = Int.random(in: 0 ... 9)
//        let n2 = Int.random(in: 0 ... 9)
//        let n3 = Int.random(in: 0 ... 9)
//        let n4 = Int.random(in: 0 ... 9)
//        let n5 = Int.random(in: 0 ... 9)
//        let n6 = Int.random(in: 0 ... 9)
//        let n7 = Int.random(in: 0 ... 9)
//        let n8 = Int.random(in: 0 ... 9)
//        let n9 = Int.random(in: 0 ... 9)
//
//
//        let soma = n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10
//
//        let valor = soma / 11 * 11
//
//        digito1 = soma - valor
//
//        //Primeiro resto da divisão por 11.
//        resto = digito1 % 11
//
//        if (digito1 < 2) {
//            digito1 = 0
//        } else {
//            digito1 = 11 - resto
//        }
//
//        let soma2 = digito1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11
//
//        let valor2 = soma2 / 11 * 11
//
//        digito2 = soma2 - valor2
//
//        //Primeiro resto da divisão por 11.
//        resto = digito2 % 11
//
//        if (digito2 < 2) {
//            digito2 = 0
//        } else {
//            digito2 = 11 - resto
//        }
//
//        //Conctenando os numeros
//        numerosContatenados = n1.toString + n2.toString + n3.toString + "." + n4.toString +
//                n5.toString + n6.toString + "." + n7.toString + n8.toString +
//                n9.toString + "-"
//
//        //Concatenando o primeiro resto com o segundo.
//        nDigResult = digito1.toString + digito2.toString
//
//        numeroGerado = "\(numerosContatenados)\(nDigResult)"
//
//        print("CPF Gerado \(numeroGerado)")
//
//        return numeroGerado
//    }
    
//    static func generateCNPJ() -> String {
//
//        var digito1 = 0
//        var digito2 = 0
//        var resto = 0
//        var nDigResult: String
//        var numerosContatenados: String
//        var numeroGerado: String
//
//        //numeros gerados
//        let n1  = Int.random(in: 0 ... 9)
//        let n2  = Int.random(in: 0 ... 9)
//        let n3  = Int.random(in: 0 ... 9)
//        let n4  = Int.random(in: 0 ... 9)
//        let n5  = Int.random(in: 0 ... 9)
//        let n6  = Int.random(in: 0 ... 9)
//        let n7  = Int.random(in: 0 ... 9)
//        let n8  = Int.random(in: 0 ... 9)
//        let n9  = Int.random(in: 0 ... 9)
//        let n10 = Int.random(in: 0 ... 9)
//        let n11 = Int.random(in: 0 ... 9)
//        let n12 = Int.random(in: 0 ... 9)
//
//
//        let soma = n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5
//
//        let valor = soma / 11 * 11
//
//        digito1 = soma - valor
//
//        //Primeiro resto da divisão por 11.
//        resto = digito1 % 11
//
//        if (digito1 < 2) {
//            digito1 = 0
//        } else {
//            digito1 = 11 - resto
//        }
//
//        let soma2 =
//            digito1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6
//
//        let valor2 = soma2 / 11 * 11
//
//        digito2 = soma2 - valor2
//
//        //Primeiro resto da divisão por 11.
//        resto = digito2 % 11
//
//        if (digito2 < 2) {
//            digito2 = 0
//        } else {
//            digito2 = 11 - resto
//        }
//
//        //Conctenando os numeros
//        numerosContatenados = n1.toString + n2.toString + "." + n3.toString + n4.toString +
//                n5.toString + "." + n6.toString + n7.toString + n8.toString + "/" +
//                n9.toString + n10.toString + n11.toString +
//                n12.toString + "-"
//
//        //Concatenando o primeiro resto com o segundo.
//        nDigResult = digito1.toString + digito2.toString
//
//        numeroGerado = "\(numerosContatenados)\(nDigResult)"
//
//        print("CNPJ Gerado \(numeroGerado)")
//        return numeroGerado
//    }
    
 
}

extension Double {
    var asLocaleCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencySymbol = ""
        let formattedString = formatter.string(from: self as NSNumber)
        return formattedString?.trimmingCharacters(in: .whitespaces) ?? "0,00"
    }
}

extension String {
    var getVersionApp: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version + " SNAPSHOT"
        }
        return "1.0.0 SNAPSHOT"
    }
}

extension Dictionary {

    func toString() throws -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        }
        catch (let error){
            throw error
        }
    }
}


extension NSDictionary {

    func toString() throws -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        }
        catch (let error){
            throw error
        }
    }
}

extension Double {
    var asRealCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencySymbol = "R$"
        let formattedString = formatter.string(from: self as NSNumber)
        return formattedString?.trimmingCharacters(in: .whitespaces) ?? "0,00"
    }
}


extension String? {
    func isNilOrEmpty() -> Bool {
        if (self == nil) {
            return true
        } else if (self!.isEmpty) {
            return true
        } else {
            return false
        }
    }
}


extension String {
    var endPoint : String {
        let value = Singleton.shared.cargasBrasilConfig.webServiceUrl! + self
        print(value)
        return value
    }
}

extension Parameters {
    func showJson() {
        do {
            let jsonString = try self.toString() ?? ""
            print(jsonString)
        } catch( let error){
            print(error.localizedDescription)
        }
    }
}


extension String {
    func currencyToDecimal() -> Decimal {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.usesGroupingSeparator = true
        if let number = formatter.number(from: self) {
            return number.decimalValue
        } else {
            return Decimal(0)
        }
    }
}

extension String {
    
    var setMaskCEP: String {
        let masked = NSMutableString(format: "%@", clearMaskCEP)
        if masked.length > 5 {
            masked.insert("-", at: 5)
        }
        return masked as String
    }
    
    var clearMaskCEP: String {
        return self.replacingOccurrences(of: "-", with: "")
    }
    
    var clearMaskCNPJ: String {
        var clean = self
        clean.removeAll { $0 == "." || $0 == "/" || $0 == "-" }
        return clean
    }
    
    
    
    var clearMaskCPF: String {
        var clean = self
        clean.removeAll { $0 == "." || $0 == "-" }
        clean.removeAll { $0 == "-" || $0 == " " }
        return clean
    }
    
    var clearMaskCpfCnpf: String {
        let trimmedSelf = (self as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedSelf.count == 14 {
            return trimmedSelf.clearMaskCPF
        }
        return trimmedSelf.clearMaskCNPJ
    }
    
    var clearMaskPhone: String {
        var clean = self
        clean.removeAll { $0 == "(" || $0 == " " }
        clean.removeAll { $0 == " " || $0 == " " }
        clean.removeAll { $0 == ")" || $0 == " " }
        clean.removeAll { $0 == "-" || $0 == " " }
        return clean
    }
}



