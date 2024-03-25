//
//  String+Extension.swift
//  GroceryApp
//
//  Created by Ajay Kumar on 25/03/24.
//

import Foundation

extension String{
    
    var asUrl: URL? {
        return URL(string: self)
    }
}
