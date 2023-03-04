//
//  Set+ToArray.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import Foundation

extension Set {
    var toArray: [Element] {
        Array(self)
    }
}
