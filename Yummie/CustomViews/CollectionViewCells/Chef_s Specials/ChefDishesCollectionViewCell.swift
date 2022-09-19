//
//  ChefDishesCollectionViewCell.swift
//  Yummie
//
//  Created by Mohamed Khaled on 14/09/2022.
//

import UIKit

class ChefDishesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ChefDishesImage: UIImageView!
    @IBOutlet weak var ChefDishesTitleLabel: UILabel!
    @IBOutlet weak var ChefDishesDescripeLabel: UILabel!
    @IBOutlet weak var ChefDishesCaloriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(dish: Dish) {
        ChefDishesTitleLabel.text = dish.name
        ChefDishesDescripeLabel.text = dish.description
        ChefDishesCaloriesLabel.text = dish.formattedCalories
        ChefDishesImage.kf.setImage( with:dish.image?.asUrl)
    }
    

}
