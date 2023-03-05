//
//  StringCharacterArrayTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class StringCharacterArrayTests: XCTestCase {
    func testGivenStringWhenCharacterArrayThenMatch() throws {
        let sut = "Hello world!"
        let expected: CharacterArray = ["H", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"]
        let output = sut.characterArray
        XCTAssertEqual(output, expected)
    }
    
    func testGivenCharacterArrayWhenToStringThenMatch() throws {
        let expected = "H e l l o   w o r l d !"
        let sut: CharacterArray = ["H", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"]
        let output = sut.toString
        XCTAssertEqual(output, expected)
    }
    
    func testGivenStringAndEmptyDecoderWhenDecodedThenMatch() throws {
        let sut = "Hello"
        let output = sut.decode([:])
        XCTAssertEqual(output, "")
    }
    
    func testGivenStringAndDecoderWhenDecodedThenMatch() throws {
        let decoder = ["H": 0, "e": 1, "l": 2, "o": 3]
        let sut = "Hello"
        let expected = "\0\u{01}\u{02}\u{02}\u{03}"
        let output = sut.decode(decoder)
        XCTAssertEqual(output, expected)
    }
}
