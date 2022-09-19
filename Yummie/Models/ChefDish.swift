//
//  ChefDish.swift
//  Yummie
//
//  Created by Mohamed Khaled on 15/09/2022.
//

import Foundation

struct ChefDish {
    let id : String?
    let name : String?
    let describe : String?
    let image : String?
    let Calories : Int?
    var formattedCalories : String{ // to convert to string value
        
       // return String(format: "%.2f Calories", Calories ?? 0)
        return "\(Calories!) Calories"
    }
}
