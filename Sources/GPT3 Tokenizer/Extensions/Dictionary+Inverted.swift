//
//  Dictionary+Inverted.swift
//  
//
//  Created by Alberto Espinilla Garrido on 3/3/23.
//

import Foundation

extension Dictionary where Key: Hashable, Value: Hashable {
    var inverted: Dictionary<Value, Key> {
        Dictionary<Value, Key>(uniqueKeysWithValues: lazy.map { ($0.value, $0.key) })
    }
}
