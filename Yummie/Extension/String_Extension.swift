//
//  String_Extension.swift
//  Yummie
//
//  Created by Mohamed Khaled on 14/09/2022.
//

import Foundation

extension String {
    var asUrl:URL?{
        return URL(string: self)
    }
}
