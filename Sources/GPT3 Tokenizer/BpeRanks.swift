//
//  BpeRanks.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/2/23.
//

import Foundation

class BpeRanks {
    private let reader: FileReader
    private let decoder: BpeRanksDecoder
    
    init(reader: FileReader = ModuleFileReader(), decoder: BpeRanksDecoder = BpeRanksDecoderImpl()) {
        self.reader = reader
        self.decoder = decoder
    }
    
    lazy var ranks: [Pairs: Int] = {
        guard let data = reader.read(name: "vocab", fileExtension: "bpe"),
              let ranks = try? decoder.decode(from: data)
        else { return [:] }
        return ranks
    }()
}
