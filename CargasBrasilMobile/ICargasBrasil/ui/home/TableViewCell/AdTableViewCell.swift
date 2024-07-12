//
//  AdTableViewCell.swift
//  ICargasBrasil
//
//  Created by Isabela Da Silva Cardoso on 17/05/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet weak var labelDestino: UILabel!
    
    @IBOutlet weak var labelColeta: UILabel!

    @IBOutlet weak var labelVeiculo: UILabel!
    
    @IBOutlet weak var labelEmpresa: UILabel!
    
    @IBOutlet weak var labelTelefone: UILabel!
    
    @IBOutlet weak var labelValueFrete: UILabel!
    
    @IBOutlet weak var tableViewCell: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
    
    open weak var object: Adverts! {
        didSet {
            self.labelTitulo.text = object.titulo
            self.labelDestino.text = "Destino : \(object.enderecoEntrega)"
            self.labelColeta.text =  "Coleta : \(object.enderecoColeta)"
            self.labelVeiculo.text = "Veiculo : \(object.tipoDeVeiculo) "
            self.labelEmpresa.text =  "Empresa : \(object.nomeEmpresa)"
            self.labelTelefone.text = "Telefone : \(object.phone)" 
            self.labelValueFrete.text = "Valor : R$\(object.valorDoFrete)"
        }
    }
    
    private func setupStyle() {
        
        tableViewCell.layer.cornerRadius = 10
        tableViewCell.layer.shadowColor = UIColor.black.cgColor
        tableViewCell.layer.shadowOpacity = 0.2
        tableViewCell.layer.shadowOffset = CGSize(width: 0, height: 2)
        tableViewCell.layer.shadowRadius = 4
        tableViewCell.layer.masksToBounds = false
        tableViewCell.backgroundColor = .white
        
       
        tableViewCell.layer.borderColor = UIColor.systemBlue.cgColor
        tableViewCell.layer.borderWidth = 1

        
         labelTitulo.font = UIFont.systemFont(ofSize: 16, weight: .bold)
         labelTitulo.textColor = UIColor.darkGray

     
         labelColeta.font = UIFont.systemFont(ofSize: 16, weight: .bold)
         labelColeta.textColor = UIColor.darkGray

         labelDestino.font = UIFont.systemFont(ofSize: 16, weight: .bold)
         labelDestino.textColor = UIColor.darkGray

         labelEmpresa.font = UIFont.systemFont(ofSize: 14, weight: .regular)
         labelEmpresa.textColor = UIColor.gray

         labelVeiculo.font = UIFont.systemFont(ofSize: 14, weight: .regular)
         labelVeiculo.textColor = UIColor.gray

         labelTelefone.font = UIFont.systemFont(ofSize: 14, weight: .regular)
         labelTelefone.textColor = UIColor.gray
     
         labelValueFrete.font = UIFont.systemFont(ofSize: 14, weight: .regular)
         labelValueFrete.textColor = UIColor.gray
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
