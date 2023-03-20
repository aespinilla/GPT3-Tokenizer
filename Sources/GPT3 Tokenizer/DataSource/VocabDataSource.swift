//
//  VocabDataSource.swift
//  
//
//  Created by Alberto Espinilla Garrido on 20/3/23.
//

import Foundation

struct VocabDataSource {
    // https://openaipublic.blob.core.windows.net/gpt-2/encodings/main/vocab.bpe
    private let urlSession: URLSession
    private let decoder: BpeRanksDecoder
    
    init(urlSession: URLSession = .shared, decoder: BpeRanksDecoder = BpeRanksDecoderImpl()) {
        self.urlSession = urlSession
        self.decoder = decoder
    }
    
    func getVocabBpe() async throws -> [Pairs: Int] {
        guard let url = buildUrl() else { return [:] }
        let response = try await urlSession.data(from: url)
        return try decoder.decode(from: response.0)
    }
}

private extension VocabDataSource {
    func buildUrl() -> URL? {
        URL(string: "https://openaipublic.blob.core.windows.net/gpt-2/encodings/main/vocab.bpe")
    }
}
