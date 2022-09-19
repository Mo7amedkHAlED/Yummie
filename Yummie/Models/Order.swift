//
//  Order.swift
//  Yummie
//
//  Created by Mohamed Khaled on 16/09/2022.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
