//
//  String+Utf8Integers.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import Foundation

extension String {
    var utf8Integers: [Int] {
        Array(self.utf8).map({ Int($0) })
    }
}
