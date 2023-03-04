//
//  TableCode.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/2/23.
//

import Foundation

typealias EncoderMap = [String: Int]
typealias DecoderMap = [Int: String]

class TableCode {
    private let reader: FileReader
    private let jsonDecoder: JSONDecoder
    
    init(reader: FileReader = ModuleFileReader(), jsonDecoder: JSONDecoder = .init()) {
        self.reader = reader
        self.jsonDecoder = jsonDecoder
    }
    
    var encoder: EncoderMap? {
        tableCode
    }
    
    var decoder: DecoderMap? {
        tableCode.inverted
    }
    
    private lazy var tableCode: [String: Int] = {
        guard let data = reader.read(name: "encoder", fileExtension: "json"),
              let dictionary = try? jsonDecoder.decode([String: Int].self, from: data)
        else { return [:] }
        return dictionary
    }()
}
