//
//  ProfileCollectionViewCell.swift
//  ICargasBrasil
//
//  Created by Isabela Da Silva Cardoso on 08/05/24.
//

import UIKit


class ProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelEmail: UILabel!
    
    @IBOutlet weak var labelPhone: UILabel!
    
    @IBOutlet weak var labelCity: UILabel!
    
    @IBOutlet weak var labelState: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupProfilePic()
        setupTextStyle()
    
        self.labelName.text = Singleton.shared.user?.name
        
        self.labelEmail.text = Singleton.shared.user?.email
        
        self.labelPhone.text = Singleton.shared.user?.telefone
        
        self.labelCity.text = Singleton.shared.user?.cidade
        
        self.labelState.text = Singleton.shared.user?.estado
        
    }
    
    private func setupTextStyle() {
        labelName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        labelName.textColor = UIColor.darkGray
        
        
        labelEmail.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelEmail.textColor = UIColor.gray
        
        
        labelPhone.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelPhone.textColor = UIColor.gray
        
        
        labelCity.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelCity.textColor = UIColor.gray
        
        
        labelState.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelState.textColor = UIColor.gray
    }
    
    private func setupProfilePic() {
        profilePic.layoutIfNeeded()

                profilePic.layer.borderColor = UIColor.white.cgColor

                // Adicionar sombra
                profilePic.layer.shadowColor = UIColor.black.cgColor
                profilePic.layer.shadowOffset = CGSize(width: 0, height: 2.0)
                profilePic.layer.shadowRadius = 4.0
                profilePic.layer.shadowOpacity = 0.5
                profilePic.layer.masksToBounds = false
        }
  
    
    
    
}
