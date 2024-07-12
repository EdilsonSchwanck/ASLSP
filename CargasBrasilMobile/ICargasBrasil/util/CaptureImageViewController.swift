//
//  CaptureImageViewController.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 03/04/24.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation
import Photos

class CaptureImageViewController : BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public var imageRead : UIImage!
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let myPicture = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
        let resizedImage = myPicture.resized(toWidth: IMAGE_COMPRESSION_WIDTH) else { return }
        self.imageRead = resizedImage
        imageRead = resizedImage
        
    }
    
    
    func openCamera() {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch cameraAuthorizationStatus {
        case .authorized:
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                imagePicker.cameraCaptureMode = .photo
                imagePicker.allowsEditing = false
                imagePicker.modalPresentationStyle = .formSheet
                self.navigationController?.present(imagePicker, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Atenção", message: "Câmera indisponível, tente novamente mais tarde.", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
               
            }
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                if granted {
                    DispatchQueue.main.async {
                        self?.openCamera()
                    }
                }
            }
        case .restricted, .denied:
            
            let alert = UIAlertController(title: "Atenção", message: "O acesso à câmera foi negado. Você pode habilitar o acesso nas configurações do dispositivo", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true, completion: nil)
        @unknown default:
            break
        }
    }
    

    
    func openGallery() {
        let photoLibraryAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoLibraryAuthorizationStatus {
        case .authorized:
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.modalPresentationStyle = .formSheet
                imagePicker.allowsEditing = false
                self.navigationController?.present(imagePicker, animated: true, completion: nil)
            }
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { [weak self] status in
                if status == .authorized {
                    DispatchQueue.main.async {
                        self?.openGallery()
                    }
                }
            }
        case .restricted, .denied:
            let alert = UIAlertController(title: "Atenção", message: "O acesso à galeria de fotos foi negado. Você pode habilitar o acesso nas configurações do dispositivo.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .limited:
            let alert = UIAlertController(title: "Atenção", message: "O acesso à galeria de fotos foi negado. Você pode habilitar o acesso nas configurações do dispositivo.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        @unknown default:
            break
        }
    }
    
}
