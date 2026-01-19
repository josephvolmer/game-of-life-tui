# GitHub Actions Workflows Guide

This project includes two automated GitHub Actions workflows for testing and publishing.

## 📋 Overview

| Workflow | File | Trigger | Purpose |
|----------|------|---------|---------|
| **Tests** | `.github/workflows/test.yml` | Automatic (push/PR) | Cross-platform testing |
| **Publish** | `.github/workflows/publish.yml` | Manual only | PyPI publication |

---

## 🧪 Test Workflow

### When It Runs

**Automatically triggers on:**
- Push to `main` branch
- Pull requests to `main` branch

### What It Tests

#### Matrix Testing (15 combinations)
- **Operating Systems**: Ubuntu, macOS, Windows
- **Python Versions**: 3.8, 3.9, 3.10, 3.11, 3.12

#### Test Steps

1. **Installation Test**
   - Installs package in editable mode
   - Verifies imports work
   - Checks command is available

2. **Game Logic Tests**
   - Grid creation and manipulation
   - Cell toggling
   - Neighbor counting
   - Generation stepping
   - Pattern loading
   - Clear functionality

3. **Build Test**
   - Builds distribution (wheel + sdist)
   - Validates with `twine check`
   - Uploads artifacts (Ubuntu Python 3.12 only)

4. **Lint Check**
   - Verifies all imports
   - Checks code quality

### Viewing Results

1. Go to your repo on GitHub
2. Click "Actions" tab
3. See test results for each commit

### Test Badge

Add to README.md:
```markdown
![Tests](https://github.com/YOURUSERNAME/game-of-life-tui/actions/workflows/test.yml/badge.svg)
```

---

## 📦 Publish Workflow

### When It Runs

**Manual trigger only** - You must run it explicitly when ready to publish.

### How to Run

1. Go to your repo → Actions tab
2. Select "Publish to PyPI" workflow
3. Click "Run workflow" button
4. Enter the version (e.g., `1.1.1`)
5. Click "Run workflow"

### What It Does

#### Job 1: Validate Version
```
✓ Checks pyproject.toml version
✓ Checks __init__.py version
✓ Ensures they match the input version
```

#### Job 2: Build Distribution
```
✓ Installs dependencies
✓ Runs sanity tests
✓ Cleans previous builds
✓ Builds wheel and source distribution
✓ Validates with twine check
✓ Uploads artifacts
```

#### Job 3: Publish to PyPI
```
✓ Downloads distribution artifacts
✓ Publishes to PyPI using trusted publisher
✓ No API tokens needed (OIDC authentication)
```

#### Job 4: Verify Publication
```
✓ Waits 60 seconds for PyPI to update
✓ Installs package from PyPI
✓ Verifies installation works
✓ Tests command execution
```

### Security: Trusted Publisher

This workflow uses **OpenID Connect (OIDC) trusted publishing**:

#### Benefits
- ✅ No API tokens to manage
- ✅ No secrets to store
- ✅ Automatic authentication via GitHub
- ✅ More secure than token-based auth
- ✅ Recommended by PyPI

#### How It Works
1. PyPI trusts your GitHub repository
2. GitHub provides a temporary token (OIDC)
3. PyPI validates the token
4. Publish succeeds without storing credentials

#### Required Permissions
```yaml
permissions:
  id-token: write  # REQUIRED for trusted publishing
```

---

## 🔧 Setup Instructions

### For Test Workflow

**No setup required!** It works automatically once you push to GitHub.

### For Publish Workflow

#### 1. Create PyPI Account
- https://pypi.org/account/register/
- Verify email
- **Enable 2FA** (required for trusted publishers)

#### 2. Add Trusted Publisher on PyPI

1. Go to: https://pypi.org/manage/account/publishing/
2. Scroll to "Pending publishers"
3. Click "Add a new pending publisher"
4. Fill in:
   ```
   PyPI Project Name: game-of-life-tui
   Owner: YourGitHubUsername
   Repository name: game-of-life-tui
   Workflow name: publish.yml
   Environment name: pypi
   ```
5. Click "Add"

**Important**: You do this **before** the package exists on PyPI! This creates a "pending publisher" that will work on first publish.

#### 3. Create GitHub Environment

1. Go to your repo → Settings → Environments
2. Click "New environment"
3. Name: `pypi` (must match workflow)
4. (Optional) Add protection rules:
   - Required reviewers
   - Wait timer
5. Save

#### 4. First Publish

Now you're ready! Go to Actions → Publish to PyPI → Run workflow

---

## 🎯 Publishing Checklist

Before running the publish workflow:

- [ ] All tests passing on main branch
- [ ] Version bumped in:
  - [ ] `pyproject.toml`
  - [ ] `src/game_of_life_tui/__init__.py`
- [ ] CHANGELOG.md updated
- [ ] Commit and push all changes
- [ ] PyPI trusted publisher configured
- [ ] GitHub environment `pypi` created

---

## 🐛 Troubleshooting

### Test Workflow Failing

**Import errors:**
- Check `pyproject.toml` dependencies
- Verify package structure

**Build errors:**
- Ensure `pyproject.toml` is valid
- Check for missing files

**Platform-specific failures:**
- Review the specific OS/Python combo logs
- May need platform-specific fixes

### Publish Workflow Failing

**Version mismatch error:**
```
Error: pyproject.toml version does not match input
```
**Fix**: Update version in both `pyproject.toml` and `__init__.py`

**Trusted publisher error:**
```
Error: Missing OIDC token
```
**Fix**: Ensure:
1. Trusted publisher added on PyPI
2. GitHub environment named `pypi` exists
3. Environment name matches in workflow

**Package already exists:**
```
Error: File already exists
```
**Fix**: Bump version number - can't republish same version

**Authentication failed:**
```
Error: Invalid or non-existent authentication
```
**Fix**:
1. Check PyPI trusted publisher configuration
2. Verify Owner/Repository names match exactly
3. Ensure 2FA enabled on PyPI

---

## 🔄 Version Update Process

When releasing a new version:

### 1. Update Version Numbers
```bash
# Edit these files:
# - pyproject.toml (line 7)
# - src/game_of_life_tui/__init__.py (line 6)

# Example: 1.1.1 → 1.2.0
```

### 2. Update CHANGELOG.md
```markdown
## Version 1.2.0 - New Features

### Added
- Feature 1
- Feature 2

### Fixed
- Bug fix 1
```

### 3. Commit and Push
```bash
git add .
git commit -m "Bump version to 1.2.0"
git push
```

### 4. Wait for Tests
- Check Actions tab
- Ensure all tests pass

### 5. Publish
- Go to Actions → Publish to PyPI
- Run workflow with version `1.2.0`
- Wait ~3 minutes

### 6. Verify
```bash
pip install game-of-life-tui==1.2.0
game-of-life
```

### 7. Create GitHub Release (Optional)
- Go to Releases → Draft new release
- Tag: `v1.2.0`
- Title: `v1.2.0 - New Features`
- Description: Copy from CHANGELOG.md
- Publish

---

## 📊 Workflow Status

### Check Test Status
```
https://github.com/YOURUSERNAME/game-of-life-tui/actions/workflows/test.yml
```

### Check Publish History
```
https://github.com/YOURUSERNAME/game-of-life-tui/actions/workflows/publish.yml
```

### View Workflow Files
```
.github/workflows/test.yml
.github/workflows/publish.yml
```

---

## 🎓 Best Practices

### Testing
1. ✅ Always wait for tests to pass before publishing
2. ✅ Test locally first: `pip install -e .`
3. ✅ Review failed test logs carefully
4. ✅ Test on multiple Python versions locally if needed

### Publishing
1. ✅ Use semantic versioning (MAJOR.MINOR.PATCH)
2. ✅ Update CHANGELOG.md before each release
3. ✅ Create GitHub releases for major versions
4. ✅ Test installation from PyPI after publishing
5. ✅ Never skip version numbers

### Security
1. ✅ Use trusted publisher (no API tokens in repo)
2. ✅ Enable 2FA on PyPI account
3. ✅ Add required reviewers to `pypi` environment
4. ✅ Review workflow runs before they execute
5. ✅ Keep dependencies updated

---

## 📚 Resources

- **GitHub Actions Docs**: https://docs.github.com/en/actions
- **PyPI Trusted Publishers**: https://docs.pypi.org/trusted-publishers/
- **Python Packaging Guide**: https://packaging.python.org/
- **Semantic Versioning**: https://semver.org/

---

## 🎉 Summary

Your project now has:
- ✅ Automated cross-platform testing
- ✅ Secure PyPI publishing via trusted publisher
- ✅ No API tokens to manage
- ✅ Version validation
- ✅ Post-publish verification

Ready to ship! 🚀
