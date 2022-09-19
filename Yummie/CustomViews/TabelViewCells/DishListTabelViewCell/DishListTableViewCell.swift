//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by Mohamed Khaled on 16/09/2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    @IBOutlet weak var DishImageView: UIImageView!
    @IBOutlet weak var DishNameLabel: UILabel!
    @IBOutlet weak var DishdescibtionLAbel: UILabel!
    
    func setup(dish: Dish){
        DishImageView.kf.setImage(with: dish.image?.asUrl)
        DishNameLabel.text = dish.name
        DishdescibtionLAbel.text = dish.description
        
    }
    func setup(order:Order){
        DishImageView.kf.setImage(with:order.dish?.image?.asUrl)
        DishNameLabel.text = order.dish?.name
        DishdescibtionLAbel.text = order.name
        
    }
}
