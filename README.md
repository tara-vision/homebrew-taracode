# homebrew-taracode

Official Homebrew tap for [taracode](https://github.com/tara-vision/taracode) - DevOps & Cloud AI Assistant.

## Install

```bash
brew tap tara-vision/taracode
brew install taracode
```

Or in one command:

```bash
brew install tara-vision/taracode/taracode
```

## Requirements

taracode requires [Ollama](https://ollama.ai) for local LLM inference:

```bash
brew install ollama
ollama pull gemma3:27b
```

## Usage

```bash
cd your-project
taracode
> /init    # Initialize project features
```

## Documentation

See the [taracode repository](https://github.com/tara-vision/taracode) for full documentation.

## License

MIT License
