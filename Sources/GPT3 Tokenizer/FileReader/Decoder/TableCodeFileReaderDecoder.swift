//
//  TableCodeFileReaderDecoder.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/3/23.
//

import Foundation

struct TableCodeFileReaderDecoder: FileReaderDecoder {
    typealias Output = [String: Int]
    
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = .init()) {
        self.decoder = decoder
    }
    
    func decode(from data: Data) throws -> Output {
        try decoder.decode([String: Int].self, from: data)
    }
}
