//
//  CategoryCollectionViewCell.swift
//  GroceryApp
//
//  Created by Ajay Kumar on 25/03/24.
//

import UIKit
import Kingfisher
class CategoryCollectionViewCell: UICollectionViewCell {

    //MARK: IBOUtlets
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    //MARK: Life Cycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: Functons
    func setUp(categoty: DishCategory){
        categoryTitleLabel.text = categoty.name
        categoryImageView.kf.setImage(with: categoty.image.asUrl)
    }
}
