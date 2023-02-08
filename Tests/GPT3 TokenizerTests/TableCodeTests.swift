//
//  TableCodeTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 7/2/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class TableCodeTests: XCTestCase {
    private var sut: TableCode!

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGivenDefaultWhenEncoderThenMatchCount() throws {
        let output = sut.encoder
        XCTAssertEqual(try XCTUnwrap(output).count, 50257)
    }
    
    func testGivenDefaultWhenDecoderThenMatchCount() throws {
        let output = sut.decoder
        XCTAssertEqual(try XCTUnwrap(output).count, 50257)
    }
}
