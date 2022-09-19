//
//  Route.swift
//  Yummie
//
//  Created by Mohamed Khaled on 16/09/2022.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me" // url //called without object and is public for all classes
    case fetchAllCategories                     // called endpoint
    case placeOrder(String)
    case fetchCategoryDishes(String)
    case fetchOrders
    var description: String {         // create var to return path to end poin
        switch self{
        case .fetchAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .fetchCategoryDishes(let categoryId):
            return "/dishes/\(categoryId)"
        case.fetchOrders :
            return"/orders"
        }
    
    }
}
