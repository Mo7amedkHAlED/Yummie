//
//  PopularCollectionViewCell.swift
//  Yummie
//
//  Created by Mohamed Khaled on 14/09/2022.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var PopularTitleLabel: UILabel!
    @IBOutlet weak var PopularImageView: UIImageView!
    @IBOutlet weak var CaloriesLabel: UILabel!
    @IBOutlet weak var PopularDescribeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(dish: Dish) {
        PopularTitleLabel.text = dish.name
        PopularDescribeLabel.text = dish.description
        CaloriesLabel.text = dish.formattedCalories
        PopularImageView.kf.setImage(with:dish.image?.asUrl)
    }
    
}
