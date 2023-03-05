//
//  FileReader.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/2/23.
//

import Foundation

protocol FileReader {
    func read<T>(name: String, fileExtension: String, decoder: any FileReaderDecoder) -> T?
}

struct ModuleFileReader: FileReader {
    private let bundle: Bundle
    private let fileManager: FileManager
    
    init(bundle: Bundle = .module, fileManager: FileManager = .default) {
        self.bundle = bundle
        self.fileManager = fileManager
    }
    
    func read<T>(name: String, fileExtension: String, decoder: any FileReaderDecoder) -> T? {
        guard let path = bundle.path(forResource: name, ofType: fileExtension),
              let data = fileManager.contents(atPath: path),
              let decoded = try? decoder.decode(from: data) as? T
        else { return nil }
        return decoded
    }
}
