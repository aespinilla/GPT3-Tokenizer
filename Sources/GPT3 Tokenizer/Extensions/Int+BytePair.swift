//
//  Int+BytePair.swift
//  
//
//  Created by Alberto Espinilla Garrido on 3/4/23.
//

import Foundation

extension Int {
    var character: Character {
        .init(self)
    }
    
    var isBytePair: Bool {
        let character = character
        return character.isPrintable && !character.isWhitespace
    }
}
