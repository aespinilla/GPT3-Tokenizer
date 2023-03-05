//
//  FileReaderDecoder.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/3/23.
//

import Foundation

protocol FileReaderDecoder {
    associatedtype Output
    func decode(from data: Data) throws -> Self.Output
}
