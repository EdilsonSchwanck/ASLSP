//
//  SMImageUtil.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 10/04/24.
//

import UIKit

open class SMImageUtil {
    
    open class func image(fromStringBase64 stringBase64: String) -> UIImage? {
        guard let decodedData = Data(base64Encoded: stringBase64, options: NSData.Base64DecodingOptions(rawValue:0)) else { return nil }
        let decodedimage = UIImage(data: decodedData)
        return decodedimage
    }
    
    open class func stringBase64(fromImage image: UIImage) -> String? {
        guard let imageData = image.pngData() else { return nil }
        let base64String = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return base64String
    }
    
    open class func loadImageFromDocuments(imageNamed name: String) -> UIImage? {
        guard let path = SMImageUtil.imagePath() else { return nil }
        return UIImage(contentsOfFile: path + name)
    }
    
    open class func writeInFolder(image: UIImage, withName imageName: String, compressionImage: Bool) -> String {
        
        let imageFullName = ("/\(imageName)\(SMImageUtil.imageExtension())")
        
        let dataImage = compressionImage ? imageCompression(image)?.jpegData(compressionQuality: 0.05) : image.jpegData(compressionQuality: 1)
        
        if let path = SMImageUtil.imagePath(), !FileManager.default.fileExists(atPath: path + imageFullName) {
            do {
                try FileManager.default.removeItem(atPath: path + imageFullName)
            } catch let error as NSError {
                print("Erro: SMImageUtil -> Não foi possível excluir a imagem ao gravar uma nova imagem. Descrição de erro: \(error)")
            }
            
            ((try? dataImage?.write(to: URL(fileURLWithPath: path + imageFullName), options: [.atomic])) as ()??)
        }
        
        return imageFullName
    }
    
    open class func removeImage(withImageName imageName: String) -> Bool {
        guard let path = self.imagePath() else { return false }
        let imagePath = path + imageName
        if !FileManager.default.fileExists(atPath: imagePath) {
            do {
                try FileManager.default.removeItem(atPath: imagePath)
            } catch let error as NSError {
                print("Erro: SMImageUtil -> Não foi possível excluir a imagem. Descrição de erro: \(error)")
            }
        }
        
        return true
    }
    
    open class func createFolderImage() -> Bool {
        let documentsDirectory = SMImageUtil.filePath()
        
        guard let dataPath = documentsDirectory?.appendingPathComponent("/Image") else { return false }
        
        if !FileManager.default.fileExists(atPath: dataPath) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath, withIntermediateDirectories: false, attributes: nil)
            } catch let error as NSError {
                print("Erro: SMImageUtil -> Não foi possível criar a pasta das imagens. Descrição de erro: \(error)")
            }
        }
        
        return true
    }
    
    open class func filePath() -> NSString?{
        let paths: NSArray = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) as NSArray
        return paths.object(at: 0) as? NSString
    }
    
    open class func imagePath() -> String? {
        return SMImageUtil.filePath()?.appendingPathComponent("Image/")
    }
    
    open class func imageExtension() -> String {
        return ".jpeg"
    }
    
    open class func imageResize(_ image: UIImage, sizeChange: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(sizeChange)
        image.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        return resizedImage
    }
    
    open class func imageCompression(_ image: UIImage)  -> UIImage? {
        let size = image.size.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        image.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }
}
