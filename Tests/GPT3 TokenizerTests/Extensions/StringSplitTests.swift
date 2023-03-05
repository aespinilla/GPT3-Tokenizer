//
//  StringSplitTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class StringSplitTests: XCTestCase {
    
    func testGivenStringWithSpacesWhenSplitWordsThenMatch() throws {
        let expected = ["Hello", "world", "!"]
        let sut = "Hello world !"
        let output = sut.splitWords
        XCTAssertEqual(output, expected)
    }
    
    func testGivenStringWithNoSpacesWhenSplitWordsThenMatch() throws {
        let expected = ["Hello\nworld\n!"]
        let sut = "Hello\nworld\n!"
        let output = sut.splitWords
        XCTAssertEqual(output, expected)
    }
}
