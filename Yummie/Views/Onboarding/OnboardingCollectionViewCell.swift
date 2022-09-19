//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Mohamed Khaled on 13/09/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide:OnboardingSlide){ // type struct
        
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
        slideImageView.image = slide.image
        
    }
}
