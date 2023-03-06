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
        var bs = range(start:  Character("!"), end: Character("~")) + range(start: Character("¡"), end: Character("¬")) + range(start: Character("®"), end: Character("ÿ"))
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
    
    func range(start: Character, end: Character) -> [Int] {
        guard let startValue = start.utf16.first,
              let endValue = end.utf16.first
        else { return [] }
        return (Int(startValue)...Int(endValue)).map({ $0 })
    }
}
