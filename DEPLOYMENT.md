# Deployment Checklist

## Pre-Deployment Checklist

### 1. Add Screenshot ✅
- [x] Save screenshot from provided image
- [x] Rename to `screenshot.png`
- [x] Place in `assets/` folder
- [x] Add logo.png to `assets/` folder
- [x] Update README.md to use both images

### 2. Update Author Information 📝
- [ ] Edit `pyproject.toml` - Update author name and email
- [ ] Edit `src/game_of_life_tui/__init__.py` - Update `__author__`
- [ ] Edit `LICENSE` - Update copyright holder name

### 3. Update Repository URLs 🔗
Update these files with your actual GitHub username:

**pyproject.toml:**
```toml
[project.urls]
Homepage = "https://github.com/YOURUSERNAME/game-of-life-tui"
Repository = "https://github.com/YOURUSERNAME/game-of-life-tui"
Issues = "https://github.com/YOURUSERNAME/game-of-life-tui/issues"
```

**README.md:**
- Line 43: `git clone https://github.com/YOURUSERNAME/...`
- Line 224: `git clone https://github.com/YOURUSERNAME/...`
- Line 290: PyPI link
- Line 291: Issues link
- Line 292: Discussions link

**README_PYPI.md:**
- "Links" section at the bottom

### 4. Test Installation Locally ✅
```bash
# Test editable install
pip install -e .

# Test command works
game-of-life

# Test module execution
python -m game_of_life_tui

# Verify version
python -c "from game_of_life_tui import __version__; print(__version__)"
```

### 5. Test Build 🔨
```bash
# Install build tools
pip install build twine

# Build distribution
python -m build

# Check distribution
twine check dist/*

# Should see:
# Checking dist/game_of_life_tui-1.1.1-py3-none-any.whl: PASSED
# Checking dist/game_of_life_tui-1.1.1.tar.gz: PASSED
```

---

## GitHub Deployment

### 1. Initialize Git Repository
```bash
git init
git add .
git commit -m "Initial commit: Game of Life TUI v1.1.1"
```

### 2. Create GitHub Repository
1. Go to https://github.com/new
2. Repository name: `game-of-life-tui`
3. Description: "Conway's Game of Life in your terminal with rainbow colors"
4. Public repository
5. Don't initialize with README (we have one)
6. Create repository

### 3. Push to GitHub
```bash
git remote add origin https://github.com/YOURUSERNAME/game-of-life-tui.git
git branch -M main
git push -u origin main
```

### 4. Verify GitHub
- [ ] Screenshot displays correctly
- [ ] Badges show properly
- [ ] All markdown files render correctly
- [ ] Links work
- [ ] GitHub Actions workflows are in `.github/workflows/`

### 5. Wait for Tests to Complete
After pushing, GitHub Actions will automatically:
- Run tests on Ubuntu, macOS, and Windows
- Test Python 3.8, 3.9, 3.10, 3.11, 3.12
- Verify imports and build

Check: `https://github.com/YOURUSERNAME/game-of-life-tui/actions`

### 6. Create Release (Optional)
1. Go to Releases → Create a new release
2. Tag version: `v1.1.1`
3. Release title: `v1.1.1 - Rainbow Colors & Theme Support`
4. Description: Copy from CHANGELOG.md
5. Publish release

---

## PyPI Deployment (Using Trusted Publisher)

### Method 1: Automated via GitHub Actions (Recommended)

This method uses OpenID Connect (OIDC) trusted publishing - no API tokens needed!

#### Step 1: Create PyPI Account
1. Sign up at https://pypi.org/account/register/
2. Verify email
3. Enable 2FA (required for trusted publishers)

#### Step 2: Configure Trusted Publisher on PyPI
1. Go to your PyPI account: https://pypi.org/manage/account/publishing/
2. Scroll to "Pending publishers" section
3. Click "Add a new pending publisher"
4. Fill in:
   - **PyPI Project Name**: `game-of-life-tui`
   - **Owner**: Your GitHub username
   - **Repository name**: `game-of-life-tui`
   - **Workflow name**: `publish.yml`
   - **Environment name**: `pypi`
5. Click "Add"

**Note**: The project doesn't need to exist on PyPI first! This creates a "pending publisher" that will work on first publish.

#### Step 3: Create GitHub Environment
1. Go to your repo: `https://github.com/YOURUSERNAME/game-of-life-tui`
2. Go to Settings → Environments
3. Click "New environment"
4. Name: `pypi`
5. Add protection rules (optional):
   - Required reviewers (recommended)
   - Wait timer
6. Save

#### Step 4: Publish to PyPI
1. Go to Actions tab in your GitHub repo
2. Select "Publish to PyPI" workflow
3. Click "Run workflow"
4. Enter the version: `1.1.1`
5. Click "Run workflow"
6. Wait for workflow to complete (~2-3 minutes)

The workflow will:
- ✅ Validate version numbers match
- ✅ Run sanity tests
- ✅ Build distribution
- ✅ Publish to PyPI (using trusted publisher)
- ✅ Verify installation from PyPI

#### Step 5: Verify PyPI
- [ ] Package appears at https://pypi.org/project/game-of-life-tui/
- [ ] README displays correctly
- [ ] Version is correct (1.1.1)
- [ ] Links work
- [ ] Try installing: `pip install game-of-life-tui`

---

### Method 2: Manual Publishing (Alternative)

If you prefer manual control or trusted publishing isn't working:

#### 1. Create API Token on PyPI
1. Go to Account Settings → API tokens
2. Click "Add API token"
3. Token name: "game-of-life-tui"
4. Scope: "Entire account" or specific project
5. **Save the token** - you won't see it again!

#### 2. Build and Upload
```bash
# Clean old builds
rm -rf dist/ build/ *.egg-info

# Build fresh
python -m build

# Check distribution
twine check dist/*

# Upload to PyPI
twine upload dist/*
# When prompted, use:
# Username: __token__
# Password: pypi-YOUR_TOKEN_HERE
```

---

## GitHub Actions Workflows

### Test Workflow (`.github/workflows/test.yml`)
**Triggers**: Automatically on push to `main` or pull requests

**What it does**:
- Tests on Ubuntu, macOS, Windows
- Tests Python 3.8, 3.9, 3.10, 3.11, 3.12
- Installs package and verifies imports
- Runs game logic tests
- Builds and validates distribution
- Lints code

**Matrix**: 15 test combinations (3 OS × 5 Python versions)

### Publish Workflow (`.github/workflows/publish.yml`)
**Triggers**: Manual only (workflow_dispatch)

**What it does**:
1. **Validate**: Checks version numbers match across files
2. **Build**: Creates distribution files
3. **Publish**: Uploads to PyPI using trusted publisher
4. **Verify**: Tests installation from PyPI

**Security**: Uses OpenID Connect trusted publishing (no API tokens in secrets)

---

## Post-Deployment

### 1. Test Installation from PyPI
```bash
# Create fresh virtual environment
python -m venv test_env
source test_env/bin/activate  # or `test_env\Scripts\activate` on Windows

# Install from PyPI
pip install game-of-life-tui

# Test
game-of-life

# Deactivate and cleanup
deactivate
rm -rf test_env
```

### 2. Update README Badges (Optional)
Once on PyPI, update badges in README.md:
```markdown
![PyPI version](https://img.shields.io/pypi/v/game-of-life-tui.svg)
![PyPI downloads](https://img.shields.io/pypi/dm/game-of-life-tui.svg)
```

### 3. Share! 🎉
- Post on Reddit: r/Python, r/programming, r/cellular_automata
- Share on Twitter/X with hashtags: #Python #GameOfLife #TUI
- Post on Hacker News
- Share on Discord Python communities

---

## Future Updates

### Version Bump Process
1. Update version in:
   - `pyproject.toml`
   - `src/game_of_life_tui/__init__.py`
2. Update `CHANGELOG.md` with changes
3. Commit changes
4. Create git tag: `git tag v1.x.x`
5. Push: `git push && git push --tags`
6. Build and upload to PyPI

### Quick Update Command
```bash
# Clean, build, and upload
rm -rf dist/ build/ *.egg-info && \
python -m build && \
twine check dist/* && \
twine upload dist/*
```

---

## Troubleshooting

### Build Fails
```bash
pip install --upgrade build setuptools wheel
```

### Twine Upload Fails
- Check token is correct
- Ensure version number is incremented (can't re-upload same version)
- Verify package name is available on PyPI

### Screenshot Not Showing on GitHub
- Check file path: `assets/screenshot.png`
- Ensure file is committed to git
- Wait a few minutes for GitHub cache

---

## Current Status

- ✅ Package structure complete
- ✅ Documentation written
- ✅ Code tested locally
- ✅ README files created (both PyPI and GitHub)
- ✅ Screenshot and logo added to assets/
- ✅ README.md updated with logo and screenshot
- ⏳ Author info needs updating
- ⏳ GitHub URLs need updating
- ⏳ Ready for deployment after completing above

**You're almost ready to ship! 🚀**
