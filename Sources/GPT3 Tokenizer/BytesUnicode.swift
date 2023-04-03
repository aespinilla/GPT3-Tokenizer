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
        var bs = (0..<Int(pow(2.0, 8))).filter({ $0.isBytePair })
        var cs = bs.map({ $0 })
        
        var n = 0
        (0..<Int(pow(2.0, 8)) )
            .forEach({
                if !bs.contains($0) {
                    bs.append($0)
                    cs.append(Int(pow(2.0, 8)) + n)
                    n += 1
                }
            })
        
        let characterSet = cs.map({ UInt16($0) }).map({ String(String(decoding: [$0], as: UTF16.self)) })
        var result: [Int: String] = .init()
        zip(bs, characterSet).forEach({ result[$0] = $1 })
        return result
    }()
}
