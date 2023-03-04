//
//  String+Split.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import Foundation

extension String {
    var splitInLines: [String] {
        split(separator: "\n", omittingEmptySubsequences: true).toString
    }
    
    var splitWords: [String] {
        split(separator: " ", omittingEmptySubsequences: true).toString
    }
    
    var splitInLinesAndWords: [[String]] {
        splitInLines.map({ $0.splitWords })
    }
}

extension Array where Element == Substring {
    var toString: [String] {
       map({ String($0) })
    }
}
