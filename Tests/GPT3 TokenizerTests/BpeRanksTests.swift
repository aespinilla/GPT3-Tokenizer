//
//  BpeRanksTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 7/2/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class BpeRanksTests: XCTestCase {
    private var sut: BpeRanks!

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGivenDefaultWhenRanksThenMatchCount() throws {
        let output = sut.ranks
        XCTAssertEqual(output.count, 50000)
    }
}
