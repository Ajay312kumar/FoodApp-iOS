//
//  UIView+Extension.swift
//  GroceryApp
//
//  Created by Ajay Kumar on 14/03/24.
//

import Foundation
import UIKit


extension UIView{
    
    @IBInspectable var cornerRadius: CGFloat{
        get { return cornerRadius }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    
}
