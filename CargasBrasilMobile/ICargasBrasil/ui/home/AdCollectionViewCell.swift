//
//  AdCollectionViewCell.swift
//  ICargasBrasil
//
//  Created by Isabela Da Silva Cardoso on 03/05/24.
//
import UIKit

class AdCollectionViewCell: UICollectionViewCell{

    @IBOutlet var descriptionText: UILabel!
    @IBOutlet var titleLabelFrom: UILabel!
    @IBOutlet var titleLabelTo: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet weak var adTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    private var homeViewModel: HomeViewModel = HomeViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
        self.adTableView.register(UINib(nibName: "AdTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
        self.adTableView.reloadData()
        
        self.searchBar.searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        reloadQueryAdvertss()
    }
    
   public func reloadQueryAdvertss() {
        createRestListener()
        self.homeViewModel.queryAdvertss()
    }

    func setupTableView() {
        adTableView.rowHeight = UITableView.automaticDimension
        adTableView.dataSource = self
    }
    
     func createRestListener() {
        self.homeViewModel.queryAdverts = { object, success, message in
            DispatchQueue.main.async {
                if(success){
                    self.adTableView.reloadData()
                }else{
                    let alert = UIAlertController(title: "Atenção", message: "Não foi possivel carregar os anucios", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        let searchText = textField.text
        if searchText!.isEmpty {
            self.homeViewModel.filteredData = self.homeViewModel.allBanks
            self.homeViewModel.options = self.homeViewModel.allBanks

        } else {
            self.homeViewModel.filteredData = self.homeViewModel.options.filter({
                ($0.enderecoColeta.range(of: searchText!, options: .caseInsensitive) != nil) ||
                ($0.enderecoEntrega.range(of: searchText!, options: .caseInsensitive) != nil) ||
                ($0.valorDoFrete.range(of: searchText!, options: .caseInsensitive) != nil)
            })
        }

        self.adTableView.reloadData()
    }
}

extension AdCollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeViewModel.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = adTableView.dequeueReusableCell(withIdentifier:"InfoCell", for: indexPath)
//        cell.textLabel?.text = "Item \(indexPath.row)"
        let product = self.homeViewModel.filteredData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? AdTableViewCell ?? AdTableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.object = product
        return cell
    }
}

extension AdCollectionViewCell: UITableViewDelegate {
    
}
