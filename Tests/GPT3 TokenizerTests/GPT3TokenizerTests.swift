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
            Test(input: "This is a long text in english and spanish with emojis likes 👨🏻‍💻 or 🧜‍♂️. Now this a text starting in english y después en español para comprobar la longitud de tokens. Que cosas más raras tiene gpt3 y tokenizer.", output: [1212, 318, 257, 890, 2420, 287, 46932, 290, 599, 7115, 351, 795, 13210, 271, 7832, 50169, 101, 8582, 237, 119, 447, 235, 8582, 240, 119, 393, 12520, 100, 250, 447, 235, 17992, 224, 37929, 13, 2735, 428, 257, 2420, 3599, 287, 46932, 331, 11267, 84, 20954, 551, 1658, 8957, 12654, 349, 31215, 552, 305, 5657, 8591, 890, 26331, 390, 16326, 13, 4670, 8615, 292, 285, 40138, 374, 283, 292, 46668, 1734, 308, 457, 18, 331, 11241, 7509, 13]),
            Test(input: "Doña Uzeada de Ribera Maldonado de Bracamonte y Anaya era baja, rechoncha, abigotada. Ya no existia razon para llamar talle al suyo. Sus colores vivos, sanos, podian mas que el albayalde y el soliman del afeite, con que se blanqueaba por simular melancolias. Gastaba dos parches oscuros, adheridos a las sienes y que fingian medicamentos. Tenia los ojitos ratoniles, maliciosos. Sabia dilatarlos duramente o desmayarlos con recato o levantarlos con disimulo. Caminaba contoneando las imposibles caderas y era dificil, al verla, no asociar su estampa achaparrada con la de ciertos palmipedos domesticos. Sortijas celestes y azules le ahorcaban las falanges 🧝🏿‍♂️ 💃🏼 📱", output: [5211, 30644, 40919, 1329, 64, 390, 371, 1856, 64, 37490, 261, 4533, 390, 1709, 330, 16487, 660, 331, 1052, 11729, 6980, 275, 27792, 11, 302, 354, 261, 11693, 11, 450, 328, 313, 4763, 13, 26421, 645, 2152, 544, 374, 5168, 31215, 32660, 39236, 3305, 293, 435, 424, 8226, 13, 8932, 951, 2850, 410, 452, 418, 11, 5336, 418, 11, 24573, 666, 12422, 8358, 1288, 435, 24406, 35885, 331, 1288, 1540, 24086, 1619, 257, 5036, 578, 11, 369, 8358, 384, 698, 272, 4188, 15498, 16964, 985, 934, 7758, 1192, 349, 4448, 13, 31486, 15498, 23430, 1582, 2052, 267, 1416, 1434, 82, 11, 512, 372, 312, 418, 257, 39990, 264, 2013, 274, 331, 8358, 8038, 666, 6924, 3263, 418, 13, 9368, 544, 22346, 267, 45051, 418, 4227, 261, 2915, 11, 6428, 291, 4267, 418, 13, 9910, 544, 11844, 265, 7063, 418, 22365, 3263, 68, 267, 748, 11261, 7063, 418, 369, 664, 5549, 267, 443, 4520, 7063, 418, 369, 595, 320, 43348, 13, 327, 5669, 15498, 542, 505, 25440, 39990, 848, 418, 18764, 269, 5067, 292, 331, 6980, 288, 811, 346, 11, 435, 3326, 5031, 11, 645, 355, 1733, 283, 424, 1556, 13299, 257, 354, 499, 3258, 4763, 369, 8591, 390, 269, 72, 861, 418, 18057, 46647, 418, 5928, 418, 13, 33947, 2926, 292, 18725, 395, 274, 331, 35560, 5028, 443, 257, 17899, 66, 45094, 39990, 24215, 6231, 12520, 100, 251, 8582, 237, 123, 447, 235, 17992, 224, 37929, 12520, 240, 225, 8582, 237, 120, 12520, 241, 109])
        ]
        inputs.forEach({
            let encodedOutput = sut.encoder.enconde(text: $0.input)
            let decodedOutput = sut.decoder.decode(encode: encodedOutput)
            XCTAssertEqual(encodedOutput, $0.output)
            XCTAssertEqual(decodedOutput, $0.input)
        })
    }
}
