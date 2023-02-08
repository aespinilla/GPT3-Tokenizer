//
//  DecoderTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 6/2/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class DecoderTests: XCTestCase {
    
    private var sut: Decoder!

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGivenEncodedWhenDecodedThenMatch() throws {
        let input = [1212, 318, 281, 1672, 6827, 284, 1949, 21004, 503, 319, 0]
        let expected = "This is an example sentence to try encoding out on!"
        let output = sut.decode(encode: input)
        XCTAssertEqual(output, expected)
    }
    
    func testGivenEncodedWithEmojisWhenDecodedThenMatch() throws {
        let input = [31373, 50169, 233, 995, 12520, 234, 235]
        let expected = "hello 👋 world 🌍"
        let output = sut.decode(encode: input)
        XCTAssertEqual(output, expected)
    }
}
