//
//  String+Encoders.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import Foundation

extension String {
    func bytesToUnicode(encoder: [Int: String]) -> String {
        utf8.compactMap({
            let value = Int($0)
            return encoder[value]
        })
        .joined()
    }
    
    func encode(encoder: [String: Int]) -> [Int] {
        splitWords.compactMap({ encoder[$0] })
    }
}
