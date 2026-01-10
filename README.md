# homebrew-taracode

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

Official Homebrew tap for [Tara Code](https://github.com/tara-vision/taracode), the AI-powered CLI assistant for software development.

## Installation

```bash
brew tap tara-vision/taracode
brew install taracode
```

## Updating

```bash
brew update
brew upgrade taracode
```

## Configuration

After installation, set your LLM server:

```bash
# For Ollama
export TARACODE_HOST=http://localhost:11434

# For vLLM
export TARACODE_HOST=http://your-vllm-server:8000

# For llama.cpp
export TARACODE_HOST=http://localhost:8080
```

The vendor type is automatically detected from the host URL.

For full documentation, see the [main repository](https://github.com/tara-vision/taracode).

## Troubleshooting

### Installation fails

```bash
# Try reinstalling
brew uninstall taracode
brew untap tara-vision/taracode
brew tap tara-vision/taracode
brew install taracode
```

### Checksum mismatch

This may occur after a new release. Try updating Homebrew:

```bash
brew update
brew install taracode
```

If the issue persists, please [open an issue](https://github.com/tara-vision/homebrew-taracode/issues).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for formula update guidelines.

## Related

- [Main Repository](https://github.com/tara-vision/taracode) - Report bugs and feature requests here
- [Security Policy](https://github.com/tara-vision/taracode/security) - Report vulnerabilities

## License

Apache License 2.0 - see [LICENSE](LICENSE) for details.
