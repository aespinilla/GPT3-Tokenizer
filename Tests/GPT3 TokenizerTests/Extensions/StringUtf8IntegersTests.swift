//
//  StringUtf8IntegersTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class StringUtf8IntegersTests: XCTestCase {
    func testGivenStringWhenUtf8IntegersThenMatch() throws {
        let sut = "Hello world!"
        let expected = [72, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100, 33]
        let output = sut.utf8Integers
        XCTAssertEqual(output, expected)
    }
}
