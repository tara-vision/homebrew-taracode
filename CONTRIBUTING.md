# Contributing to homebrew-taracode

Thank you for helping keep the taracode tap healthy.

## Scope

This repository holds only the Homebrew cask for taracode. Changes to taracode itself belong in the
[main repository](https://github.com/tara-vision/taracode).

## Reporting issues

- Installation, upgrade, checksum or quarantine problems with the cask: [open an issue here](https://github.com/tara-vision/homebrew-taracode/issues/new/choose).
- Anything that happens after installation (commands, tools, models, Ollama): [tara-vision/taracode/issues](https://github.com/tara-vision/taracode/issues).

## The cask is generated

`Casks/taracode.rb` is written by GoReleaser on every stable release of taracode, with the checksums of
the published binaries. Please do not send pull requests that edit the cask by hand; if a release produced
a broken cask, open an issue and the fix ships with the next release. Pull requests are welcome for this
repository's documentation and templates.

## Testing a cask locally

```bash
brew audit --cask ./Casks/taracode.rb
brew install --cask ./Casks/taracode.rb
taracode --version
```

## Questions

[GitHub Discussions](https://github.com/tara-vision/taracode/discussions) in the main repository.
