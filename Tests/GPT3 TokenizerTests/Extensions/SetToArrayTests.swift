//
//  SetToArrayTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class SetToArrayTests: XCTestCase {
    func testGivenSetWhenToArrayThenMatch() throws {
        let sut: Set = [1, 2, 3, 4, 5]
        let expected = [1, 2, 3, 4, 5]
        let output = sut.toArray
        XCTAssertEqual(output.count, expected.count)
        XCTAssertEqual(output.sorted(), expected)
    }
}
