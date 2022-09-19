//
//  PopularDishs.swift
//  Yummie
//
//  Created by Mohamed Khaled on 14/09/2022.
//

import Foundation

struct Dish: Decodable{
    let id , name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
