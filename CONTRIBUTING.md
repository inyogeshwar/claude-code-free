# Contributing to Claude Code Free

Thank you for your interest in contributing! This document provides guidelines and steps for contributing.

## How to Contribute

### Reporting Bugs

1. Check [existing issues](https://github.com/inyogeshwar/claude-code-free/issues) first
2. Open a new issue with:
   - Clear title
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - OS and provider used

### Suggesting Features

1. Open an issue with the `enhancement` label
2. Describe the feature and its use case
3. Note if you're willing to implement it

### Adding a New Provider

1. Fork the repository
2. Create `settings/settings-PROVIDERNAME.json` using placeholder API keys
3. Create `docs/providers/PROVIDERNAME.md` with:
   - Overview
   - Official website and documentation links
   - Base URL
   - Authentication method
   - Free tier availability
   - Pros and cons
   - Ready-to-use settings example
   - Troubleshooting tips
4. Add the provider to the comparison table in `README.md`
5. Add a referral placeholder link (e.g., `{{PROVIDER_REFERRAL_LINK}}`)
6. Submit a pull request

### Improving Documentation

- Fix typos and grammar
- Add examples and screenshots
- Improve clarity
- Translate to other languages

### Code Contributions

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Test on at least one platform
5. Commit with a clear message
6. Push and open a PR

## Development Setup

```bash
git clone https://github.com/YOUR_USERNAME/claude-code-free.git
cd claude-code-free
```

## Style Guide

- Use Markdown for documentation
- Use 2-space indentation for JSON
- Use descriptive commit messages
- Keep settings files minimal and secure

## Pull Request Process

1. Update documentation if needed
2. Add your changes to `CHANGELOG.md`
3. Ensure all links work
4. Request review from maintainers

## Security

**Never commit real API keys.** Always use placeholders like `YOUR_API_KEY_HERE` or `sk-your-key-here`.

See [SECURITY.md](SECURITY.md) for more details.

## Code of Conduct

Please follow our [Code of Conduct](CODE_OF_CONDUCT.md).

## Questions?

Open a [discussion](https://github.com/inyogeshwar/claude-code-free/discussions) or reach out to the maintainers.
