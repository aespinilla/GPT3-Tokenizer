//
//  EncoderTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 6/2/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class EncoderTests: XCTestCase {
    
    private var sut: Encoder!

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGivenTextWhenEncodeThenMatch() throws {
        let input = "This is an example sentence to try encoding out on!"
        let expected = [1212, 318, 281, 1672, 6827, 284, 1949, 21004, 503, 319, 0]
        let output = sut.enconde(text: input)
        XCTAssertEqual(output, expected)
    }
    
    func testGivenTextWithEmojisWhenEncodeThenMatch() throws {
        let input = "hello 👋 world 🌍"
        let expected = [31373, 50169, 233, 995, 12520, 234, 235]
        let output = sut.enconde(text: input)
        XCTAssertEqual(output, expected)
    }
}
