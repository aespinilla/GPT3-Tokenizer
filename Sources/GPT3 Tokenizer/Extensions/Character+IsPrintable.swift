//
//  Character+IsPrintable.swift
//  
//
//  Created by Alberto Espinilla Garrido on 24/3/23.
//

import Foundation

extension Character {
    var isPrintable: Bool {
        return unicodeScalars.contains(where: { $0.isPrintable })
    }
}

extension Character {
    init(_ i: Int) {
        self.self = Character(UnicodeScalar(i)!)
    }
}

extension Unicode.Scalar {
    var isPrintable: Bool {
        switch properties.generalCategory {
        case .control, .format: return false
        default: return true
        }
    }
}
