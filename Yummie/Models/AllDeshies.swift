//
//  AllDeshies.swift
//  Yummie
//
//  Created by Mohamed Khaled on 18/09/2022.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}

