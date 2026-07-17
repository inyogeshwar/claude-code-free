# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in this project, please report it responsibly.

**Do NOT open a public issue for security vulnerabilities.**

Instead, please email: {{SECURITY_EMAIL}}

Include:
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

We will acknowledge receipt within 48 hours and provide a resolution timeline.

## Security Guidelines

### API Keys

- **Never commit real API keys** to the repository
- Always use placeholder values like `YOUR_API_KEY_HERE`
- Use environment variables when possible
- Rotate keys regularly

### Settings Files

- Review settings files before using them
- Understand what each environment variable does
- Be cautious with permissions settings
- Use the principle of least privilege

### Provider Trust

- Only use officially documented API endpoints
- Review each provider's terms of service
- Understand data handling practices
- Check provider security policies

### Scripts

- Review scripts before executing
- Scripts should not transmit data externally
- Scripts should not modify system settings without consent
- All scripts are open source and auditable

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.0.x   | Yes       |

## Security Best Practices

1. **Use a dedicated API key** for Claude Code — don't reuse keys from other projects
2. **Enable MFA** on your provider accounts
3. **Monitor usage** regularly for unauthorized activity
4. **Keep dependencies updated** — run `npm audit` periodically
5. **Use `.gitignore`** to exclude sensitive files

## Data Privacy

This repository does not collect, transmit, or store any user data. All communication happens directly between your machine and the configured AI provider.
