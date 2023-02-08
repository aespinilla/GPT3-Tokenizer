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
                let items = Array(match.utf8).map({ Int($0) })
                let reencoded = items.compactMap({ bytesToUnicode[$0] }).joined()
                return reencoded
            })
        
        let encoder = tableCode.encoder
        let encode = reencodeds
            .compactMap({ bpe(token: $0).split(separator: " ").compactMap({ encoder?[String($0)] }) })
            .flatMap({ $0 })
        return encode
    }
}

private extension Encoder {
    func matches(in text: String) -> [String] {
        guard let results = regex?.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        else { return [] }
        return results.compactMap({ Range($0.range, in: text).map { String(text[$0]) } })
    }
    
    func bpe(token: String) -> String {
        if let bpe = cache[token] {
            return bpe
        }
        
        var word = token.characterArray
        let bpeRanks = bpeRanks.ranks
        var pairs = getPairs(word: word)
        
        while true {
            var minPairs: [Int: Pairs] = .init()
            pairs.forEach({ pair in
                if let rank = bpeRanks.firstIndex(where: { $0[0] == pair.first && $0[1] == pair.second }) {
                    minPairs[rank] = pair
                }
            })
            
            guard let min = minPairs.keys.min(),
                  let bigram = minPairs[min]
            else { break }
            
            word = newWord(word: word, bigram: bigram)
            if (word.count == 1) {
                break
            } else {
                pairs = getPairs(word: word)
            }
        }
        
        let result = word.joined(separator: " ")
        cache[token] = result
        return result
    }
    
    func newWord(word: CharacterArray, bigram: Pairs) -> CharacterArray {
        var i = 0
        var newWord: CharacterArray = .init()
        
        while i < word.count {
            guard let j = word[i...].firstIndex(of: bigram.first)
            else {
                newWord.append(contentsOf: word[i...])
                break
            }
            newWord.append(contentsOf: word[i..<j])
            i = j
            
            if word[i] == bigram.first, i < word.count - 1, word[i+1] == bigram.second {
                newWord.append(bigram.join)
                i += 2
            } else {
                newWord.append(word[i])
                i += 1
            }
        }
        
        return newWord
    }
    
    func getPairs(word: CharacterArray) -> [Pairs] {
        var mutatedWord = word
        var pairs: Set<Pairs> = .init()
        var prev = mutatedWord.removeFirst()
        mutatedWord.forEach({
            pairs.insert(.init(first: prev, second: $0))
            prev = $0
        })
        return Array(pairs)
    }
}
