//
//  ApiResponse.swift
//  Yummie
//
//  Created by Mohamed Khaled on 17/09/2022.
//

import Foundation
struct ApiResponse<T:Decodable>:Decodable{
    //T dynamic varaible
    let status : Int
    let message : String?
    let data : T?
    let error : String?
    
}
