//
//  BpeRanksDecoder.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/3/23.
//

import Foundation

protocol BpeRanksDecoder {
    func decode(from data: Data) throws -> [Pairs: Int]
}

struct BpeRanksDecoderImpl: BpeRanksDecoder {
    func decode(from data: Data) throws -> [Pairs: Int] {
        guard let vocab = String(data: data, encoding: .utf8)
        else { return [:] }
        
        return vocab.split(separator: "\n", omittingEmptySubsequences: true)
            .compactMap({
                let line = String($0).splitWords
                guard let first = line.first, let last = line.last else { return nil }
                return Pairs(first: first, second: last)
            })
            .enumerated()
            .reduce(into: [:]) { $0[$1.element] = $1.offset }
    }
}
