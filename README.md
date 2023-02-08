# GPT3 Tokenizer
GPT3 encoder & decoder tool written in Swift

## About
GPT-2 and GPT-3 use byte pair encoding to turn text into a series of integers to feed into the model. This is a Swift implementation of OpenAI's original python encoder/decoder which can be found [here](https://github.com/openai/gpt-2) and based on this Javascript implementation [here](https://github.com/latitudegames/GPT-3-Encoder)

## Install with Swift Package Manager

Add this repository url to Swift Package Manager

```
https://github.com/aespinilla/GPT3-Tokenizer.git
```

## Usage

```swift
import GPT3_Tokenizer

let gpt3Tokenizer = GPT3Tokenizer()

let text = "hello 👋 world 🌍"

// Encode
let encoded = gpt3Tokenizer.encoder.enconde(text: text)
print(encoded)

// Decode
let decoded = gpt3Tokenizer.decoder.decode(encode: encoded)
print(decoded)

```
