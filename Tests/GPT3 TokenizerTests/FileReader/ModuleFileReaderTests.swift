//
//  ModuleFileReaderTests.swift
//  
//
//  Created by Alberto Espinilla Garrido on 4/3/23.
//

import XCTest
@testable import GPT3_Tokenizer

final class ModuleFileReaderTests: XCTestCase {
    private let decoderMock: ModuleFileReaderTests.MockFileReaderDecoder = .init()
    private var sut: FileReader!

    override func setUpWithError() throws {
        sut = ModuleFileReader()
    }
    
    override func tearDownWithError() throws {
        decoderMock.reset()
        sut = nil
    }

    func testGivenNameAndExtensionWhenReadThenNotNil() throws {
        let input = [("encoder", "json"), ("vocab", "bpe")]
        input.forEach({
            decoderMock.reset()
            let output: ModuleFileReaderTests.Test? = sut.read(name: $0.0, fileExtension: $0.1, decoder: decoderMock)
            XCTAssertNotNil(output)
            XCTAssertEqual(decoderMock.times, 1)
        })
    }
    
    func testGivenNameAndExtensionWhenReadAndNoExitsThenMatchNil() throws {
        let input = [("sample", "txt"), ("other", "sample")]
        input.forEach({
            decoderMock.reset()
            let output: ModuleFileReaderTests.Test? = sut.read(name: $0.0, fileExtension: $0.1, decoder: decoderMock)
            XCTAssertNil(output)
            XCTAssertEqual(decoderMock.times, 0)
        })
    }
}

private extension ModuleFileReaderTests {
    struct Test {
        let foo = "bar"
    }
    
    class MockFileReaderDecoder: FileReaderDecoder {
        typealias Output = ModuleFileReaderTests.Test
        
        private(set) var times: Int = 0
        private let mock: ModuleFileReaderTests.Test = .init()
        
        func decode(from data: Data) throws -> ModuleFileReaderTests.Test {
            times += 1
            return mock
        }
        
        func reset() {
            times = 0
        }
    }
}
