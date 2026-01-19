# README Guide - Two READMEs Explained

This project has **two separate README files** for different purposes:

## 📦 README_PYPI.md (PyPI Package Page)

**Purpose**: Displayed on PyPI when users browse the package
**Location**: `README_PYPI.md`
**Referenced by**: `pyproject.toml` (`readme = "README_PYPI.md"`)

### Characteristics:
- ✅ **Concise** - Gets to the point quickly
- ✅ **Installation-focused** - Emphasizes how to install and use
- ✅ **No images** - PyPI has limited image support
- ✅ **Quick reference** - All controls in easy-to-scan tables
- ✅ **Examples** - Shows common use cases
- ✅ **Links to GitHub** - Points to full documentation

### Target Audience:
- Users browsing PyPI looking for packages
- Developers who want quick installation instructions
- People who need to see if this package meets their needs

## 🌟 README.md (GitHub Repository)

**Purpose**: Main project documentation on GitHub
**Location**: `README.md`
**Referenced by**: GitHub automatically displays this

### Characteristics:
- ✅ **Comprehensive** - Full documentation with all details
- ✅ **Visual** - Includes screenshot at the top
- ✅ **Well-structured** - Multiple sections with navigation
- ✅ **Rich formatting** - Emojis, badges, center-aligned header
- ✅ **Developer-focused** - Includes contributing guide, project structure
- ✅ **Community-oriented** - Links to discussions, issues

### Target Audience:
- Developers exploring the project on GitHub
- Contributors looking to understand the codebase
- Users wanting detailed documentation
- People evaluating the project quality

## Key Differences

| Feature | README_PYPI.md | README.md |
|---------|----------------|-----------|
| Length | ~200 lines | ~300 lines |
| Screenshot | ❌ No | ✅ Yes (assets/screenshot.png) |
| Navigation | ❌ No TOC | ✅ Quick links at top |
| Contributing | ❌ Not included | ✅ Full section |
| Project Structure | ❌ Not included | ✅ Full tree |
| Emojis | ⚠️ Minimal | ✅ Throughout |
| Formatting | Simple | Rich (centered header, etc.) |
| Development Setup | ⚠️ Basic | ✅ Detailed |

## Why Two READMEs?

### PyPI Constraints
- Limited markdown support
- Images may not display well
- Users want quick information
- Focus is on "should I install this?"

### GitHub Advantages
- Full markdown support
- Great image display
- Users want detailed information
- Focus is on "how does this work?"

## Maintenance

When updating documentation:

1. **Installation/Usage changes** → Update **both** files
2. **New features** → Update **both** files
3. **Contributing guidelines** → Update **README.md** only
4. **Project structure** → Update **README.md** only
5. **Quick tips** → Update **both** files
6. **Examples** → Update **both** files

## Publishing

### To PyPI:
```bash
python -m build
twine upload dist/*
```
→ Uses `README_PYPI.md` (configured in pyproject.toml)

### To GitHub:
```bash
git add .
git commit -m "Update documentation"
git push
```
→ Uses `README.md` (GitHub default)

## Best Practices

1. **Keep PyPI README under 300 lines** - Users scan quickly
2. **Make GitHub README comprehensive** - Users expect details
3. **Link from PyPI to GitHub** - For users wanting more info
4. **Update both when adding features** - Keep them in sync
5. **Test PyPI rendering** - Use `twine check dist/*`

## Current Status

- ✅ `README_PYPI.md` created (concise, PyPI-optimized)
- ✅ `README.md` created (comprehensive, GitHub-optimized)
- ✅ `pyproject.toml` configured to use `README_PYPI.md`
- ⏳ Screenshot needs to be added to `assets/screenshot.png`

Once the screenshot is added, both READMEs are ready for publication! 🚀
