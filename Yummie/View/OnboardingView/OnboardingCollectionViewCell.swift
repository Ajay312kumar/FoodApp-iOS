//
//  OnboardingCollectionViewCell.swift
//  GroceryApp
//
//  Created by Ajay Kumar on 15/03/24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text  = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
}
