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
}
