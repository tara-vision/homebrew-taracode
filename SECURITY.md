# Security Policy

## Reporting a vulnerability

For a vulnerability in taracode itself, use the private report form of the main repository:
[tara-vision/taracode](https://github.com/tara-vision/taracode/security/advisories/new).

For an issue specific to this tap (an insecure download URL, a checksum that does not match a published
release, a cask that does something it should not), use the
[Security tab](https://github.com/tara-vision/homebrew-taracode/security) of this repository and click
"Report a vulnerability". Reports are acknowledged within 48 hours.

Every taracode release publishes `checksums.txt`, a Sigstore bundle and SLSA provenance next to its
binaries, so a cask's checksums can be verified against the release independently of Homebrew.
