//
//  Encoder.swift
//  
//
//  Created by Alberto Espinilla Garrido on 5/2/23.
//

import Foundation

public class Encoder {
    private let regex: NSRegularExpression?
    
    private let bytesUnicode: BytesUnicode
    private let tableCode: TableCode
    private let bpeRanks: BpeRanks
    
    private var cache: [String: String] = .init()
    
    init(bytesUnicode: BytesUnicode = .init(), tableCode: TableCode = .init(), bpeRanks: BpeRanks = .init()) {
        self.regex = try? NSRegularExpression(pattern: "/'s|'t|'re|'ve|'m|'ll|'d| ?\\p{L}+| ?\\p{N}+| ?[^\\s\\p{L}\\p{N}]+|\\s+(?!\\S)|\\s+/gu")
        self.bytesUnicode = bytesUnicode
        self.tableCode = tableCode
        self.bpeRanks = bpeRanks
    }
    
    /// Encodes the provided token to a sequence of BPE-coded tokens.
    ///
    /// - Parameters:
    ///   - text: Value  to encode
    /// - Returns: Array containing the BPE-coded tokens.
    ///
    public func enconde(text: String) -> [Int] {
        let matches = matches(in: text)
        let bytesToUnicode = bytesUnicode.encoder
        
        let reencodeds = matches
            .map({ match in
                let reencoded = match.utf8Integers.compactMap({ bytesToUnicode[$0] }).joined()
                return reencoded
            })
        
        let encoder = tableCode.encoder
        let encode = reencodeds
            .compactMap({ bpe(token: $0).splitWords.compactMap({ encoder?[String($0)] }) })
            .flatMap({ $0 })
        return encode
    }
}

private extension Encoder {
    func matches(in text: String) -> [String] {
        guard let results = regex?.matches(in: text,
                                           range: NSRange(text.startIndex..., in: text))
        else { return [] }
        return results.compactMap({ Range($0.range, in: text).map({ String(text[$0]) }) })
    }
    
    func bpe(token: String) -> String {
        if let bpe = cache[token] {
            return bpe
        }
        
        var word = token.characterArray
        let bpeRanks = bpeRanks.ranks
        var pairs = word.pairs
        
        while true {
            var minPairs: [Int: Pairs] = .init()
            pairs.forEach({ pair in
                guard let rank = bpeRanks.firstIndex(where: { $0 == pair }) else { return }
                minPairs[rank] = pair
            })
            
            guard let min = minPairs.keys.min(),
                  let bigram = minPairs[min]
            else { break }
            
            word = word.newWord(bigram: bigram)
            if (word.count == 1) {
                break
            } else {
                pairs = word.pairs
            }
        }
        
        let result = word.toString
        cache[token] = result
        return result
    }
}

private extension CharacterArray {
    var pairs: [Pairs] {
        prevCurrent({ Pairs(first: $0, second: $1) }).unique
    }
    
    func newWord(bigram: Pairs) -> Self {
        var i = 0
        var newWord: CharacterArray = .init()
        
        while i < count {
            guard let j = self[i...].firstIndex(of: bigram.first)
            else {
                newWord.append(contentsOf: self[i...])
                break
            }
            newWord.append(contentsOf: self[i..<j])
            i = j
            
            if self[i] == bigram.first, i < count - 1, self[i+1] == bigram.second {
                newWord.append(bigram.join)
                i += 2
            } else {
                newWord.append(self[i])
                i += 1
            }
        }
        
        return newWord
    }
}
