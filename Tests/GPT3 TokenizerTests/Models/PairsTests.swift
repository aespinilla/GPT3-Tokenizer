//
//  PairsTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class PairsTests: XCTestCase {
    func testGivenPairsWhenJoinThenMatch() throws {
        let first = "First"
        let second = "Second"
        let expected = first + second
        let sut = Pairs(first: first, second: second)
        let output = sut.join
        XCTAssertEqual(output, expected)
    }
}
