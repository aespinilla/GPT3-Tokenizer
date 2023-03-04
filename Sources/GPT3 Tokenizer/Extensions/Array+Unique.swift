//
//  Array+Unique.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import Foundation

extension Array where Element: Hashable {
    var unique: [Element] {
        Set(self).toArray
    }
}
