//
//  ModuleFileReaderTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class ModuleFileReaderTests: XCTestCase {
    private var sut: FileReader!

    override func setUpWithError() throws {
        sut = ModuleFileReader()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func testGivenNameAndExtensionWhenReadThenNotNil() throws {
        let input = [("encoder", "json"), ("vocab", "bpe")]
        input.forEach({
            let output = sut.read(name: $0.0, fileExtension: $0.1)
            XCTAssertNotNil(output)
        })
    }
    
    func testGivenNameAndExtensionWhenReadAndNoExitsThenMatchNil() throws {
        let input = [("sample", "txt"), ("other", "sample")]
        input.forEach({
            let output = sut.read(name: $0.0, fileExtension: $0.1)
            XCTAssertNil(output)
        })
    }
}
