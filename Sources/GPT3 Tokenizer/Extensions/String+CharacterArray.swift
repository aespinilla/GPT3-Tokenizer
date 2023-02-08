//
//  String+CharacterArray.swift
//  
//
//  Created by Alberto Espinilla Garrido on 6/2/23.
//

import Foundation

typealias CharacterArray = [String]

extension String {
    var characterArray: CharacterArray {
        map({ String($0) })
    }
}
