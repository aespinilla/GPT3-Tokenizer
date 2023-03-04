//
//  DictionaryInvertedTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 3/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class DictionaryInvertedTests: XCTestCase {
    func testGivenStringIntDictionaryWhenInvertedThenMatch() throws {
        let sut = [
            "A": 0,
            "B": 1,
            "C": 2
        ]
        
        let expected = [
            0: "A",
            1: "B",
            2: "C"
        ]
        
        let output = sut.inverted
        XCTAssertEqual(output, expected)
    }
    
    func testGivenIntStringDictionaryWhenInvertedThenMatch() throws {
        let sut = [
            0: "A",
            1: "B",
            2: "C"
        ]
        
        let expected = [
            "A": 0,
            "B": 1,
            "C": 2
        ]
        
        let output = sut.inverted
        XCTAssertEqual(output, expected)
    }
}
