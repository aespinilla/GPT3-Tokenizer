//
//  BytesUnicodeTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 7/2/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class BytesUnicodeTests: XCTestCase {
    
    private var sut: BytesUnicode!

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGivenDefaultWhenDecoderThenMatch() throws {
        let output = sut.decoder
        XCTAssertEqual(output.count, 256)
    }
    
    func testGivenDefaultWhenEncoderThenMatch() throws {
        let output = sut.encoder
        XCTAssertEqual(output.count, 256)
    }
}
