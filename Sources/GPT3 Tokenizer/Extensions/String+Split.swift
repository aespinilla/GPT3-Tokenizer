//
//  String+Split.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import Foundation

extension String {
    var splitWords: [String] {
        split(separator: " ", omittingEmptySubsequences: true).toString
    }
}

extension Array where Element == Substring {
    var toString: [String] {
       map({ String($0) })
    }
}
