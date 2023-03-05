//
//  TableCodeFileReaderDecoderTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class TableCodeFileReaderDecoderTests: XCTestCase {
    private var sut: TableCodeFileReaderDecoder!

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGivenDataWhenDecodeThenMatch() throws {
        let dictionary: [String: Int] = ["Hello": 10, "world": 20]
        let data = try XCTUnwrap(try JSONEncoder().encode(dictionary))
        let output = try? sut.decode(from: data)
        XCTAssertEqual(output, dictionary)
    }
}