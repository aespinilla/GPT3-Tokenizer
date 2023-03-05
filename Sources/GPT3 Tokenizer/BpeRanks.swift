//
//  BpeRanks.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/2/23.
//

import Foundation

class BpeRanks {
    private let reader: FileReader
    private let decoder: BpeRanksFileReaderDecoder
    
    init(reader: FileReader = ModuleFileReader(), decoder: BpeRanksFileReaderDecoder = .init()) {
        self.reader = reader
        self.decoder = decoder
    }
    
    lazy var ranks: [Pairs: Int] = {
        guard let data: [Pairs: Int] = reader.read(name: "vocab", fileExtension: "bpe", decoder: decoder)
        else { return [:] }
        return data
    }()
}
