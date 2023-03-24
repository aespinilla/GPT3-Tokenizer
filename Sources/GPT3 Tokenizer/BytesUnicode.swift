//
//  BytesUnicode.swift
//  
//
//  Created by Alberto Espinilla Garrido on 6/2/23.
//

import Foundation

class BytesUnicode {
    var encoder: [Int: String] {
        bytesToUnicode
    }
    
    var decoder: [String: Int] {
        encoder.inverted
    }
    
    private lazy var bytesToUnicode: [Int: String] = {
        var bs = (0..<exponentialPow)
            .filter({ $0.isBytePair })
        var cs = bs.map({ $0 })
        
        var n = 0
        (0..<exponentialPow)
            .forEach({
                if !bs.contains($0) {
                    bs.append($0)
                    cs.append(exponentialPow + n)
                    n += 1
                }
            })
        
        let characterSet = cs.map({ UInt16($0) }).map({ String(String(decoding: [$0], as: UTF16.self)) })
        var result: [Int: String] = .init()
        zip(bs, characterSet).forEach({ result[$0] = $1 })
        return result
    }()
}

private extension BytesUnicode {
    var exponentialPow: Int {
        Int(pow(Double(2), Double(8)))
    }
}

extension Int {
    var character: Character {
        .init(self)
    }
    
    var isBytePair: Bool {
        let character = character
        return character.isPrintable && !character.isWhitespace
    }
}
