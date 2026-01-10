# Contributing to homebrew-taracode

Thank you for your interest in contributing to the Tara Code Homebrew tap!

## Scope

This repository contains only the Homebrew formula for installing Tara Code. For contributions to the main application, please visit [tara-vision/taracode](https://github.com/tara-vision/taracode).

## Reporting Issues

### Formula Issues

If you encounter problems with:
- Installation via `brew install tara-vision/taracode/taracode`
- Checksum mismatches
- Build failures during installation

Please [open an issue](https://github.com/tara-vision/homebrew-taracode/issues/new) here.

### Application Issues

If you encounter problems with:
- Tara Code functionality after installation
- CLI commands or features
- LLM integration

Please report these at the [main repository](https://github.com/tara-vision/taracode/issues).

## Formula Updates

When a new version of Tara Code is released, the formula needs updating:

1. Get the SHA256 of the new release tarball:
   ```bash
   curl -sL https://github.com/tara-vision/taracode/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
   ```

2. Update `Formula/taracode.rb`:
   - Update the `url` to point to the new tag
   - Update `sha256` with the new checksum

3. Submit a pull request with these changes

## Testing Locally

Before submitting a PR, test the formula locally:

```bash
# Check formula syntax
brew audit --strict Formula/taracode.rb

# Install from local formula
brew install --build-from-source ./Formula/taracode.rb

# Run the formula test
brew test taracode

# Verify the binary works
taracode --version
```

## Pull Request Guidelines

- Keep PRs focused on formula changes only
- Include the version number in the PR title (e.g., "Update to v0.2.0")
- Verify the SHA256 checksum is correct
- Ensure `brew audit --strict` passes

## Questions?

If you have questions about this tap, feel free to [open a discussion](https://github.com/tara-vision/taracode/discussions) in the main repository.
