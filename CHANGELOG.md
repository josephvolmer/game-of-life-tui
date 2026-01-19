# Changelog

## Version 1.1.1 - Theme Support Fix

### Theme Compatibility
- **Fixed**: CSS now uses theme variables ($surface, $panel) instead of hardcoded colors
- **Result**: Background colors now properly change when selecting different themes
- **Cell colors**: Remain vibrant and consistent (intentional design choice)
- **How to use**: Press `Ctrl+\` to open theme picker while running

### What Changes with Themes
- Grid background adapts to theme
- Header/footer/status bar backgrounds adapt to theme
- Cell age colors stay rainbow (cyan→green→yellow→magenta→blue) for consistency

### Documentation
- Updated README.md with theme instructions
- Updated COLOR_GUIDE.md with theme support section
- Explained why cell colors stay consistent across themes

---

## Version 1.1.0 - Visual Improvements

### Enhanced Color Scheme 🌈

**Cell Age Colors - Meaningful Rainbow Progression**
- Age 1 (Newborn): `bright_cyan` - Fresh, new life
- Age 2 (Young): `bright_green` - Growing strong
- Age 3 (Mature): `bright_yellow` - In their prime
- Age 4 (Old): `bright_magenta` - Wise survivors
- Age 5+ (Ancient): `bright_blue` - Rare elders

**Previous colors**: Grey gradient (white → grey50)
**New colors**: Vibrant rainbow that tells a story

### UI Color Improvements

**Background Colors**
- Main screen: Darker blue (#000814) for better contrast
- Status bar: Dark blue (#001d3d) with gold text (#ffc300)
- Header: Dark blue with cyan accent (#00b4d8)

**Status Bar**
- Playing mode: Bright green (▶ PLAYING)
- Paused mode: Bright yellow (⏸ PAUSED)
- Colorful stat labels: Cyan (Gen), Magenta (Pop), Yellow (Speed)
- Bright blue separators (│)
- Inline keyboard hints in grey

**Cursor Highlight**
- Changed from: Yellow background
- Changed to: Bright red background with bold white text
- More visible and attention-grabbing

### Footer Optimization for 80x24 Terminals

**Streamlined Bindings Display**
- Reduced from 21 visible bindings to 7 essential ones
- Visible: Play, Step, Draw, Random, Clear, Patterns, Quit
- Hidden but functional: Arrow keys, +/-, Esc, Ctrl+S/L, individual pattern numbers

**Result**: Footer now fits comfortably on 80-column terminals

### Additional Help in Status Bar

Added inline keyboard hints:
- "Arrows=move"
- "Space=draw"
- "+/-=speed"

### Documentation

**New Files**
- `COLOR_GUIDE.md` - Comprehensive color meaning guide
- `CHANGELOG.md` - This file

**Updated Files**
- `README.md` - Added rainbow color feature highlights
- `README.md` - Updated Visual Guide section with new colors

### Benefits

1. **More Engaging**: Vibrant colors make the simulation more fun to watch
2. **More Informative**: Colors convey meaningful information about cell age
3. **Better Contrast**: New color scheme easier on the eyes
4. **Fits 80x24**: Optimized for standard terminal sizes
5. **Scientific Insight**: Quickly identify stable vs dynamic regions by color distribution

---

## Version 1.0.0 - Initial Release

- 50×50 toroidal grid
- Conway's Game of Life rules
- Textual-based TUI
- Arrow key navigation
- 5 preset patterns
- Save/load functionality
- Speed control
- Cross-platform support
- 100% pip-installable
