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
    
    func decode(_ decoder: [String: Int]) -> String? {
        let decoded: [UInt8] = compactMap({
            let item = String($0)
            guard let value = decoder[item] else { return nil }
            return UInt8(value)
        })
        let data = Data(decoded)
        let result = String(data: data, encoding: .utf8)
        return result
    }
}

extension CharacterArray {
    var toString: String {
        joined(separator: " ")
    }
}
