# Git Quick Start Guide

## 🚀 Push to GitHub in 2 Steps

### Step 1: Setup Token (One-time)

```bash
# Get your token from: https://github.com/settings/tokens
# Click "Generate new token (classic)"
# Select scope: "repo"
# Copy the token

./scripts/setup-git-token.sh ghp_YOUR_TOKEN_HERE
```

### Step 2: Push!

```bash
./scripts/git-push.sh
```

That's it! 🎉

## 📋 Quick Reference

```bash
# One-time setup
./scripts/setup-git-token.sh ghp_YOUR_TOKEN

# Push to GitHub
./scripts/git-push.sh

# Pull from GitHub
./scripts/git-pull.sh

# Sync (pull + push)
./scripts/git-sync.sh
```

## 🔗 After First Push

Visit your repo to see:
- ✨ Beautiful README with logo and screenshot
- 🧪 Tests running automatically
- 📦 Ready to publish to PyPI

**Your repo**: https://github.com/josephvolmer/game-of-life-tui

**Actions**: https://github.com/josephvolmer/game-of-life-tui/actions

---

**Full docs**: See [scripts/README.md](scripts/README.md)
