//
//  ArrayPrevCurrentTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class ArrayPrevCurrentTests: XCTestCase {

    func testGivenArrayWhenPrevCurrentTheMatch() throws {
        let sut = [1, 2, 3, 4, 5]
        let expected = [Test(prev: 1, current: 2), Test(prev: 2, current: 3), Test(prev: 3, current: 4), Test(prev: 4, current: 5)]
        let output = sut.prevCurrent({ Test(prev: $0, current: $1) })
        XCTAssertEqual(output, expected)
    }
}

private extension ArrayPrevCurrentTests {
    struct Test: Equatable {
        let prev: Int
        let current: Int
    }
}
