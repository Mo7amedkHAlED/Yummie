//
//  File.swift
//  Yummie
//
//  Created by Mohamed Khaled on 14/09/2022.
//

import Foundation

struct ChefDish {
    let id , name, desceibe, image : String
    let Calories : Int
    
    var formattedCalories : String{
    
        return "\(Calories) Calories"
    }

}
