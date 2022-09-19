//
//  DishCaterory.swift
//  Yummie
//
//  Created by Mohamed Khaled on 14/09/2022.
//

import UIKit
struct DishCategory:Decodable{
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title" // to = name in json data
        case image
    }
}
