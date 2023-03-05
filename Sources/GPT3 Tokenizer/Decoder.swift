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
        encode
            .decode(tableCode.decoder)
            .decode(bytesUnicode.decoder)
    }
}

private extension Array where Element == Int {
    func decode(_ decoder: [Int: String]) -> String {
        compactMap({ decoder[$0] }).joined()
    }
}
