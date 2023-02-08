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
    
    init(reader: FileReader = ModuleFileReader()) {
        self.reader = reader
    }
    
    var encoder: EncoderMap? {
        tableCode
    }
    
    var decoder: DecoderMap? {
        var result: [Int: String] = .init()
        tableCode.forEach({ result[$1] = $0 })
        return result
    }
    
    private lazy var tableCode: [String: Int] = {
        guard let data = reader.read(name: "encoder", fileExtension: "json") else { return [:] }
        return (try? JSONSerialization.jsonObject(with: data) as? [String: Int]) ?? [:]
    }()
}
