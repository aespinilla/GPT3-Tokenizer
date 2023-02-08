import XCTest
@testable import GPT3_Tokenizer

final class GPT3TokenizerTests: XCTestCase {
    private var sut: GPT3Tokenizer!
    
    override func setUpWithError() throws {
        sut = .init()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGivenPromptsAndEncodeWhenEncodeAndDecodeThenMatch() throws {
        let inputs = [
            Test(input: "This is an example sentence to try encoding out on!", output: [1212, 318, 281, 1672, 6827, 284, 1949, 21004, 503, 319, 0]),
            Test(input: "hello 👋 world 🌍", output: [31373, 50169, 233, 995, 12520, 234, 235]),
            Test(input: "This is a long text in english and spanish with emojis likes 👨🏻‍💻 or 🧜‍♂️. Now this a text starting in english y después en español para comprobar la longitud de tokens. Que cosas más raras tiene gpt3 y tokenizer.", output: [1212, 318, 257, 890, 2420, 287, 46932, 290, 599, 7115, 351, 795, 13210, 271, 7832, 50169, 101, 8582, 237, 119, 447, 235, 8582, 240, 119, 393, 12520, 100, 250, 447, 235, 17992, 224, 37929, 13, 2735, 428, 257, 2420, 3599, 287, 46932, 331, 11267, 84, 20954, 551, 1658, 8957, 12654, 349, 31215, 552, 305, 5657, 8591, 890, 26331, 390, 16326, 13, 4670, 8615, 292, 285, 40138, 374, 283, 292, 46668, 1734, 308, 457, 18, 331, 11241, 7509, 13])
        ]
        inputs.forEach({
            let encodedOutput = sut.encoder.enconde(text: $0.input)
            let decodedOutput = sut.decoder.decode(encode: encodedOutput)
            XCTAssertEqual(encodedOutput, $0.output)
            XCTAssertEqual(decodedOutput, $0.input)
        })
    }
}
