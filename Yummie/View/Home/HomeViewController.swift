//
//  HomeViewController.swift
//  GroceryApp
//
//  Created by Ajay Kumar on 25/03/24.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var category: [DishCategory] = [
        .init(id: "id1", name: "African food", image: "https://en.wikipedia.org/wiki/List_of_African_dishes#/media/File:Taro_sauce_jaune_avec_peau_de_boeuf.jpg"),
        .init(id: "id1", name: "African food", image: "https://en.wikipedia.org/wiki/List_of_African_dishes#/media/File:Taro_sauce_jaune_avec_peau_de_boeuf.jpg"),
        .init(id: "id1", name: "African food", image: "https://en.wikipedia.org/wiki/List_of_African_dishes#/media/File:Taro_sauce_jaune_avec_peau_de_boeuf.jpg")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetUp()
        registerCell()
    }

    func initialSetUp() {
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
    }
    
    private func registerCell(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
          cell.setUp(categoty: category[indexPath.row])
        return cell
    }
    
}
