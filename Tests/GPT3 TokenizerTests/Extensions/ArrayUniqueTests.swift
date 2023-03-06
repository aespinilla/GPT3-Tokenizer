//
//  ArrayUniqueTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class ArrayUniqueTests: XCTestCase {
    func testGivenArrayWithRepeatedValueWhenToUniqueThenMatch() throws {
        let sut = [1, 2, 1, 3, 5, 4, 5, 3]
        let expected = [1, 2, 3, 4, 5]
        let output = sut.unique
        XCTAssertEqual(output.count, expected.count)
        XCTAssertEqual(output.sorted(), expected)
    }
}
