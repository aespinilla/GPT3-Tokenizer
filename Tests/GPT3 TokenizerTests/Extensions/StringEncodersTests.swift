//
//  StringEncodersTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class StringEncodersTests: XCTestCase {
    func testGivenStringAndEmptyEncoderWhenBytesToUnicodeThenMatch() throws {
        let sut = "Hello"
        let expected = ""
        let output = sut.bytesToUnicode(encoder: [:])
        XCTAssertEqual(output, expected)
    }
    
    func testGivenStringAndEncoderWhenBytesToUnicodeThenMatch() throws {
        let mockEncoder = [72: "m", 101: "a", 108: "n", 111: "y"]
        let sut = "Hello"
        let expected = "manny"
        let output = sut.bytesToUnicode(encoder: mockEncoder)
        XCTAssertEqual(output, expected)
    }
    
    func testGivenStringAndEmptyEncoderWhenEncodeThenMatch() throws {
        let sut = "Hello"
        let expected: [Int] = []
        let output = sut.encode(encoder: [:])
        XCTAssertEqual(output, expected)
    }
    
    func testGivenStringAndEncoderWhenEncodeThenMatch() throws {
        let mockEncoder = ["Hello": 100, "World": 200]
        let sut = "Hello World"
        let expected = [100, 200]
        let output = sut.encode(encoder: mockEncoder)
        XCTAssertEqual(output, expected)
    }
    
}
