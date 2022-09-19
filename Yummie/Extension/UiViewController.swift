//
//  UiViewController.swift
//  Yummie
//
//  Created by Mohamed Khaled on 15/09/2022.
//

import UIKit

extension UIViewController{ // to connect pages
    static var indentifier :String{
        return String(describing: self)
    }
    static func instantiate()-> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: indentifier) as! Self
    }
    
}
