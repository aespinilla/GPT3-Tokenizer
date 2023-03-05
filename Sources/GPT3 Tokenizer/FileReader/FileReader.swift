//
//  FileReader.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/2/23.
//

import Foundation

protocol FileReader {
    func read(name: String, fileExtension: String) -> Data?
}

struct ModuleFileReader: FileReader {
    private let bundle: Bundle
    private let fileManager: FileManager
    
    init(bundle: Bundle = .module, fileManager: FileManager = .default) {
        self.bundle = bundle
        self.fileManager = fileManager
    }
    
    func read(name: String, fileExtension: String) -> Data? {
        guard let path = bundle.path(forResource: name, ofType: fileExtension),
              let data = fileManager.contents(atPath: path)
        else { return nil }
        return data
    }
}
