//
//  UiView_Extension.swift
//  Yummie
//
//  Created by Mohamed Khaled on 13/09/2022.
//

import Foundation
import UIKit
 // to create cornerRadius
extension UIView{
        @IBInspectable var cornerRadius : CGFloat {
        get{return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
            
        }
    }
}
