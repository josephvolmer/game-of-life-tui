# Git Helper Scripts

These scripts make it easy to push and pull from GitHub using a Personal Access Token (PAT).

## 🚀 Quick Start

### 1. Setup (One-time)

Get a GitHub token and set it up:

```bash
# Get a token from: https://github.com/settings/tokens
# Generate new token (classic) with 'repo' scope

./scripts/setup-git-token.sh ghp_YOUR_TOKEN_HERE
```

### 2. Push to GitHub

```bash
./scripts/git-push.sh
```

### 3. Pull from GitHub

```bash
./scripts/git-pull.sh
```

### 4. Sync (Pull + Push)

```bash
./scripts/git-sync.sh
```

## 📋 Available Scripts

### `setup-git-token.sh`
**Usage**: `./scripts/setup-git-token.sh YOUR_TOKEN`

Sets up GitHub authentication by:
- Storing your PAT token in `.git/credentials`
- Setting secure file permissions (600)
- Validating token format

**Note**: The token is stored locally and never committed to the repo (it's in `.gitignore`)

### `git-push.sh`
**Usage**: `./scripts/git-push.sh [branch]`

Pushes to GitHub:
- Default branch: `main`
- Temporarily adds token to remote URL
- Pushes your commits
- Removes token from remote URL (cleanup)
- Shows link to GitHub Actions

**Example**:
```bash
./scripts/git-push.sh        # Push to main
./scripts/git-push.sh dev    # Push to dev branch
```

### `git-pull.sh`
**Usage**: `./scripts/git-pull.sh [branch]`

Pulls from GitHub:
- Default branch: `main`
- Temporarily adds token to remote URL
- Pulls latest changes
- Removes token from remote URL (cleanup)

**Example**:
```bash
./scripts/git-pull.sh        # Pull from main
./scripts/git-pull.sh dev    # Pull from dev branch
```

### `git-sync.sh`
**Usage**: `./scripts/git-sync.sh [branch]`

Syncs with GitHub (pull + push):
- Pulls latest changes first
- If successful, pushes your commits
- Convenient for quick sync

**Example**:
```bash
./scripts/git-sync.sh        # Sync main branch
```

## 🔐 Security

### Token Storage
- Token is stored in `.git/credentials` (gitignored)
- File has 600 permissions (only you can read/write)
- Token is never exposed in remote URL permanently

### Token Cleanup
- Scripts temporarily add token to remote URL
- Always cleaned up after operation (success or failure)
- Remote URL stored without token: `https://github.com/...`

### Best Practices
- ✅ Use token with minimal required scopes (`repo` only)
- ✅ Set token expiration (recommended: 90 days)
- ✅ Regenerate tokens periodically
- ✅ Never commit `.git/credentials` file
- ✅ Revoke token if compromised

## 🛠️ Troubleshooting

### "No GitHub PAT token found"
**Solution**: Run `./scripts/setup-git-token.sh YOUR_TOKEN`

### "Invalid token format"
**Solution**: Token should start with `ghp_` or `github_pat_`

### "Permission denied"
**Solutions**:
1. Check token has `repo` scope
2. Verify token is not expired
3. Try regenerating token

### "Push failed"
**Solutions**:
1. Check you're on the right branch: `git branch`
2. Commit your changes first: `git add . && git commit -m "message"`
3. Pull latest changes first: `./scripts/git-pull.sh`

## 🔄 Workflow

Typical development workflow:

```bash
# 1. Make changes to code
vim src/game_of_life_tui/app.py

# 2. Commit changes
git add .
git commit -m "Add new feature"

# 3. Push to GitHub
./scripts/git-push.sh

# 4. Check tests pass
# Visit: https://github.com/josephvolmer/game-of-life-tui/actions
```

Or use the all-in-one sync:

```bash
# Make changes, commit, then:
./scripts/git-sync.sh
```

## 📚 Alternative: GitHub CLI

If you prefer, you can use GitHub CLI instead:

```bash
# One-time setup
gh auth login

# Then use regular git commands
git push
git pull
```

## ⚙️ How It Works

The scripts use a simple pattern:

1. **Read token** from `.git/credentials`
2. **Temporarily modify** remote URL to include token
3. **Run git command** (push/pull)
4. **Restore** clean remote URL
5. **Report** success/failure

This keeps your token secure and never permanently stored in git config.

## 🎓 Learning Resources

- **GitHub PAT Tokens**: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
- **Git Credentials**: https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage
- **GitHub Actions**: https://docs.github.com/en/actions

---

**Need help?** Check the main [DEPLOYMENT.md](../DEPLOYMENT.md) for full deployment guide.
