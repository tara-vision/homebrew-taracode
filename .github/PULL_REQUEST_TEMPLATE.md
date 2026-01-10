## Description

<!-- Briefly describe what this PR does -->

## Type of Change

- [ ] Version update (new release of taracode)
- [ ] Formula fix (fixing installation issues)
- [ ] Documentation update

## Version Update Checklist

If updating to a new version:

- [ ] Updated `url` to new tag
- [ ] Updated `sha256` with correct checksum
- [ ] Verified checksum with: `curl -sL <url> | shasum -a 256`

## Testing

- [ ] Ran `brew audit --strict Formula/taracode.rb`
- [ ] Tested installation with `brew install --build-from-source ./Formula/taracode.rb`
- [ ] Verified `taracode --version` shows correct version
- [ ] Ran `brew test taracode`
