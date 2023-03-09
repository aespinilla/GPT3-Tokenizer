//
//  TableCodeDecoder.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/3/23.
//

import Foundation

protocol TableCodeDecoder {
    func decode(from data: Data) throws -> [String: Int]
}

struct TableCodeDecoderImpl: TableCodeDecoder {
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = .init()) {
        self.decoder = decoder
    }
    
    func decode(from data: Data) throws -> [String: Int] {
        try decoder.decode([String: Int].self, from: data)
    }
}
