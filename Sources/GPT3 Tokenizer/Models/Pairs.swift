//
//  Pairs.swift
//  
//
//  Created by Alberto Espinilla Garrido on 6/2/23.
//

import Foundation

struct Pairs: Equatable, Hashable {
    let first: String
    let second: String
    
    var join: String {
        first + second
    }
}
