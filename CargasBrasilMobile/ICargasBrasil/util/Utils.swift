//
//  Utils.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import Foundation
import UIKit
import Realm
import RealmSwift

public struct CGColorComponents {
    var c1: CGFloat
    var c2: CGFloat
    var c3: CGFloat
    var c4: CGFloat
}

// ----------------------------------------------------------------------------------------------------------------
/* MARK: UIImage Extension */
// ----------------------------------------------------------------------------------------------------------------
extension UIImage {
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

// ----------------------------------------------------------------------------------------------------------------
/* MARK: SMRealm Extension */
// ----------------------------------------------------------------------------------------------------------------
extension RealmConfig {
    static func incrementID<T: Object>(_ type: T.Type) -> Int {
        let realm = RealmConfig.instance
        return (realm.objects(T.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    static func max<T: Object>(ofProperty: String, _ type: T.Type) -> Int {
        let realm = RealmConfig.instance
        return (realm.objects(T.self).max(ofProperty: ofProperty) as Int? ?? 0) + 1
    }
}

// ----------------------------------------------------------------------------------------------------------------
/* MARK: Attributed String Extension */
// ----------------------------------------------------------------------------------------------------------------
extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 13)]
        let boldString = NSMutableAttributedString(string: text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}



// ----------------------------------------------------------------------------------------------------------------
/* MARK: String */
// ----------------------------------------------------------------------------------------------------------------
extension String {
    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890-")
        return self.filter { okayChars.contains($0) }
    }
    
    var onlyNumbers: String {
        let okayChars = Set("1234567890")
        return self.filter { okayChars.contains($0) }
    }
}

// ----------------------------------------------------------------------------------------------------------------
/* MARK: UITextField */
// ----------------------------------------------------------------------------------------------------------------
extension UITextField {
    @IBInspectable open var colorPlaceholder: UIColor {
        get {
            return self.attributedPlaceholder?.attributes[.foregroundColor] as? UIColor ?? .lightGray
        }
        set {
            self.attributedPlaceholder = self.attributedPlaceholder?.colored(with: newValue)
        }
    }
    
    
    func applyFilterMask(mask: String, textField: UITextField) {
        var index = mask.startIndex
        var textWithMask = ""
        
        var i = text!.startIndex
        while index < mask.endIndex {
            if i >= text!.endIndex {
                break
            }
            
            let char = mask[index]
            switch char {
            case "N":
                if text![i].isNumber {
                    textWithMask.append(text![i])
                }
                i = text!.index(after: i)
                
            case "C":
                if text![i].isLetter {
                    textWithMask.append(text![i].uppercased())
                }
                i = text!.index(after: i)
                
            case "c":
                if text![i].isLetter {
                    textWithMask.append(text![i].lowercased())
                }
                i = text!.index(after: i)
                
            case "X":
                if text![i].isLetter || text![i].isNumber {
                    textWithMask.append(text![i])
                }
                i = text!.index(after: i)
                
            case "%":
                if text![i].isLetter || text![i].isNumber {
                    textWithMask.append(text![i])
                }
                i = text!.index(after: i)
                
            case "U":
                if text![i].isUppercase || text![i].isNumber {
                    textWithMask.append(text![i].uppercased())
                }
                i = text!.index(after: i)
                
            case "u":
                if text![i].isLowercase || text![i].isNumber {
                    textWithMask.append(text![i].lowercased())
                }
                i = text!.index(after: i)
                
            case "*":
                textWithMask.append(text![i])
                i = text!.index(after: i)
                
            default:
                textWithMask.append(char)
            }
            index = mask.index(after: index)
        }
        
        self.text = textWithMask
    }
    
    
//    func applyFilterMask(mask: String, textField: UITextField) {
//        if mask.isEmpty {
//            return
//        }
//        var index = mask.startIndex
//        var textWithMask: String = ""
//        var i: Int = 0
//        
//        var text: String = textField.text!
//        if text.isEmpty {
//            return
//        }
//        
//        text = self.removeMaskCharacterss(text, maskText: mask)
//        while index != mask.endIndex {
//            if i >= text.count {
//                self.text = textWithMask
//                break
//            }
//            if "\(mask[index])" == "N" { //Somente número
//                if !self.isNumberMask(text) {
//                    break
//                }
//                textWithMask += text
//                i += 1
//            } else if "\(mask[index])" == "C" { //Qualquer caracter MAIÚSCULO A-Z
//                if self.hasSpecialCharacterMask(text) {
//                    break
//                }
//                if self.isNumberMask(text) {
//                    break
//                }
//                textWithMask += text
//                textWithMask = textWithMask.uppercased()
//                i += 1
//            } else if "\(mask[index])" == "c" { //Qualquer caracter minúsculo a-z
//                if self.hasSpecialCharacterMask(text) {
//                    break
//                }
//                if self.isNumberMask(text) {
//                    break
//                }
//                textWithMask += text
//                textWithMask = textWithMask.lowercased()
//                i += 1
//            } else if "\(mask[index])" == "X" { //Qualquer caracter a-Z
//                if self.hasSpecialCharacterMask(text) {
//                    break
//                }
//                if self.isNumberMask(text) {
//                    break
//                }
//                textWithMask += text
//                i += 1
//            } else if "\(mask[index])" == "%" { //Caracteres a-Z + número
//                if self.hasSpecialCharacterMask(text) {
//                    break
//                }
//                textWithMask += text
//                i += 1
//            } else if "\(mask[index])" == "U" { //Somente caracteres MAIÚSCULOS A-Z + números
//                if self.hasSpecialCharacterMask(text) {
//                    break
//                }
//                textWithMask += text
//                textWithMask = textWithMask.uppercased()
//                i += 1
//            } else if "\(mask[index])" == "u" { //Somente caracteres minúsculos a-z + números
//                if self.hasSpecialCharacterMask(text) {
//                    break
//                }
//                textWithMask += text
//                textWithMask = textWithMask.lowercased()
//                i += 1
//            } else if "\(mask[index])" == "*" { //Any Character
//                textWithMask += text
//                i += 1
//            } else {
//                textWithMask += "\(mask[index])"
//            }
//            index = mask.index(after: index)
//        }
//        self.text = textWithMask
//    }
    
    /**
     Método que verifica se a String é um número.
     
     - parameter textToValidate: String que será validada.
     
     - returns: Se é ou não um Int.
     */
    func isNumberMask(_ textToValidate: String) -> Bool {
        let num = Int(textToValidate)
        if num != nil {
            return true
        }
        return false
    }
    
    /**
     Método que verifica se a String contém caracteres especiais.
     
     - parameter searchTerm: String que será verificada.
     
     - returns: Contém ou não caracteres especiais.
     */
    func hasSpecialCharacterMask(_ searchTerm: String) -> Bool {
        do {
            let regex = try  NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options())
            if regex.firstMatch(in: searchTerm, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: searchTerm.count)) != nil {
                return true
            }
            return false
        } catch {
            return false
        }
    }
    
    /**
     Método que remove os caracteres da máscara.
     
     - parameter string: String que será removido os valores da máscara.
     - parameter maskText: Máscara.
     
     - returns: String sem os caracteres da máscara.
     */
    func removeMaskCharacterss(_ string: String, maskText: String) -> String {
        var text: String = string
        var mask: String = maskText
        mask = mask.replacingOccurrences(of: "X", with: "")
        mask = mask.replacingOccurrences(of: "N", with: "")
        mask = mask.replacingOccurrences(of: "C", with: "")
        mask = mask.replacingOccurrences(of: "c", with: "")
        mask = mask.replacingOccurrences(of: "U", with: "")
        mask = mask.replacingOccurrences(of: "u", with: "")
        mask = mask.replacingOccurrences(of: "*", with: "")
        var i = mask.startIndex
        while i != mask.endIndex {
            text = text.replacingOccurrences(of: "\(mask[i])", with: "")
            i = mask.index(after: i)
        }
        return text
    }
}
