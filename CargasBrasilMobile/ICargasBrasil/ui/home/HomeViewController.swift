//
//  HomeViewController.swift
//  ICargasBrasil
//
//  Created by Edilson Borges on 27/03/24.
//

import UIKit

class HomeViewController: BaseViewController, UISearchBarDelegate, UICollectionViewDelegate, ProfileDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var homeTabBar: UITabBar!
    
    @IBOutlet weak var displayCollectionView: UICollectionView!
    
    @IBOutlet weak var configurationsItem: UITabBarItem!
    
    @IBOutlet weak var profileItem: UITabBarItem!
    
    @IBOutlet weak var newPostItem: UITabBarItem!
    
    @IBOutlet weak var homeItem: UITabBarItem!
    
    var adItems: [Ad] = []
    
    var filterAdItems: [Ad] = []
    
    var cellIdentifier = "AdCollectionViewCell"
    
    var homeViewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setupTabBar()
        setupCollectionView()
        setupSearchBar()
        
        displayCollectionView.register(UINib(nibName: "ConfigurationsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ConfigurationsCollectionViewCell")
        displayCollectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        displayCollectionView.register(UINib(nibName: "NewPostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewPostCollectionViewCell")
        displayCollectionView.register(UINib(nibName: "AdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AdCollectionViewCell")
    }
    
    func setupTabBar() {
        homeTabBar.delegate = self
        homeTabBar.items = [configurationsItem, homeItem, newPostItem, profileItem]
        homeTabBar.barTintColor = UIColor.lightGray
        homeTabBar.tintColor = UIColor.systemBlue
        homeTabBar.unselectedItemTintColor = UIColor.white
        homeTabBar.isTranslucent = false
    }
    
    func setupCollectionView() {
        displayCollectionView.delegate = self
        displayCollectionView.dataSource = self
        
        let cVLayout = UICollectionViewFlowLayout()
        cVLayout.scrollDirection = .vertical
        cVLayout.minimumLineSpacing = 0
        cVLayout.minimumInteritemSpacing = 0
        
        cVLayout.itemSize = CGSize(width: displayCollectionView.bounds.width, height: displayCollectionView.bounds.height)
        
        displayCollectionView.collectionViewLayout = cVLayout
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
}

extension HomeViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Item selecionado:", item.title ?? "")
        switch item.title {
        case "Configurações":
            updateCollectionView(identifier: "ConfigurationsCollectionViewCell")
            searchBar.isHidden = true
        case "Perfil":
            updateCollectionView(identifier: "ProfileCollectionViewCell")
            searchBar.isHidden = true
        case "Nova Postagem":
            updateCollectionView(identifier: "NewPostCollectionViewCell")
            searchBar.isHidden = true
        case "Inicio":
            showCollectionDefault()
        default:
            showCollectionDefault()
        }
    }
    
    private func showCollectionDefault() {
        updateCollectionView(identifier: "AdCollectionViewCell")
        searchBar.isHidden = false
    }

    private func updateCollectionView(identifier: String) {
        cellIdentifier = identifier
        displayCollectionView.reloadData()
    }
    
    func loggout() {
        UserDefaults.standard.removeObject(forKey: "DOCUMENT_USER")
        self.navigationController?.popViewController(animated: true)
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = displayCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        (cell as? ConfigurationsCollectionViewCell)?.profileDelegate = self
        (cell as? AdCollectionViewCell)?.reloadQueryAdvertss()
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: displayCollectionView.bounds.width, height: displayCollectionView.bounds.height)
    }
}

