//
//  BpeRanks.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/2/23.
//

import Foundation

class BpeRanks {
    private let reader: FileReader
    
    init(reader: FileReader = ModuleFileReader()) {
        self.reader = reader
    }
    
    lazy var ranks: [[String]] = {
        guard let data = reader.read(name: "vocab", fileExtension: "bpe"),
                let vocab = String(data: data, encoding: .utf8)
        else { return [] }
        
        return vocab.splitInLinesAndWords
    }()
}
