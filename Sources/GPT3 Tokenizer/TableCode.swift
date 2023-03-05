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
    private let tableCodeDecoder: TableCodeFileReaderDecoder
    
    init(reader: FileReader = ModuleFileReader(), tableCodeDecoder: TableCodeFileReaderDecoder = .init()) {
        self.reader = reader
        self.tableCodeDecoder = tableCodeDecoder
    }
    
    var encoder: EncoderMap {
        tableCode
    }
    
    var decoder: DecoderMap {
        tableCode.inverted
    }
    
    private lazy var tableCode: [String: Int] = {
        guard let data = reader.read(name: "encoder", fileExtension: "json"),
              let tableCode = try? tableCodeDecoder.decode(from: data)
        else { return [:] }
        return tableCode
    }()
}
