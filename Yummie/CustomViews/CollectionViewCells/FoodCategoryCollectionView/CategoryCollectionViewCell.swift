//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Mohamed Khaled on 14/09/2022.
//

import UIKit
import Kingfisher
class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var CategoryImageView: UIImageView!
    @IBOutlet weak var CategoryLabelView: UILabel!
    
    func setup(category: DishCategory) {
        CategoryLabelView.text = category.name
        CategoryImageView.kf.setImage(with: category.image?.asUrl)
    }

}
