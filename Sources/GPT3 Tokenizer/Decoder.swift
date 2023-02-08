//
//  Decoder.swift
//  
//
//  Created by Alberto Espinilla Garrido on 6/2/23.
//

import Foundation

public struct Decoder {
    private let tableCode: TableCode
    private let bytesUnicode: BytesUnicode
    
    init(tableCode: TableCode = .init(), bytesUnicode: BytesUnicode = .init()) {
        self.tableCode = tableCode
        self.bytesUnicode = bytesUnicode
    }
    /// Encodes the provided token to a sequence of BPE-coded tokens.
    ///
    /// - Parameters:
    ///   - encode: Array containing values to decode
    /// - Returns: String value decoded
    ///
    public func decode(encode: [Int]) -> String? {
        let bytesUnicodeDecoder = bytesUnicode.decoder
        let tableCodeDecoder = tableCode.decoder
        let text = encode.compactMap({ tableCodeDecoder?[$0] }).joined()
        let decoded = text.characterArray.compactMap({ bytesUnicodeDecoder[$0] }).map({ UInt8($0) })
        let data = Data(decoded)
        let result = String(data: data, encoding: .utf8)
        return result
    }
}
