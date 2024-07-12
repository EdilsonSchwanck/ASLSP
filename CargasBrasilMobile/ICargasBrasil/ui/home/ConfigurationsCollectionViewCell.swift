//
//  ConfigurationsCollectionViewCell.swift
//  ICargasBrasil
//
//  Created by Isabela Da Silva Cardoso on 08/05/24.
//

import UIKit

@objc public protocol ProfileDelegate {
    func loggout()
}


class ConfigurationsCollectionViewCell: UICollectionViewCell {
    
    
    var profileDelegate: ProfileDelegate? = nil
    
    
    @IBOutlet weak var labeUser: UILabel!
    
    
    
    

    @IBOutlet weak var backgroundConfigView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupConfigurationsCollectionviewCell()
        setupConstraints()
        
        self.labeUser.text = "Olá,  \(Singleton.shared.user?.name ?? "user")"
    }

    func setupConfigurationsCollectionviewCell() {
        
    }
    
    func setupConstraints() {
            backgroundConfigView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                backgroundConfigView.topAnchor.constraint(equalTo: contentView.topAnchor),
                backgroundConfigView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                backgroundConfigView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                backgroundConfigView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        }
    
    
    @IBAction func sair(_ sender: Any) {
        profileDelegate?.loggout()
    }
    
}
