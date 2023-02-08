public struct GPT3Tokenizer {
    private let bytesUnicode: BytesUnicode
    private let tableCode: TableCode
    private let bpeRanks: BpeRanks
    
    public init() {
        let reader: FileReader = ModuleFileReader()
        self.bytesUnicode = .init()
        self.tableCode = .init(reader: reader)
        self.bpeRanks = .init(reader: reader)
    }
    
    init(reader: FileReader = ModuleFileReader()) {
        self.bytesUnicode = .init()
        self.tableCode = .init(reader: reader)
        self.bpeRanks = .init(reader: reader)
    }
    
    public lazy var encoder: Encoder = {
        .init(bytesUnicode: bytesUnicode,
              tableCode: tableCode,
              bpeRanks: bpeRanks)
    }()
    
    public lazy var decoder: Decoder = {
        .init(tableCode: tableCode, bytesUnicode: bytesUnicode)
    }()
}
